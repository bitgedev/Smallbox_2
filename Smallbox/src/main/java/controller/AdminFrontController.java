package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminMovieDetailProAction;
import action.MemberJoinProAction;
import action.MemberListAction;
import action.MovieDeleteProAction;
import action.MovieInsertProAction;
import action.AdminMovieListProAction;
import action.MovieModifyFormAction;
import action.MovieModifyProAction;
import vo.ActionForward;

	@WebServlet("*.ad")
	public class AdminFrontController extends HttpServlet {
		// GET or POST 방식 요청을 공통으로 처리할 doProcess() 메서드 정의
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("AdminController - doProcess()");
			
			String command = request.getServletPath();
			System.out.println("command : " + command);
			
			// 공통으로 사용할 변수 선언
			ActionForward forward = null; // 포워딩 정보를 저장할 ActionForward 타입 변수
			Action action = null;
			
			// 관리자 페이지로 이동 -> ㅇㅋ
			if (command.equals("/AdminMain.ad")) {
				forward = new ActionForward();
				forward.setPath("admin/admin.jsp");
				forward.setRedirect(false); // 생략 가능
			
			// 영화 등록 폼으로 이동 -> ㅇㅋ
			} else if (command.equals("/MovieInsertForm.ad")) {
				forward = new ActionForward();
				forward.setPath("admin/admin_movie_insert.jsp");
				forward.setRedirect(false); // 생략 가능
			
			// 영화 등록 비즈니스 작업 -> ㅇㅋ
			} else if (command.equals("/MovieInsertPro.ad")) {
				action = new MovieInsertProAction();
				forward = action.execute(request, response);
			
			// 영화 목록 출력 비즈니스 작업 -> ㅇㅋ
			} else if (command.equals("/AdminMovieList.ad")) {
				action = new AdminMovieListProAction();
				forward = action.execute(request, response);
			
			// 영화 등록글 확인 비즈니스 작업 -> ㅇㅋ
			} else if (command.equals("/AdminMovieDetailPro.ad")) {
				action = new AdminMovieDetailProAction();
				forward = action.execute(request, response);
			
			// 영화 수정 폼 출력 비즈니스 작업 -> ㅇㅋ
			} else if (command.equals("/MovieModifyForm.ad")) {
				action = new MovieModifyFormAction();
				forward = action.execute(request, response);
			
			// 영화 수정 비즈니스 작업 -> ㅇㅋ
			} else if (command.equals("/MovieModifyPro.ad")) {
				action = new MovieModifyProAction();
				forward = action.execute(request, response);
			
			// 영화 삭제 비즈니스 작업 -> 뷰 페이지 만들기 귀찮은데 그냥 자바스크립트 태그로 알림창만 뜨게
			} else if (command.equals("/MovieDeletePro.ad")) {
				action = new MovieDeleteProAction();
				forward = action.execute(request, response);
			}
				
	       // ------------------------------------------------- 관리자 영화 작업 끝!		
				
			
			if(forward != null) {
				// 2. Actionforward 객체에 저장된 포워딩 방식 판별
				if(forward.isRedirect()) { // Rerdirect 방식
					// Redirect 방식의 포워딩 작업 수행
					// => 포워딩 경로는 ActionForward 객체의 getPath() 메서드 활용
					response.sendRedirect(forward.getPath());
				} else { // Dispatch 방식
					// Dispatch 방식의 포워딩 작업 수행
					RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
					dispatcher.forward(request, response);
				}
			}
			
		} // doProcess() 메서드 끝(응답 데이터 전송 시점)
		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}
	}

