package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.TheaterBean;

public class TheaterDAO {
	
	// 싱글톤 패턴
	private TheaterDAO() {}
	private static TheaterDAO instance = new TheaterDAO();
	public static TheaterDAO getInstance() {
		return instance;
	}
		
	// DB연결
	private Connection con;
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 관리자 - 상영일정 등록
	public int insertTheater(TheaterBean theater) {
		System.out.println("TheaterDAO - insertTheater()");
		int insertCount = 0;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		
		try {
			int theater_idx = 1;
			String sql = "SELECT MAX(theater_idx) FROM theater";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				theater_idx = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO theater VALUES (?,?,?,?,?,?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, theater_idx);
			pstmt2.setString(2, theater.getTheater_title());
			pstmt2.setDate(3, theater.getTheater_date());
			pstmt2.setTime(4, theater.getTheater_time());
			pstmt2.setInt(5, theater.getTheater_reserved());
			pstmt2.setInt(6, theater.getTheater_seat());
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertTheater()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(pstmt);
			// Connection 객체는 Service 클래스가 관리하므로 DAO 에서 반환 금지!
		}
		return insertCount; // TheaterInsertProService
	}
	
	// 관리자 - 상영 영화(극장) 조회
	public List<TheaterBean> selectTheaterList(String keyword, int startRow, int listLimit) {
		System.out.println("TheaterDAO - selectTheaterList()");
		List<TheaterBean> theaterList = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM theater "
					+ "WHERE theater_title "
					+ "LIKE ? "
					+ "ORDER BY theater_idx DESC "
					+ "LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, listLimit);
			rs = pstmt.executeQuery();
			
			theaterList = new ArrayList<TheaterBean>();
			
			while(rs.next()) {
				TheaterBean theater = new TheaterBean();
				theater.setTheater_idx(rs.getInt("theater_idx"));
				theater.setTheater_title(rs.getString("theater_title"));
				theater.setTheater_date(rs.getDate("theater_date"));
				theater.setTheater_time(rs.getTime("theater_time"));
				theater.setTheater_reserved(rs.getInt("theater_reserved"));
				theater.setTheater_seat(rs.getInt("theater_seat"));
				theaterList.add(theater);
			}	
		} catch (SQLException e) {
			System.out.println("TheaterDAO - selectTheaterList()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return theaterList; // AdminTheaterListService
	}
	
	// 전체 상영극장 수 조회
	public int getTheaterListCount(String keyword) {
		System.out.println("TheaterDAO - getTheaterListCount()");
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) FROM theater WHERE theater_title LIKE ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - getTheaterListCount()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			// Connection 객체는 Service 클래스가 관리하므로 DAO 에서 반환 금지!
		}
		return listCount;
	}

	// 관리자 - 상영 영화(극장) 상세정보
	public TheaterBean selectTheaterDetail(int theater_idx) {
		System.out.println("TheaterDAO - selectTheaterDetail()");
		TheaterBean theater = null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM theater WHERE theater_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, theater_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				theater = new TheaterBean();
				theater.setTheater_idx(rs.getInt("theater_idx"));
				theater.setTheater_title(rs.getString("theater_title"));
				theater.setTheater_date(rs.getDate("theater_date"));
				theater.setTheater_time(rs.getTime("theater_time"));
				theater.setTheater_reserved(rs.getInt("theater_reserved"));
				theater.setTheater_seat(rs.getInt("theater_seat"));
			}
		} catch (SQLException e) {
			System.out.println("TheaterDAO - selectTheaterDetail()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return theater; // AdminTheaterService
	}

	// 관리자 - 상영 영화(극장) 상세정보 수정
	public int ModifyTheater(TheaterBean theater) {
		System.out.println("TheaterDAO - ModifyTheater()");
		int UpdateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE theater SET "
					+ "theater_title=?, "
					+ "theater_date=?, "
					+ "theater_time=?, "
					+ "theater_reserved=?, "
					+ "theater_seat=? "
					+ "WHERE theater_idx=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,theater.getTheater_title());
			pstmt.setDate(2, theater.getTheater_date());
			pstmt.setTime(3, theater.getTheater_time());
			pstmt.setInt(4, theater.getTheater_reserved());
			pstmt.setInt(5, theater.getTheater_seat());
			pstmt.setInt(6, theater.getTheater_idx());
			
			UpdateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - ModifyTheater()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			// Connection 객체는 Service 클래스가 관리하므로 DAO 에서 반환 금지!
		}
		return UpdateCount;
	}

	// 관리자 - 상영 영화(극장) 삭제
	public int deleteTheater(int theater_idx) {
		System.out.println("TheaterDAO - deleteTheater()");
		int deleteCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM theater WHERE theater_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, theater_idx);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - deleteTheater()");
			e.printStackTrace();
		}	
		return deleteCount;
	}	
		
} // TheaterDAO 클래스 끝
