package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReserveListService;
import vo.ActionForward;
import vo.ReserveBean;

public class ReserveListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ReserveListAction");
		
		ActionForward forward = null;
		// BoardListService 객체를 통해 게시물 목록 조회 후
		// 조회 결과(List 객체)를 request 객체를 통해 qna_board_list.jsp 페이지로 전달
		// ---------------------------------------------------------------------------
		// 페이징 처리를 위한 변수 선언
		// ---------------------------------------------------------
		//아이디 가져와서 변수에 저장
		String sId = request.getParameter("member_id");

		// ---------------------------------------------------------
		// BoardListService 클래스 인스턴스 생성
		ReserveListService service = new ReserveListService();
		// BoardListService 객체의 getReserveList() 메서드를 호출하여 게시물 목록 조회
		// => 파라미터 : 검색어, 시작행번호, 목록갯수   리턴타입 : List<ReserveBean>(reserveList)
		List<ReserveBean> reserveList = service.getReserveList(sId);
		
		// ----------------------------------------------------------------------
		request.setAttribute("reserveList", reserveList);
		
		// ActionForward 객체 생성 후 board/qna_board_list.jsp 페이지 포워딩 설정
		// => URL 및 request 객체 유지 : Dispatch 방식
		forward = new ActionForward();
		forward.setPath("test/reserved_list.jsp");
		forward.setRedirect(false); // 생략 가능
		
		return forward;
	}

}















