package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.QnaDeleteProAction;
import action.QnaDetailAction;
import action.QnaListAction;
import action.QnaListAction;
import action.QnaModifyFormAction;
import action.QnaModifyProAction;
import action.QnaReplyFormAction;
import action.QnaReplyProAction;
import action.QnaWriteProAction;
import action.ReserveCancelProAction;
import action.ReserveListAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MypageFrontController extends HttpServlet {
	// GET or POST 방식 요청을 공통으로 처리할 doProcess() 메서드 정의
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MypageFrontController - doProcess()");
		
		request.setCharacterEncoding("UTF-8");
		
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// 공통으로 사용할 변수 선언
		ActionForward forward = null; // 포워딩 정보를 저장할 ActionForward 타입 변수
		Action action = null;
			
		if (command.equals("/Reserved.me")) {
			action = new ReserveListAction();
			forward = action.execute(request, response);
			
		} else if (command.equals("/ReserveCancel.me")) {
			action = new ReserveCancelProAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaWriteForm.me")) {
			forward = new ActionForward();
			forward.setPath("qna/qna_write.jsp");
			forward.setRedirect(false); // 생략도 가능
			
		} else if(command.equals("/QnaWritePro.me")) {
			action = new QnaWriteProAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnadList.me")) {
			action = new QnaListAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaDetail.me")) {
			action = new QnaDetailAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaDeleteForm.me")) {
			forward = new ActionForward();
			forward.setPath("qna/qna_delete.jsp");
			forward.setRedirect(false); // 생략도 가능
			
		} else if(command.equals("/QnaDeletePro.me")) {
			action = new QnaDeleteProAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaModifyForm.me")) {
			// 글 수정 폼 비즈니스 작업 요청
			// QnaModifyFormAction 의 execute() 메서드 호출
			action = new QnaModifyFormAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaModifyPro.me")) {
			// 글 수정 비즈니스 작업 요청
			// QnaModifyProAction 의 execute() 메서드 호출
			action = new QnaModifyProAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaReplyForm.me")) {
			// 답글 작성 폼 비즈니스 작업 요청
			// QnaReplyFormAction 의 execute() 메서드 호출
			action = new QnaReplyFormAction();
			forward = action.execute(request, response);
			
		} else if(command.equals("/QnaReplyPro.me")) {
			// 답글 작성 비즈니스 작업 요청
			// QnaReplyProAction 의 execute() 메서드 호출
			action = new QnaReplyProAction();
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
