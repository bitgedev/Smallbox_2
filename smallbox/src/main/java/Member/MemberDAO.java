package Member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.JdbcUtil;

public class MemberDAO {

	Connection con = null;
	PreparedStatement pstmt = null, pstmt2 = null;;
	ResultSet rs = null;
	
	// 회원가입
	public int insertMember(MemberDTO member) {
		int insertCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			// 1. 회원 번호 구하기
			int member_idx = 1;
			
			String sql = "SELECT MAX(member_idx) FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member_idx = rs.getInt(1) + 1;
			}
			
			// 2. 회원가입 
			sql = "INSERT INTO member VALUES(?,?,?,?,?,?,now(),?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, member_idx);
			pstmt2.setString(2, member.getMember_id());
			pstmt2.setString(3, member.getMember_passwd());
			pstmt2.setString(4, member.getMember_passwd());
			pstmt2.setString(5, member.getMember_email());
			pstmt2.setString(6, member.getMember_phone());
			pstmt2.setDate(7, member.getMember_birth_date());
			
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertMember()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
	
	// 로그인
	public boolean login(MemberDTO member) {
		boolean isLoginSuccess = false;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT member_id FROM member WHERE member_id = ? AND member_passwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_passwd());
			
			rs = pstmt.executeQuery();
			
			// 아이디와 비밀번호가 일치하는 조회결과가 존재하면 isLoginSuccess을 true로 변경
			if(rs.next()) {
				isLoginSuccess = true;
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - login()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
				
		return isLoginSuccess;
	}
	
	// 관리자페이지 - 회원관리 (회원 목록 출력)
	public List<MemberDTO> selectMemberList() {
		List<MemberDTO> memberList = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			memberList = new ArrayList<MemberDTO>();
			
			while(rs.next()) {
				MemberDTO member = new MemberDTO();
				member.setMember_idx(rs.getInt("member_idx"));
				member.setMember_id(rs.getString("member_id"));
				member.setMember_passwd(rs.getString("member_passwd"));
				member.setMember_name(rs.getString("member_name"));
				member.setMember_email(rs.getString("member_email"));
				member.setMember_phone(rs.getString("member_phone"));
				member.setMember_join_date(rs.getDate("member_join_date"));
				member.setMember_birth_date(rs.getDate("member_birth_date"));
				
				memberList.add(member);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectMember()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return memberList;
	}
	
	// 마이페이지 - 회원 정보 출력
	public MemberDTO selectMember(String sId) {
		MemberDTO member = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM member WHERE member_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				member.setMember_idx(rs.getInt("member_idx"));
				member.setMember_id(rs.getString("member_id"));
				member.setMember_passwd(rs.getString("member_passwd"));
				member.setMember_name(rs.getString("member_name"));
				member.setMember_email(rs.getString("member_email"));
				member.setMember_phone(rs.getString("member_phone"));
				member.setMember_join_date(rs.getDate("member_join_date"));
				member.setMember_birth_date(rs.getDate("member_birth_date"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectMember()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(con);
		}
		
		return member;
	}
}
