package svc;

import java.sql.Connection;

import dao.TheaterDAO;
import db.JdbcUtil;

public class ReserveSelectIdxService {

	public int selectTheaterIdx(String movie_title, String selected_date, String selected_time) {
		System.out.println("ReserveSelectIdxService - selectTheaterIdx");
		
		int theater_idx = 0;
		
		Connection con = JdbcUtil.getConnection();
		TheaterDAO dao = TheaterDAO.getInstance();
		dao.setConnection(con);
		
		theater_idx = dao.selectTheaterIdx(movie_title, selected_date, selected_time);
		
		JdbcUtil.close(con);
		
		return theater_idx;
	}

}
