package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AdminTheaterDeleteProAction;
import action.AdminTheaterDetailAction;
import action.AdminTheaterListAction;
import action.AdminTheaterModifyFormAction;
import action.AdminTheaterModifyProAction;
import action.AdminTheaterInsertProAction;
import vo.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController");
		
		// POST 방식 요청에 대한 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
				
		// 서블릿 주소 추출
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// 공통으로 사용할 변수 선언
		Action action = null;
		ActionForward forward = null; // 포워딩 정보를 저장할 ActionForward 타입 변수
	
		// ----------------------------------------------------------------------
		if(command.equals("/Admin.ad")) {
			forward = new ActionForward();
			forward.setPath("admin/admin.jsp");
			forward.setRedirect(false); // 생략도 가능
		} else if(command.equals("/AdminTheaterInsertForm.ad")) {
			System.out.println("상영 일정 등록 폼!");
			forward = new ActionForward();
			forward.setPath("/admin/admin_theater_insert.jsp");
			forward.setRedirect(false); // 생략도 가능
		} else if(command.equals("/AdminTheaterInsertPro.ad")) {
			System.out.println("상영 일정 등록 작업!");
			action = new AdminTheaterInsertProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/AdminTheaterList.ad")) {
			System.out.println("상영 일정 목록!");
			action = new AdminTheaterListAction();
			forward = action.execute(request, response);
		} else if(command.equals("/AdminTheaterDetail.ad")) {
			System.out.println("상영 일정 상세정보!");
			action = new AdminTheaterDetailAction();
			forward = action.execute(request, response);
		} else if(command.equals("/AdminTheaterModifyForm.ad")) {
			System.out.println("상영 일정 수정 폼!");
			forward = new ActionForward();
			action = new AdminTheaterModifyFormAction();
			forward = action.execute(request, response);
		} else if(command.equals("/AdminTheaterModifyPro.ad")) {
			System.out.println("상영 일정 수정 작업!");
			action = new AdminTheaterModifyProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/AdminTheaterDeletePro.ad")) {
			System.out.println("상영 일정 삭제 작업!");
			action = new AdminTheaterDeleteProAction();
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
			
		} // doProcess() 메서드 끝
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
