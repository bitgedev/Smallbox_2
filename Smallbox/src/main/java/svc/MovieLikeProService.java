package svc;

import java.sql.Connection;

import dao.MovieDAO;
import db.JdbcUtil;
import vo.MovieBean;

public class MovieLikeProService {

	public boolean MovieLike(int movie_idx, String member_id) {
		boolean isLikeSuccess = false;
		
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		
		// DAO에서 수행한 DB 작업 결과를 insertlikeCount 변수에 저장
		int insertlikeCount = dao.insertMovieLike(movie_idx, member_id);
		
		if(insertlikeCount > 0) { // DB 작업 성공시 (= 찜 성공시)
			JdbcUtil.commit(con);
			isLikeSuccess = true; // isLikeSuccess 변수를 true로 변경
		} else { // DB 작업 실패시 (= 찜 실패시)
			JdbcUtil.rollback(con); // DB 작업 수행 X
		}
		
		JdbcUtil.close(con);
		
		return isLikeSuccess; // isLikeSuccess를 MovieLikeProAction으로 리턴
	}
	

}
