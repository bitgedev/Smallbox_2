<%@page import="vo.CouponDTO"%>
<%@page import="dao.CouponDAO"%>
<%@page import="vo.MemberBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 관리</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>쿠폰 관리</h1>
	<h5>관리자 페이지에서 각 회원에게 부여한 쿠폰 확인하시면 됩니다.</h5>
	
	<table border="1">
		<tr>
			<th width="150">쿠폰 유형</th>
			<th width="100">할인율</th>
			<th width="150">쿠폰 발행 날짜</th>
			<th width="150">쿠폰 만료 날짜</th>
		</tr>
		
		<% 
		MemberBean member = new MemberBean();
		member.setMember_id((String)session.getAttribute("sId"));
		
		CouponDAO dao = new CouponDAO();
		List<CouponDTO> couponList = dao.selectMemberCoupon(member); // 마이페이지로부터 넘겨받은 세션아이디
		System.out.print(couponList);
		
		for(CouponDTO coupon : couponList) {
		%>
		<tr>
			<td><%=coupon.getCoupon_type() %></td>
			<td><%=coupon.getCoupon_rate() %></td>
			<td><%=coupon.getCoupon_date() %></td>
			<td><%=coupon.getCoupon_end_date() %></td>
		</tr>
		<% } %>
	</table>
	<h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
</body>
</html>