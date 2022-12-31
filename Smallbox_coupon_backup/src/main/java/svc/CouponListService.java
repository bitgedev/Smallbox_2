package svc;

import java.sql.Connection;
import java.util.List;

import dao.CouponDAO;
import dao.MemberDAO;
import db.JdbcUtil;
import vo.CouponBean;
import vo.MemberBean;

public class CouponListService {

	public List<CouponBean> getCouponList(String member_id) {
		List<CouponBean> couponList = null;
		
		// 공통작업-1. Connection 객체 가져오기
		Connection con = JdbcUtil.getConnection();
		
		// 공통작업-2. BoardDAO 객체 가져오기
		CouponDAO dao = CouponDAO.getInstance();
		
		// 공통작업-3. BoardDAO 객체에 Connection 객체 전달하기
		dao.setConnection(con);
		
		couponList = dao.selectCouponList(member_id);
		
		
		// 공통작업-4. Connection 객체 반환하기
		JdbcUtil.close(con);
		
		return couponList;
	}


}
