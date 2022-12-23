package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DB.JdbcUtil;
import vo.CommentBean;
import vo.MovieBean;

public class MovieDAO {
	//==============mvc==========================================
	private static MovieDAO instance = new MovieDAO();
	
//	private MovieDAO() {}

	public static MovieDAO getInstance() {
		return instance;
	}
	
	private Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//========================================================
	PreparedStatement pstmt = null, pstmt2 = null, pstmt3 = null;
	ResultSet rs = null;
	
	// 관리자 페이지 - 영화 등록
	public int insertMovie(MovieBean movie) {
		int insertCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			// 1. 영화 번호 구하기
			int movie_idx = 1;
			
			String sql = "SELECT MAX(movie_idx) FROM movie";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				movie_idx = rs.getInt(1) + 1;
			}
			
			// 2. 영화 등록
			sql = "INSERT INTO movie VALUES(?,?,?,?,?,?,?,?,?,?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, movie_idx);
			pstmt2.setString(2, movie.getMovie_title());
			pstmt2.setString(3, movie.getMovie_grade());
			pstmt2.setString(4, movie.getMovie_genre());
			pstmt2.setDate(5, movie.getMovie_open_date());
			pstmt2.setInt(6, movie.getMovie_runtime());
			pstmt2.setString(7, movie.getMovie_intro()); // setText 라는건 업습니다..
			pstmt2.setString(8, movie.getMovie_actors());
			pstmt2.setString(9, movie.getMovie_picture());
			pstmt2.setInt(10, movie.getMovie_viewer());
			
			insertCount = pstmt2.executeUpdate();
			//3 Create view
			
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertMovie()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
			JdbcUtil.close(pstmt3);
		}
		
		return insertCount;
	}

	// 관리자 페이지 - 영화 목록 출력
	public List<MovieBean> selectMovieList() {
		List<MovieBean> movieList = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM movie";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			movieList = new ArrayList<MovieBean>();
			
			while(rs.next()) {
				MovieBean movie = new MovieBean();
				movie.setMovie_idx(rs.getInt("movie_idx"));
				movie.setMovie_title(rs.getString("movie_title"));
				movie.setMovie_grade(rs.getString("movie_grade"));
				movie.setMovie_genre(rs.getString("movie_genre"));
				movie.setMovie_open_date(rs.getDate("movie_open_date"));
				movie.setMovie_runtime(rs.getInt("movie_runtime"));
				movie.setMovie_intro(rs.getString("movie_intro"));
				movie.setMovie_actors(rs.getString("movie_actors"));
				movie.setMovie_picture(rs.getString("movie_picture"));
				movie.setMovie_viewer(rs.getInt("movie_viewer"));
				
				movieList.add(movie);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectMovieList()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
//		System.out.println("dao의 movielist : " + movieList);
		return movieList;
	}
	
	// 영화 상세 정보 조회
	public MovieBean selectMovie(int movie_idx) {
		MovieBean movie = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM movie WHERE movie_idx = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				movie = new MovieBean();
				movie.setMovie_idx(movie_idx);
				movie.setMovie_title(rs.getString("movie_title"));
				movie.setMovie_grade(rs.getString("movie_grade"));
				movie.setMovie_genre(rs.getString("movie_genre"));
				movie.setMovie_open_date(rs.getDate("movie_open_date"));
				movie.setMovie_runtime(rs.getInt("movie_runtime"));
				movie.setMovie_intro(rs.getString("movie_intro"));
				movie.setMovie_actors(rs.getString("movie_actors"));
				movie.setMovie_picture(rs.getString("movie_picture"));
				movie.setMovie_viewer(rs.getInt("movie_viewer"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectMovie()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return movie;
	}

	public int insertReview(CommentBean cmt) {
		int insertCount = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			// 1. 영화 번호 구하기
			int comment_idx = 1;
			
			String sql = "SELECT MAX(comment_idx) FROM comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				comment_idx = rs.getInt(1) + 1;
			}
			
			sql = "INSERT INTO comment VALUES(?,?,?,?,now(),?)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, comment_idx);
			pstmt2.setString(2, cmt.getMember_id());
			pstmt2.setInt(3, cmt.getComment_star());
			pstmt2.setString(4, cmt.getComment_content());
			pstmt2.setInt(5, cmt.getMovie_idx());
			
			insertCount = pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - insertReview()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(pstmt2);
		}
		
		return insertCount;
	}
	
	public List<CommentBean> selectReviewList(int movie_idx) {
		List<CommentBean> reviewList = null;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "SELECT * FROM comment WHERE movie_idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_idx);
			rs = pstmt.executeQuery();
			
			reviewList = new ArrayList<CommentBean>();
			
			while(rs.next()) {
				CommentBean cmt = new CommentBean();
				
				cmt.setComment_idx(rs.getInt("comment_idx"));
				cmt.setMember_id(rs.getString("member_id"));
				cmt.setComment_star(rs.getInt("comment_star"));
				cmt.setComment_content(rs.getString("comment_content"));
				cmt.setComment_date(rs.getDate("comment_date"));
				cmt.setMovie_idx(rs.getInt("movie_idx"));
				
				reviewList.add(cmt);
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

	public double selectAvg(int movie_idx) {
		double staravg = 0;
		
		try {
			con = JdbcUtil.getConnection();
			
			String sql = "select AVG(c.comment_star) FROM comment c JOIN movie m ON c.movie_idx = m.movie_idx WHERE c.movie_idx=? GROUP BY c.movie_idx;";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, movie_idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				staravg = rs.getDouble(1);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류! - selectAvg()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return staravg;
	}

	
}
