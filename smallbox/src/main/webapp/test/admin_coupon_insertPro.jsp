<%@page import="java.sql.Date"%>
<%@page import="Member.MemberDTO"%>
<%@page import="Member.CouponDAO"%>
<%@page import="Member.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

request.setCharacterEncoding("UTF-8");

Date coupon_date = Date.valueOf(request.getParameter("coupon_date"));
Date coupon_end_date = Date.valueOf(request.getParameter("coupon_end_date"));

CouponDTO coupon = new CouponDTO();
coupon.setMember_id(request.getParameter("member_id"));
coupon.setCoupon_type(request.getParameter("coupon_type"));
coupon.setCoupon_rate(Integer.parseInt(request.getParameter("coupon_rate")));
coupon.setCoupon_date(coupon_date); 
coupon.setCoupon_end_date(coupon_end_date); 

CouponDAO dao = new CouponDAO();
int insertCount = dao.insertCoupon(coupon);

if(insertCount>0) {
	response.sendRedirect("admin_coupon_result.jsp");
} else { %>
	<script type="text/javascript">
	alert("쿠폰 지급 실패!");
	history.back();
	</script>
<%} %>

</body>
</html>