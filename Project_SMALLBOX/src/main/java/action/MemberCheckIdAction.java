package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberCheckIdService;
import vo.ActionForward;

public class MemberCheckIdAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      ActionForward forward = null;
      
      try {
         String id = request.getParameter("member_id");
         
         //MemberCheckIdService 클래스 인스턴스 생성 후 
         //isExistsId() 메서드 호출하여 아이디 존재 여부 판별 
         //파라미터 : 아이디 리턴타입 boolean(isExists)
         MemberCheckIdService service = new MemberCheckIdService();
         boolean isExist = service.isExistId(id);
         
         if(!isExist) { // 아이디가 존재할 경우 
            // "false!" 출력 
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("false");
         }else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("true");
         }
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      
      return forward;
   }

}