package action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

import svc.MovieLikeProService;
import vo.ActionForward;
import vo.MovieBean;

public class MovieLikeProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		// 세션객체의 sId 속성을 member_Id 변수에 저장
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("sId");
//		System.out.print(member_id);
		
		int movie_idx = Integer.parseInt(request.getParameter("movie_idx"));
//		System.out.print(movie_idx);
		
		try {
			MovieBean movie = new MovieBean();
			movie.setMovie_idx(movie_idx);
			
			// 찜에 필요한 정보 : 멤버 아이디와 영화 번호
			MovieLikeProService service = new MovieLikeProService();
			boolean isLikeSuccess = service.MovieLike(movie_idx, member_id);
			
			if(isLikeSuccess) { // 찜 작업 성공시
				forward = new ActionForward();
				forward.setPath("MovieList.mv"); // 영화 목록으로 이동
				forward.setRedirect(true);
				
			} else {
				response.setContentType("text/html; charset=UTF-8"); // setContentType을 설정해야 HTML 문서로 인식됨
				
				PrintWriter out = response.getWriter();
				
				out.println("<script>");
				out.println("alert('찜 실패!')");
				out.println("history.back()"); 
				out.println("</script>");
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
