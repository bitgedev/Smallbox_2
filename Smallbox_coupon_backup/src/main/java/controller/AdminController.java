package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.CouponDeleteProAction;
import action.CouponInsertProAction;
import action.CouponListAction;
import action.CouponModifyProAction;
import action.MemberJoinProAction;
import action.MemberListAction;
import vo.ActionForward;

	@WebServlet("*.ad")
	public class AdminController extends HttpServlet {
		// GET or POST 방식 요청을 공통으로 처리할 doProcess() 메서드 정의
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("AdminController - doProcess()");
			
			String command = request.getServletPath();
			System.out.println("command : " + command);
			
			// 공통으로 사용할 변수 선언
			ActionForward forward = null; // 포워딩 정보를 저장할 ActionForward 타입 변수
			Action action = null;
				
			if (command.equals("/MemberList.ad")) { // 회원정보 출력
				action = new MemberListAction();
				forward = action.execute(request, response);
				
			} else if (command.equals("/AdminMain.ad")) { // 관리자 페이지 이동
				forward = new ActionForward();
				forward.setPath("admin/admin.jsp");
				forward.setRedirect(false); 
				
			} else if (command.equals("/CouponInsert.ad")) { // 쿠폰 등록폼
				forward = new ActionForward();
				forward.setPath("admin/admin_coupon_insert.jsp");
				forward.setRedirect(false); 
				
			} else if (command.equals("/CouponInsertPro.ad")) { // 쿠폰 등록 작업
				action = new CouponInsertProAction();
				forward = action.execute(request, response);	
				
			} else if (command.equals("/CouponList.ad")) { // 쿠폰 리스트 출력
				action = new CouponListAction();
				forward = action.execute(request, response);
				
			} else if (command.equals("/CouponModify.ad")) { // 쿠폰 수정
				forward = new ActionForward();
				forward.setPath("admin/admin_coupon_modify.jsp");
				forward.setRedirect(false); 
			
			} else if (command.equals("/CouponModifyPro.ad")) { // 쿠폰 수정 작업
				action = new CouponModifyProAction();
				forward = action.execute(request, response);	
			
			} else if (command.equals("/CouponDelete.ad")) { // 만료된 쿠폰 삭제
				action = new CouponDeleteProAction();
				forward = action.execute(request, response);
				
			} 
			
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

