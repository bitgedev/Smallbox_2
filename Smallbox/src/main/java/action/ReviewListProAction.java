package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReviewListService;
import vo.ActionForward;
import vo.CommentBean;

public class ReviewListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		// 세션에 저장해서 전달한 회원 아이디 받아오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("sId");
		
		ReviewListService service = new ReviewListService();
		List<CommentBean> reviewList = service.getReviewList(member_id);
		
		request.setAttribute("reviewList", reviewList);
		
		forward = new ActionForward();
		forward.setPath("mypage/mypage_review_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
