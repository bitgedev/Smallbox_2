package svc;

import java.sql.Connection;

import DB.JdbcUtil;
import dao.MovieDAO;
import vo.CommentBean;

public class ReviewWriteProServive {

	public boolean insertReview(CommentBean cmt) {
		System.out.println("review write pro service");
		boolean isReviewSuccess = false;
		
		//-------------------공통------------------------------
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		//-----------------------------------------------------
		int insertCount = dao.insertReview(cmt);	
				
		if(insertCount > 0) { // 성공 시
			// INSERT 작업 성공했을 경우의 트랜잭션 처리(commit) 을 위해
			// JdbcUtil 클래스의 commit() 메서드를 호출하여 commit 작업 수행
			// => 파라미터 : Connection 객체
//			JdbcUtil.commit(con);
			
			isReviewSuccess = true;
		} else { // 실패 시
//			JdbcUtil.rollback(con);
		}
				
		//-------------------공통------------------------------
		JdbcUtil.close(con);
		//-----------------------------------------------------
		
		return isReviewSuccess;
	}

	
	
	
}
