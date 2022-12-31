package svc;

import java.sql.Connection;

import dao.TheaterDAO;
import db.JdbcUtil;

public class ReserveSelectSeatProService {

	public int updateSeatStatus(int seat, int theater_idx) {
		int updateSeat = 0;
		
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		TheaterDAO dao = TheaterDAO.getInstance();
		dao.setConnection(con);
		//-----------------------------------------------------
		
		updateSeat = dao.updateSeatStatus(seat, theater_idx);
		
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
				
		if(updateSeat > 0) {
			JdbcUtil.commit(con);
			
		} else {
			JdbcUtil.rollback(con);
		}
		
		return updateSeat;
	}

}
