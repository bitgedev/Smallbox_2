<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
	<header id="header">
    	<jsp:include page="../inc/top.jsp"></jsp:include>
    </header>
	<h1>관리자페이지</h1>
		<h3><a href="MemberList.ad">회원관리</a></h3>
		<h3><a href="MovieInsert.ad">영화등록</a></h3>
		<h3><a href="TheaterInsert.ad">극장등록</a></h3>
		<h3><a href="PointInsert.ad">포인트 지급</a></h3>
		<h3><a href="CouponInsert.ad">쿠폰 지급</a></h3>
		<h3><a href="NoticeInsert.ad">공지등록</a></h3>
</body>
</html>