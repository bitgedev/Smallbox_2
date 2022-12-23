package svc;

import java.sql.Connection;

import DB.JdbcUtil;
import dao.MovieDAO;
import vo.MovieBean;

public class MovieDetailService {

	public MovieBean getdetail(int movie_idx) {
		System.out.println("movie detail service");
		
		MovieBean movie = null;
			
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		//-----------------------------------------------------
		movie = dao.selectMovie(movie_idx);
		
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
		return movie;
		
	}

	public double getStarAverage(int movie_idx) {
		double staravg = 0;
		
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		//-----------------------------------------------------
		staravg = dao.selectAvg(movie_idx);
		
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
		
		return staravg;
	}
	

}