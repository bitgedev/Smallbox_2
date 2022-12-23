package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MovieLikeListService;
import vo.ActionForward;
import vo.MovieBean;
import vo.MovieLikeBean;

public class MovieLikeListProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		HttpSession session = request.getSession();
		String member_id = (String)session.getAttribute("sId");
		
		// 목록이니까 페이징 처리 해야합니다!
		
		// 각 회원 아이디(member_id)가 찜한 영화의 상세 정보 가져오기
		// movie_like 테이블의 movie_idx와 movie 테이블의 movie_idx를 조인하는 작업 요청
		MovieLikeListService service = new MovieLikeListService();
		List<MovieBean> likeList = service.getMovieLikeList(member_id);
		
		// MovieBean 객체에 저장된 movie 테이블의 정보를 request의 likeList 속성에 저장해서 view로 전달
		// 찜 목록에 뿌릴거라서 이름을 likeList라고 했는데 헷갈리시면 바꿔도 돼요 
		// 이름은 likeList지만 안에 든 정보는 MovieBean(영화정보) 입니다~~!
		request.setAttribute("likeList", likeList);
		
		forward = new ActionForward();
		forward.setPath("mypage/movie_like_list.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
