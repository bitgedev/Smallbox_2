package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberModifyService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		MemberBean member = new MemberBean();

		member.setMember_name(request.getParameter("member_name"));
		member.setMember_id(request.getParameter("member_id"));
		member.setMember_email(request.getParameter("member_email"));
		member.setMember_phone(request.getParameter("member_phone"));
		String newPasswd = request.getParameter("newPasswd");
		String oldPasswd = request.getParameter("oldPasswd");
		String newPasswdCheck = request.getParameter("newPasswdCheck");
		
		
		if(newPasswd.equals(newPasswdCheck)) {
			response.setContentType("text/html; charset=UTF-8");
			member.setMember_passwd(newPasswdCheck);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			member.setMember_passwd(oldPasswd);
		}
		
		MemberModifyService service = new MemberModifyService();
		
		boolean updateMember = service.updateMember(member); 

		if(updateMember) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>");
				out.println("alert('회원 수정 성공!');");
				out.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			forward = new ActionForward();
			forward.setPath("./");
			forward.setRedirect(true);
		} else{
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out;
				try {
					out = response.getWriter();
					out.println("<script>");
					out.println("alert('회원 수정 실패!');");
					out.println("history.back()");
					out.println("</script>");
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return forward;
		
	}

}
