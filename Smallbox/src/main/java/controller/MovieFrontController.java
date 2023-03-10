package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CommentWriteProAction;
import action.MovieDetailAction;
import action.MovieListAction;
import action.ReserveSelectProAction;
import action.ReserveSelectSeatProAction;
import action.ReserveViewListAction;
import vo.ActionForward;

//comment도 일단 여기서 처리하고있는데 분리 할까요?????
@WebServlet("*.mv")
public class MovieFrontController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Movie Front Controller");
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/MovieList.mv")) {
			System.out.println("controller : MovieList.mv");
			
 			action = new MovieListAction();
			forward = action.execute(request, response);
		
		} else if (command.equals("/MovieDetail.mv")) {
			System.out.println("controller : MovieList.mv");
			
			action = new MovieDetailAction();
			forward = action.execute(request, response);
		
		} else if (command.equals("/CommentWritePro.mv")) {
			System.out.println("controller : CommentWritePro.mv");
			
			action = new CommentWriteProAction();
			forward = action.execute(request, response);
		
		} else if(command.equals("/Reserve.mv")) {
			System.out.println("예매 영화 목록 요청");
			
			action = new ReserveViewListAction();
			forward = action.execute(request, response);
		} else if(command.equals("/ReserveSelectPro.mv")) {
			System.out.println("예매 영화와 날짜 선택시 해당되는 시간 조회 요청");
			
			action = new ReserveSelectProAction();
			forward = action.execute(request, response);
		} else if (command.equals("/ReserveSelectSeat.mv")) { // 좌석 선택
			forward = new ActionForward();
			forward.setPath("reserve/reserve_seat.jsp");
			forward.setRedirect(false); 
		
		} else if(command.equals("/ReserveSelectSeatPro.mv")) {
			System.out.println("controler : ReserveSelectSeat.mv");
			
			action = new ReserveSelectSeatProAction();
			forward = action.execute(request, response);
		}
		
		
		
		
		// ----------------------------------------------------------------------
		// ActionForward 객체 내용에 따라 각각 다른 방식의 포워딩 작업 수행(공통)
		// 1. ActionForward 객체가 null 이 아닐 경우 판별
		if(forward != null) {
			// 2. ActionForward 객체에 저장된 포워딩 방식 판별
			if(forward.isRedirect()) { // Redirect 방식
				// Redirect 방식의 포워딩 작업 수행
				// => 포워딩 경로는 ActionForward 객체의 getPath() 메서드 활용
				response.sendRedirect(forward.getPath());
			} else { // Dispatch 방식
				// Dispatch 방식의 포워딩 작업 수행
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	} // ~~~~do Process end~~~~
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
