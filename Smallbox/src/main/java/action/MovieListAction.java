package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MovieListService;
import vo.ActionForward;
import vo.MovieBean;

public class MovieListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
//		System.out.println("Movie List Action");
		ActionForward forward = null;
		
		MovieListService service = new MovieListService();
		
		List<MovieBean> movieList = service.getMovieList();
		
		request.setAttribute("movieList", movieList);
		
//		System.out.println("action의 movielist : " + movieList);
		forward = new ActionForward();
		forward.setPath("test/movie_list.jsp");
		forward.setRedirect(false); 
		
		return forward;
	}

}
