<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<!-- css -->
<link rel="stylesheet" href="assets/css/reset.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/swiper.css">
<link rel="stylesheet" href="assets/css/style.css">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Vendor CSS Files -->
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

<link href="assets/css/style.css" rel="stylesheet">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- --> 
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
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>