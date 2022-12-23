<%@page import="vo.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
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
	    </form>
    </div>
</body>
</html>