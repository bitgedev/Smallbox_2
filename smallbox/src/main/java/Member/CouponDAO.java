package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.JdbcUtil;

public class CouponDAO {
	Connection con = null;
	PreparedStatement pstmt = null, pstmt2 = null;;
	ResultSet rs = null;
	
	// 쿠폰 지급
	public int insertCoupon(CouponDTO coupon) {
		int insertCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			int coupon_idx = 1;
			
			String sql = "SELECT MAX(coupon_idx) FROM coupon";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				coupon_idx = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO coupon VALUES(?,?,?,?,now(),?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setString(1, coupon.getMember_id()); // 부모값에 있는 값만 넣을수 있음
			pstmt2.setInt(2, coupon_idx);
			pstmt2.setString(3, coupon.getCoupon_type());  
			pstmt2.setInt(4, coupon.getCoupon_rate()); // 할인율 -> 얘를 어떻게 적용해야할까..
			pstmt2.setDate(5, coupon.getCoupon_end_date());
			
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertCoupon()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 쿠폰 지급 조회
	public CouponDTO selectCoupon() { // 각 쿠폰을 조회하려면 파라미터로 쿠폰idx 필요
		CouponDTO coupon = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM coupon"; // where 조건에 쿠폰idx 넣기
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				coupon = new CouponDTO();
				coupon.setMember_id(rs.getString("member_id"));
				coupon.setCoupon_type(rs.getString("coupon_type"));
				coupon.setCoupon_rate(rs.getInt("coupon_rate"));
				coupon.setCoupon_date(rs.getDate("coupon_date"));
				coupon.setCoupon_end_date(rs.getDate("coupon_end_date"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectMemberCoupon()");
			e.printStackTrace();
		}
		
		return coupon;
	}
	
	// 마이페이지 - 쿠폰 내역 조회
	public List<CouponDTO> selectMemberCoupon(MemberDTO member) { 
		List<CouponDTO> couponlist = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String member_id = member.getMember_id(); // member 테이블의 member_id를 가져옴
			System.out.print(member_id); 
			
			String sql = "SELECT * FROM coupon WHERE member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id); // member 테이블의 member_id와 coupon 테이블의 member_id 비교해야함
			rs = pstmt.executeQuery();
			
			couponlist = new ArrayList<CouponDTO>();
			
			while(rs.next()) {
				CouponDTO coupon = new CouponDTO();
				coupon.setCoupon_type(rs.getString("coupon_type"));
				coupon.setCoupon_rate(rs.getInt("coupon_rate"));
				coupon.setCoupon_date(rs.getDate("coupon_date"));
				coupon.setCoupon_end_date(rs.getDate("coupon_end_date"));
				
				couponlist.add(coupon);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectMemberCoupon()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return couponlist;
	}
}
