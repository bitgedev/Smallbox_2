package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberListAction;
import action.NoticeDeatilAction;
import action.NoticeDeleteProAction;
import action.NoticeListAction;
import action.NoticeWriteProAction;
import vo.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController");
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		System.out.println("command: " + command);
		
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/Admin_main.ad")) {
			System.out.println("관리자 메인페이지");
			
			forward = new ActionForward();
			forward.setPath("admin/admin.jsp");
			forward.setRedirect(false);
		
		} else if(command.equals("/Admin_notice_write.ad")) {
			System.out.println("관리자 공지 등록 페이지");
			
			// Dispatcher 방식으로 포워딩 = /Admin_notice_write.ad 주소가 유지됨
			forward = new ActionForward();
			forward.setPath("admin/admin_notice_insert.jsp");
			forward.setRedirect(false);	
			
		} else if(command.equals("/Admin_notice_writePro.ad")) {
			// 글쓰기 폼 출력 -> 내용 입력 받은 후 글쓰기 버튼 클릭시 
			// 글쓰기 작업 요청을 위한 서블릿 주소 요청
			System.out.println("관리자 공지 등록 요청");
			
			action = new NoticeWriteProAction();
			forward = action.execute(request, response);
		} else if(command.equals("/Notice_list.ad")) {
			System.out.println("공지 목록 페이지 요청");
			action = new NoticeListAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/NoticeDetail.ad")) {
			System.out.println("공지 상세 목록 페이지 요청");
			action = new NoticeDeatilAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/NoticeDeleteForm.ad")) {
			forward = new ActionForward();
			forward.setPath("admin/notice_delete.jsp");
			forward.setRedirect(false);
			
		} else if(command.equals("/NoticeDeletePro.ad")) {
			System.out.println("공지 삭제 요청");
			action = new NoticeDeleteProAction();
			forward = action.execute(request, response);
			
		} else if (command.equals("/MemberList.ad")) {
			action = new MemberListAction();
			forward = action.execute(request, response);
			
		} else if (command.equals("/MovieInsert.ad")) {
			forward = new ActionForward();
			forward.setPath("test/admin_movie_insert.jsp");
			forward.setRedirect(false); // 생략 가능
			
		} else if (command.equals("/TheaterInsert.ad")) {
			forward = new ActionForward();
			forward.setPath("test/admin_theater_insert.jsp");
			forward.setRedirect(false); // 생략 가능
			
		} else if (command.equals("/CouponInsert.ad")) {
			forward = new ActionForward();
			forward.setPath("test/admin_coupon_insert.jsp");
			forward.setRedirect(false); // 생략 가능
			
		} else if (command.equals("/CouponeInsertPro.ad")) {
			action = new MemberListAction();
			forward = action.execute(request, response);
			
		} 
		
		// 얘 없으면 안 뜸 안 넣으면 빡댁가리
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
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
		
