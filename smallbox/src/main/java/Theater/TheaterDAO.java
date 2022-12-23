package Theater;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DB.JdbcUtil;

public class TheaterDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null, pstmt2 = null;
	ResultSet rs = null;

	public int insertTheater(TheaterDTO theater) {
		int insertCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			// 1. 극장 번호 구하기
			int theater_idx = 1;
			
			String sql = "SELECT MAX(theater_idx) FROM theater";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				theater_idx = rs.getInt(1) + 1;
			}
			
			// 2. 극장 등록
			sql = "INSERT INTO theater VALUES(?,?,?,?,?,?)";
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
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(con);
		}
		
		return insertCount;
	}
}
