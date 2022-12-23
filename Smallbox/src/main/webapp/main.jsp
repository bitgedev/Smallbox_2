<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">

 <!-- 파비콘 -->
<link rel="shortcut icon" href="assets/icons/favicon.ico">
<link rel="apple-touch-icon-precomposed" href="assets/icons/favicon_72.png" />
<link rel="apple-touch-icon-precomposed" sizes="96x96" href="assets/icons/favicon_96.png" />
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/icons/favicon_144.png" />
<link rel="apple-touch-icon-precomposed" sizes="192x192" href="assets/icons/favicon_192.png" />

<!-- 웹 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
</head>
<body id="body">
	<header>
		<!--  Login, Join -->
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>
	<form action="">
	<article>
		<h1>SMALL BOX</h1>
		<h3>열심히 공부할 준비 되셨나요 ~ </h3>
		<a href="MovieList.mv">영화 목록</a><br>
		<a href="date_reserve.jsp">예매하기(날짜선택만)</a><br>
		<a href="AdminMain.ad">관리자</a>
	</article>
	</form>
	<header>
		<jsp:include page="inc/bottom.jsp"></jsp:include>
	</header>
</body>
</html>