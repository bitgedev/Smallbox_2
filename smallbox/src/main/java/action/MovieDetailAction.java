package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MovieDetailService;
import svc.MovieReviewListService;
import vo.ActionForward;
import vo.CommentBean;
import vo.MovieBean;

public class MovieDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Movie Detail Action");
		ActionForward forward = null;
		
		int movie_idx = Integer.parseInt(request.getParameter("movie_idx"));
		
//		System.out.println("movie detail action의 movie_idx : " + movie_idx);
		
		MovieDetailService service = new MovieDetailService();
		MovieBean movie = service.getdetail(movie_idx); 		
		
		request.setAttribute("movie", movie);
		//==============================================================
		double staravg = service.getStarAverage(movie_idx);
		request.setAttribute("staravg", staravg);
		//==============================================================
		
		MovieReviewListService rservice = new MovieReviewListService();
		List<CommentBean> reviewList = rservice.getReviewList(movie_idx);

		request.setAttribute("reviewList", reviewList);
		
		forward = new ActionForward();
		forward.setPath("test/movie_detail.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
