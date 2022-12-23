package svc;

import java.sql.Connection;
import java.util.List;

import dao.MovieDAO;
import db.JdbcUtil;
import vo.MovieBean;

public class AdminMovieListService {

	// 관리자 페이지 - 영화 목록 조회 + 검색기능
	public List<MovieBean> getAdminMovieList(String keyword, int startRow, int listLimit) {
		List<MovieBean> movieList = null;
		
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		
		// DAO에서 조회한 목록 정보가 담긴 List 객체를 Action 클래스로 리턴
		movieList = dao.selectMovieList(keyword, startRow, listLimit);

		JdbcUtil.close(con);
		
		return movieList;
	}
	
	// 관리자 페이지 - 총 게시글 갯수 조회
	public int getMovieListCount(String keyword) {
		int listCount = 0;
		
		Connection con = JdbcUtil.getConnection();
		MovieDAO dao = MovieDAO.getInstance();
		dao.setConnection(con);
		
		// DAO에서 조회한 게시글 갯수가 담긴 listCount 변수를 Action 클래스로 리턴
		listCount = dao.selectBoardListCount(keyword);
		
		JdbcUtil.close(con);
		
		return listCount;
	}
}
