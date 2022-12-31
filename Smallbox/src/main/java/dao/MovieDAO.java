package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.JdbcUtil;
import vo.MovieBean;

public class MovieDAO {
	//==============mvc==========================================
	private static MovieDAO instance = new MovieDAO();
	
	private MovieDAO() {}

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
	
	public List<MovieBean> selectMovieList() {
		List<MovieBean> movieList = null;
		
		try {
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
			} // ~~~~while end~~~~
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - MovieDAO>selectMovieList()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		} // ~~~~finally end~~~~
		
		return movieList;
	} // ~~~~method public List<MovieBean> selectMovieList end~~~~

	public MovieBean selectMovie(int movie_idx) {
		MovieBean movie = null;
		
		try {
			String sql = "SELECT * FROM movie WHERE movie_idx=?";
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
				
			} // ~~~~if end~~~~
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 - MovieDAO>selectMovie()");
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		} // ~~~~finally end~~~~
		
		return movie;
	} // ~~~~method public MovieBean selectMovie(int movie_idx) end~~~~
	
	
	
}
