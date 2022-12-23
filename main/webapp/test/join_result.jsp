<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	<h1>회원 가입 완료</h1>
	<input type="button" value="홈으로" onclick="location.href='./'">
	<input type="button" value="로그인" onclick="location.href='MemberLoginForm.sm'">
</body>
</html>
