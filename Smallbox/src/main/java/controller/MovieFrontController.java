package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MovieDetailAction;
import action.MovieListAction;
import action.ReserveSelectIdxAction;
import action.ReserveSelectProAction;
import action.ReserveViewListAction;
import action.ReviewWriteProAction;
import vo.ActionForward;

@WebServlet("*.mv")
public class MovieFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Movie Front Controller");
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		
		Action action = null; 
		ActionForward forward = null; 
		
		// ----------------------------------------------------------------------
		if(command.equals("/MovieList.mv")) {
//			System.out.println("controller : movie list");
			
 			action = new MovieListAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/MovieDetail.mv")) {
//			System.out.println("controller : movie Detail");
			
			action = new MovieDetailAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/ReviewWritePro.mv")) {
			System.out.println("controller : reviewWritePro");
			
			action = new ReviewWriteProAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/Reserve.mv")) {
			System.out.println("예매 영화 목록 요청");
			
			action = new ReserveViewListAction();
			forward = action.execute(request, response);
		} else if(command.equals("/ReserveSelectPro.mv")) {
			System.out.println("예매 영화와 날짜 선택시 해당되는 시간 조회 요청");
			action = new ReserveSelectProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/ReserveSelectSeat.mv")) {
			System.out.println("좌석 선택 페이지 - ReserveSelectSeat.mv");
			
			action = new ReserveSelectIdxAction();
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
