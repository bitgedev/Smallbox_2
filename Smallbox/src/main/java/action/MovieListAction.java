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
		System.out.println("Action : MovieListAction");
		ActionForward forward = null;
		
		MovieListService service = new MovieListService();
		List<MovieBean> movieList = service.getMovieList();
		request.setAttribute("movieList", movieList);
		
//		System.out.println("movieList Action의 movieList : " + movieList);
		
		forward = new ActionForward();
		forward.setPath("movie/movie_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	} // ~~~~ override public ActionForward execute end~~~~

} // ~~~~ public class MovieListAction implements Action end~~~~
