<%@page import="Member.CouponDAO"%>
<%@page import="Member.CouponDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 지급</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>쿠폰 지급</h1>
	<table border="1">
		<tr>
			<th width="150">회원 아이디</th>
			<th width="150">쿠폰 유형</th>
			<th width="100">할인율</th>
			<th width="150">쿠폰 발행 날짜</th>
			<th width="150">쿠폰 만료 날짜</th>
			<th width="100"></th>
		</tr>
		
		<% 
		CouponDAO dao = new CouponDAO();
		CouponDTO coupon = dao.selectCoupon();
		%>
		<tr>
			<td><%=coupon.getMember_id() %></td>
			<td><%=coupon.getCoupon_type() %></td>
			<td><%=coupon.getCoupon_rate() %></td>
			<td><%=coupon.getCoupon_date() %></td>
			<td><%=coupon.getCoupon_end_date() %></td>
			<td>
				<input type="button" value="수정" onclick="">
				<input type="button" value="삭제" onclick="">
			</td>
		</tr>
	</table>
	<h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
</body>
</html>