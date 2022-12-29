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
import action.CouponListProAction;
import action.MovieLikeListProAction;
import action.MovieLikeProAction;
import action.MovieListProAction;
import action.ReviewDeleteProAction;
import action.ReviewListProAction;
import vo.ActionForward;

@WebServlet("*.my")
public class MyPageFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Movie Front Controller");
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		
		Action action = null; 
		ActionForward forward = null; 
		
		// ----------------------------------------------------------------------
		if(command.equals("/MyPageMain.my")) { // 마이페이지 메인으로 이동
			forward = new ActionForward();
			forward.setPath("mypage/mypage_main.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/MovieLikeList.my")) { // 마이페이지 - 찜 목록 출력
 			action = new MovieLikeListProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/CouponList.my")) { // 마이페이지 - 쿠폰 목록 출력
 			action = new CouponListProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/ReviewList.my")) { // 마이페이지 - 리뷰 목록 출력 : 최근 작성순으로 정렬 
 			action = new ReviewListProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/ReviewDeletePro.my")) { // 마이페이지 - 리뷰 삭제
 			action = new ReviewDeleteProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/ReviewModifyForm.my")) { // 마이페이지 - 리뷰 수정 폼으로 이동 : ajax 사용해서 바로 수정할 수 있게
			forward = new ActionForward();
			forward.setPath("mypage/mypage_main.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/ReviewModifyPro.my")) { // 마이페이지 - 리뷰 수정 작업
			forward = new ActionForward();
			forward.setPath("mypage/mypage_main.jsp");
			forward.setRedirect(false);
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

		
	} 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
