package svc;

import java.sql.Connection;
import java.util.List;

import dao.TheaterDAO;
import db.JdbcUtil;
import vo.TheaterBean;

public class TheaterListService {
	public List<TheaterBean> getTheaterList() {
		System.out.println("TheaterListService");
		
		List<TheaterBean> theaterList = null;
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		TheaterDAO dao = TheaterDAO.getInstance();
		dao.setConnection(con);
		//-----------------------------------------------------
		
//		theaterList = dao.selectTheaterList();
		
		
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
//		System.out.println("service 의 movie list : " + movieList);
		return theaterList;
	}
}
