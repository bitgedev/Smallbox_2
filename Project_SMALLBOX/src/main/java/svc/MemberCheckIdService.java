package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;

public class MemberCheckIdService {

   public boolean isExistId(String id) {
      
      Connection con = JdbcUtil.getConnection();
      
      // 공통작업-2. MemberDAO 객체 가져오기
      MemberDAO dao = MemberDAO.getInstance();
      
      // 공통작업-3. MemberDAO 객체에 Connection 객체 전달하기
      dao.setConnection(con);
      
      // MemberDAO 객체의 insertMember() 메서드를 호출하여 답글 쓰기 작업 요청
      // => 파라미터 : MemberBean 객체   리턴타입 : int(insertCount)
      boolean isExist = dao.selectMemberId(id);
      
      JdbcUtil.close(con);
      
      return isExist;
   }

   
}