package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReserveSelectIdxService;
import vo.ActionForward;

public class ReserveSelectIdxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String movie_title = request.getParameter("movie_title");
		String selected_date = request.getParameter("reserved_date");
		String selected_time = request.getParameter("selected_time");
		
		System.out.println("영화제목: " + movie_title);
		System.out.println("상영 날짜: " + selected_date);
		System.out.println("상영 시간: " + selected_time);
		
		ReserveSelectIdxService service = new ReserveSelectIdxService();
		
		int theater_idx = service.selectTheaterIdx(movie_title, selected_date, selected_time);
		
		request.setAttribute("theater_idx", theater_idx);
		
		forward = new ActionForward();
		forward.setPath("reserve/reserve_seat.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
