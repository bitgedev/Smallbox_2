package svc;

import java.sql.Connection;

import dao.MemberDAO;
import db.JdbcUtil;
import vo.MemberDTO;

public class MemberModifyService {

	public boolean updateMember(MemberDTO member) {
		boolean updateMember = false;
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		updateMember = dao.updateMember(member, true);
		
		if(updateMember) {
			JdbcUtil.commit(con);
			
		} else {
			JdbcUtil.rollback(con);
		}
		
		return updateMember;
	}

	public MemberDTO getMemberInfo(String sId) {
		MemberDTO member2 = null;
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		member2 = dao.getMemebrInfo(sId);
		
		return member2;
	}
	
  public boolean isRightUser(MemberDTO member) {
		boolean isRightUser = false;
		
		Connection con = JdbcUtil.getConnection();
		MemberDAO dao = MemberDAO.getInstance();
		dao.setConnection(con);
		
		isRightUser = dao.isRightUser(member);
		
		if(isRightUser == true) {
			JdbcUtil.commit(con);
			
		} else {
			JdbcUtil.rollback(con);
		}
		return isRightUser;
	}
}
 