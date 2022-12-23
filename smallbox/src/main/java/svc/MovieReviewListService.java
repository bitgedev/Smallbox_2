package svc;

import java.sql.Connection;
import java.util.List;

import DB.JdbcUtil;
import dao.MovieDAO;
import vo.CommentBean;

public class MovieReviewListService {

	public List<CommentBean> getReviewList(int movie_idx) {
		System.out.println("Movie Review List Service");
		
		List<CommentBean> ReviewList = null;
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance(); // 
		dao.setConnection(con);
		//-----------------------------------------------------
		
		ReviewList = dao.selectReviewList(movie_idx);
		
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
		return ReviewList;
	}
	

	

}
