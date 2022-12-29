package svc;

import java.sql.Connection;
import java.util.List;

import dao.CommentDAO;
import db.JdbcUtil;
import vo.CommentBean;

public class ReviewListService {

	public List<CommentBean> getReviewList(String member_id) {
		List<CommentBean> reviewList = null;
		
		Connection con = JdbcUtil.getConnection();
		CommentDAO dao = CommentDAO.getInstance();
		dao.setConnection(con);
		
		reviewList = dao.selectReviewList(member_id);
		
		JdbcUtil.close(con);
		
		return reviewList;
	}
	
	

}
