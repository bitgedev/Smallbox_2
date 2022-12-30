package svc;

import java.sql.Connection;
import java.util.List;

import db.JdbcUtil;
import dao.MovieDAO;
import vo.MovieBean;

public class MovieListService {

	public List<MovieBean> getMovieList() {
//		System.out.println("movie list service");
		
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
//		System.out.println("service 의 movie list : " + movieList);
		return movieList;
	}

}
