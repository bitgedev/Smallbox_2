package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MovieListService;
import svc.TheaterListService;
import vo.ActionForward;
import vo.MovieBean;
import vo.TheaterBean;

public class ReserveViewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		MovieListService service = new MovieListService();
		TheaterListService service2 = new TheaterListService();
		
		List<MovieBean> movieList = service.getMovieList();
		
		request.setAttribute("movieList", movieList);
		
		List<TheaterBean> theaterList = service2.getTheaterList();
		request.setAttribute("theaterList", theaterList);
		
//		System.out.println("action의 movielist : " + movieList);
		forward = new ActionForward();
		forward.setPath("reserve/reserve_view_Backup.jsp");
		forward.setRedirect(false); 
		
		return forward;
	}

}
