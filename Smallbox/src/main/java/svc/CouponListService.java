package svc;

import java.sql.Connection;
import java.util.List;

import dao.CouponDAO;
import db.JdbcUtil;
import vo.CouponBean;

public class CouponListService {
	
	// 마이페이지 - 각 회원(member_id)의 쿠폰 내역 조회
	public List<CouponBean> getCouponList(String member_id) {
		List<CouponBean> couponList = null;
		
		Connection con = JdbcUtil.getConnection();
		CouponDAO dao = CouponDAO.getInstance();
		dao.setConnection(con);
		
		// DAO에서 DB작업을 수행해서 조회한 각 회원(member_id)의 쿠폰 정보를 저장해 액션으로 리턴
		couponList = dao.selectMemberCouponList(member_id);
		
		JdbcUtil.close(con);
		
		return couponList;
	}

}
