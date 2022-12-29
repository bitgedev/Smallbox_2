<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<style type="text/css">
	#body {
		text-align: center;
		background: #e6f7ff;
	}
</style>
</head>
<body id="body">
	<header>
		<!--  Login, Join -->
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>
	<article>
		<h1>SMALL BOX</h1>
		<h3>열심히 공부할 준비 되셨나요 ~ </h3>
		<a href="movie_list.jsp">영화 목록</a><br>
		<a href="date_reserve.jsp">예매하기(날짜선택만)</a><br>
		<a href="Admin.ad">관리자</a>
	</article>
</body>
</html>