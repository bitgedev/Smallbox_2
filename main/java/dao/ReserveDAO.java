package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.ReserveBean;


public class ReserveDAO {
		// ------------ 싱글톤 디자인 패턴을 활용한 ReserveDAO 인스턴스 생성 작업 -------------
		// 1. 외부에서 인스턴스 생성이 불가능하도록 생성자를 private 접근제한자로 선언
		// 2. 자신의 클래스 내에서 직접 인스턴스를 생성하여 멤버변수에 저장
		//    => 인스턴스 생성없이 클래스가 메모리에 로딩될 때 함께 로딩되도록 static 변수로 선언
		//    => 외부에서 접근하여 함부로 값을 변경할 수 없도록 private 접근제한자로 선언
		// 3. 생성된 인스턴스를 외부로 리턴하는 Getter 메서드 정의
		//    => 인스턴스 생성없이 클래스가 메모리에 로딩될 때 함께 로딩되도록 static 메서드로 선언
		//    => 누구나 접근 가능하도록 public 접근제한자로 선언
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		private ReserveDAO() {}
		
		private static ReserveDAO instance = new ReserveDAO();

		public static ReserveDAO getInstance() {
			return instance;
		}
		// ----------------------------------------------------------------------------------
		// 데이터베이스 접근에 사용할 Connection 객체를 Service 객체로부터 전달받기 위한
		// Connection 타입 멤버변수 선언 및 Setter 메서드 정의
		private Connection con;

		public void setConnection(Connection con) {
			this.con = con;
		}
		// 예약내역(목록) 조회
		public List<ReserveBean> selectReserveList(String sId) {
			List<ReserveBean> reserveList = null;
			try {
				String sql = "SELECT * FROM reserve "
									+ "WHERE member_id=? "
									+ "ORDER BY res_time DESC";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,sId);
				rs = pstmt.executeQuery();
				
				// 전체 목록 저장할 List 객체 생성
				reserveList = new ArrayList<ReserveBean>();
				
				// 조회 결과가 있을 경우
				while(rs.next()) {
					// ReserveBean 객체(reserve) 생성 후 조회 데이터 저장
					ReserveBean reserve = new ReserveBean();
					reserve.setRes_num(rs.getInt("res_num"));
					reserve.setMovie_title(rs.getString("movie_title"));
					reserve.setMember_id(rs.getString("member_id"));
					reserve.setRes_date(rs.getDate("res_date"));
					reserve.setRes_time(rs.getTime("res_time"));
					reserve.setRes_seat(rs.getString("res_seat"));
					System.out.println(reserve);
					// 전체 목록 저장하는 List 객체에 1개 게시물 정보가 저장된 ReserveBean 객체 추가
					reserveList.add(reserve);
				}
				
			} catch (SQLException e) {
				System.out.println("ReserveDAO - selectReserveList()");
				e.printStackTrace();
			} finally {
				// DB 자원 반환
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			
			return reserveList;
		}
		//예약 취소가능한 시간 판별
		public boolean isTimeOk(int res_num) {//, String res_date ->파라미터 일단 뺐음.
			boolean isTimeOk = false;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT * FROM reserve WHERE res_num=?";
//				 AND res_date=? > now() -> 일단 쿼리문에서 뺐음.
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, res_num);
//				pstmt.setString(2, res_date);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					isTimeOk = true;
				}
			} catch (SQLException e) {
				System.out.println("isTimeOk()");
				e.printStackTrace();
			}
			return isTimeOk;
		}
		
		//예약 내역 취소(삭제)
		public int cancelReserve(int res_num) {
			int cancelCount = 0;
			PreparedStatement pstmt = null;
			try {
				String sql = "DELETE FROM reserve WHERE res_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, res_num);
				cancelCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("cancelReserve()");
				e.printStackTrace();
			} finally {
				JdbcUtil.close(pstmt);
			}
			return cancelCount;
		}
		// 예약 상세정보 조회
		public ReserveBean selectReserve(int res_num) {
			ReserveBean reserve = null;
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				// reserve 테이블에서 예약번호(res_num)가 일치하는 1개 레코드 조회
				String sql = "SELECT * FROM reserve "
									+ "WHERE res_num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, res_num);
				rs = pstmt.executeQuery();
				
				// 조회 결과가 있을 경우
				if(rs.next()) {
					// BoardBean 객체(board) 생성 후 조회 데이터 저장
					reserve = new ReserveBean();
					reserve.setRes_num(rs.getInt("res_num"));
					reserve.setRes_date(rs.getDate("res_date"));
					reserve.setRes_time(rs.getTime("res_time"));
					reserve.setRes_seat(rs.getString("res_seat"));
					reserve.setMovie_title(rs.getString("movie_title"));
					reserve.setMember_id(rs.getString("member_id"));
					reserve.setTheater_idx(rs.getInt("theatere_idx"));
					reserve.setRes_pay_type(rs.getInt("res_pay_type"));
					reserve.setRes_pay(rs.getInt("res_pay"));
//					System.out.println(reserve);
				}
				
			} catch (SQLException e) {
				System.out.println("ReserveDao - selectReserve()");
				e.printStackTrace();
			} finally {
				// DB 자원 반환
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			
			return reserve;
		}
}
