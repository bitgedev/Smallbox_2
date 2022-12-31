<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
</head>
<body>
	<header>
<%-- 		<jsp:include page="/top.jsp"></jsp:include> --%>
	</header>
	<h1>관리자페이지</h1>
		<h3><a href="admin_member.jsp">회원관리</a></h3>
		<h3><a href="admin_movie_insert.jsp">영화등록</a></h3>
		<h3><a href="admin_theater_insert.jsp">극장등록</a></h3>
		<h3><a href="admin_point_insert.jsp">포인트 지급</a></h3>
		<h3><a href="admin_coupon_insert.jsp">쿠폰 지급</a></h3>
		<h3><a href="Admin_notice_write.ad">공지등록</a></h3>
		<h3><a href="Notice_list.ad">공지목록</a></h3>
</body>
</html>