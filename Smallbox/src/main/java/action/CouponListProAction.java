package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CouponListService;
import vo.ActionForward;
import vo.CouponBean;

public class CouponListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		// 세션에 저장해서 전달한 회원 아이디 받아오기
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("sId");
		
		// 각 회원의 쿠폰 내역을 조회하는 DB 작업을 요청하기 위해 서비스의 getCouponList() 호출
		CouponListService service = new CouponListService();
		List<CouponBean> couponList = service.getCouponList(member_id);
		
		// request 객체에 CouponBean 객체를 저장해 뷰페이지로 전달
		request.setAttribute("couponList", couponList);
		
		forward = new ActionForward();
		forward.setPath("mypage/mypage_coupon_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
