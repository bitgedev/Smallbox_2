<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberBean"%>
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
<title>마이 페이지</title>
</head>
<body>
	<header id="header">
    	<jsp:include page="../inc/top.jsp"></jsp:include>
    </header>
    <!-- //header -->
    <div align="center">
	    <form action="">
			<h1><b>마이 페이지</b></h1>
				<h3><a href="WishList.sm">찜 목록</a></h3>
				<h3><a href="MemberModifyForm.sm?member_id=${sessionScope.sId }">회원 정보</a></h3>
				<h3><a href="MemberDeleteForm.sm?member_id=${sessionScope.sId }">회원 탈퇴</a></h3>
	    </form>
	    
    </div>

<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>