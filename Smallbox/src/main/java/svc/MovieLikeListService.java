package svc;

import java.sql.Connection;
import java.util.List;

import dao.MovieDAO;
import db.JdbcUtil;
import vo.MovieBean;
import vo.MovieLikeBean;

public class MovieLikeListService {

	// 각 멤버(member_id로 구분)가 찜한 영화의 영화 상세 정보 가져오기
	public List<MovieBean> getMovieLikeList(String member_id) {
		List<MovieBean> likeList = null;
		
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance(); 
		dao.setConnection(con);
		
		// DAO에서 DB작업의 결과로 리턴받은 MovieBean 객체를 likeList에 저장해서 MovieLikeListProAction 으로 리턴
		likeList = dao.selectLikeList(member_id);
		
		JdbcUtil.close(con);
		
		return likeList;
	}

	
}
