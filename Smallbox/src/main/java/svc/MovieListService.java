package svc;

import java.sql.Connection;
import java.util.List;

import dao.MovieDAO;
import db.JdbcUtil;
import vo.MovieBean;

public class MovieListService {

	public List<MovieBean> getMovieList() {
		System.out.println("service : MovieListService");
		
		List<MovieBean> movieList = null;
		
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		//-----------------------------------------------------
		
		movieList = dao.selectMovieList();
		
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
		
		return movieList;
	} // ~~~~public List<MovieBean> getMovieList end~~~~

	
} // ~~~~public class MovieListService end~~~~
