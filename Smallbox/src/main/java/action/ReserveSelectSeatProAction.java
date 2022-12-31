package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReserveSelectSeatProService;
import vo.ActionForward;
import vo.SeatStatusBean;
import vo.TheaterBean;

public class ReserveSelectSeatProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ReserveSelectSeatProAction");
		
		ActionForward forward = null;
		
		/*
		 가져와야할거
		 좌석 번호
		 영화 제목
		 영화 포스터 영역
		 예약 날짜
	 	 상영 시간 
		 예약 한 id 
		 
		 해야 할 일
		  좌석 예매 상태 바꾸기 0 -> 1
		  남은 좌석 수 계산
		 
		 */ 
		
		//===============================================================================
		//가져온 정보들 변수에 저장
		String sId = request.getParameter("sId"); // 세션 아이디
		
		String strseat = request.getParameter("seat");
		int seat = Integer.parseInt(request.getParameter("seat")); // 좌석 번호 3자리
		
		System.out.println("pro action 의 sId : " + sId + ", seat(int) : " + seat);
		//좌석 값 잘 넘어온다
		
		String theater_title = request.getParameter("theater_title"); // 영화 제목
		String theater_date = request.getParameter("theater_date"); // 영화 날짜
		String theater_time = request.getParameter("theater_time"); // 영화 시간
		int theater_idx = (Integer.parseInt(request.getParameter("theater_idx")));
		
		System.out.println("pro action의 theater_title : " + theater_title + ", theater_date : " + theater_date + ", theater_time : " + theater_time + ", theater_idx : " + theater_idx);
		//===============================================================================
	
		SeatStatusBean seatStatus = new SeatStatusBean();
		seatStatus.setSeat_status_idx(theater_idx);
		seatStatus.setTheater_title(theater_title);
		seatStatus.setTheater_date(Date.valueOf(theater_date));
		seatStatus.setTheater_time(Time.valueOf(theater_time));
		
		ReserveSelectSeatProService service = new ReserveSelectSeatProService();
		
		int updateSeat = service.updateSeatStatus(seat, theater_idx);
		
//		if(updateSeat > 0) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out;
//			try {
//				out = response.getWriter();
//				out.println("<script>");
//				out.println("alert('좌석 예매 성공! 좌석 배열을 0->1 로 변경');");
//				out.println("</script>");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			request.setAttribute("seatStatus", seatStatus);
//			forward = new ActionForward();
//			forward.setPath("reserve/reservePro.jsp"); //결제페이지로 이동
//			forward.setRedirect(true);
//		} else{
//				response.setContentType("text/html; charset=UTF-8");
//				PrintWriter out;
//				try {
//					out = response.getWriter();
//					out.println("<script>");
//					out.println("alert('실패!');");
//					out.println("history.back()");
//					out.println("</script>");
//				} catch (IOException e) {
//					e.printStackTrace();
//				}
//		}
		
		
		return forward;
	}

}
