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
<title>회원 탈퇴</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- 회원탈퇴 작업 폼 -->
	<form name="checkPass" align="center" action="MemberDeletePro.sm" method="post">
	    <input type="hidden" value="${param.member_id }" name="member_id">
	    <div>
	        <strong>탈퇴하시려면 비밀번호를 한 번 더 입력해 주세요.</strong>
	    </div><br>
		<div>
			<label>비밀번호</label><input id="member_passwd" type="password" name="member_passwd">
	    </div>
	    <button type="submit" class="btn">확인</button>
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</form>
</body>
</html>