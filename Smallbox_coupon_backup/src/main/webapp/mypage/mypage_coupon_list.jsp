<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 지급</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<h1>쿠폰 지급</h1>
	<table border="1">
		<tr>
			<th width="150">회원 아이디</th>
<!-- 			<th width="150">쿠폰 번호</th> -->
			<th width="150">쿠폰 유형</th>
			<th width="100">할인율</th>
			<th width="150">쿠폰 발행 날짜</th>
			<th width="150">쿠폰 만료 날짜</th>
			<th width="100"></th>
		</tr>
		
		<c:forEach var="coupon" items="${couponList }">
		<tr>
			<td>${coupon.member_id } </td>
<%-- 			<td>${coupon.coupon_idx } </td> --%>
			<td>${coupon.coupon_type } </td>
			<td>${coupon.coupon_rate } </td>
			<td>${coupon.coupon_date } </td>
			<td>${coupon.coupon_end_date } </td>
			<td>
				<input type="button" value="사용" onclick="">
			</td>
		</tr>
	</c:forEach>
	</table>
	<h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
</body>
</html>