package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.CommentBean;

public class CommentDAO {
	
	PreparedStatement pstmt = null, pstmt2 = null;
	ResultSet rs = null;
	
	//----------------------------------------------------
	// 싱글톤 패턴
	private static CommentDAO instance = new CommentDAO();

	public static CommentDAO getInstance() {
		return instance;
	}

	//-----------------------------------------------------
	private Connection con;

	public void setConnection(Connection con) {
		this.con = con;
	}


	//-----------------------------------------------------
	// DB 작업

	// 리뷰 목록 출력 : 최근 작성순 정렬
	public List<CommentBean> selectReviewList(String member_id) {
		List<CommentBean> reviewList = null;
		
		try {
			String sql = "SELECT * FROM comment WHERE member_id = ? ORDER BY comment_date DESC";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member_id);
			rs = pstmt.executeQuery();
			
			reviewList = new ArrayList<CommentBean>();
			
			while(rs.next()) {
				CommentBean comment = new CommentBean();
				comment.setComment_idx(rs.getInt("comment_idx"));
				comment.setMember_id(rs.getString("member_id"));
				comment.setComment_star(rs.getInt("comment_star"));
				comment.setComment_content(rs.getString("comment_content"));
				comment.setComment_date(rs.getDate("comment_date"));
				comment.setMovie_idx(rs.getInt("movie_idx"));
				
				reviewList.add(comment);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectReviewList()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return reviewList;
	}

	// 마이페이지 - 리뷰 삭제
	public int deleteComment(int comment_idx) {
		int deleteCount = 0;
		
		try {
			String sql = "DELETE FROM comment WHERE comment_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comment_idx);
			
			deleteCount = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - deleteComment()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
		}
		
		return deleteCount;
	}
}
