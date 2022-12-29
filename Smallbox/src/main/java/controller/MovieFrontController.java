package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminMovieListProAction;
import action.CancelMovieLikeProAction;
import action.MovieLikeListProAction;
import action.MovieLikeProAction;
import action.MovieListProAction;
import vo.ActionForward;

@WebServlet("*.mv")
public class MovieFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("Movie Front Controller");
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		
		Action action = null; 
		ActionForward forward = null; 
		
		// ----------------------------------------------------------------------
		if(command.equals("/MovieList.mv")) { // 영화 목록 출력 작업 수행
//			System.out.println("controller : movie list");
 			action = new MovieListProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/MovieLikePro.mv")) { // 찜 작업 수행
 			action = new MovieLikeProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/CancelMovieLikePro.mv")) { // 찜 해제 작업 수행
 			action = new CancelMovieLikeProAction();
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
