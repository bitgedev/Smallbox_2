<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
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
<!-- ----------------------------------------들고다니세요-------------------------------------------------------------------------- -->
<title>회원 관리</title>
</head>
<body>
	<header id="header">
    	<jsp:include page="../inc/top.jsp"></jsp:include>
    </header>
<h1>회원 관리</h1>
	<table border="1">
		<tr>
			<th width="150">회원 번호</th>
			<th width="150">아이디</th>
			<th width="100">패스워드</th>
			<th width="150">이름</th>
			<th width="150">E-Mail</th>
			<th width="100">연락처</th>
			<th width="100">가입날짜</th>
			<th width="100">생년월일</th>
		</tr>
		<tr>
			<%-- List<MemberBean> 객체 (memberList) 만큼 반복하면서 데이터 출력 --%>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.member_idx }</td>
					<td>${member.member_id }</td>
					<td>${member.member_passwd }</td>
					<td>${member.member_name }</td>
					<td>${member.member_email }</td>
					<td>${member.member_phone }</td>
					<td>${member.member_join_date }</td>
					<td>${member.member_birth_date }</td>
				</tr>
			</c:forEach>
			<td>
				<input type="button" value="수정" onclick="">
				<input type="button" value="삭제" onclick="">
			</td>
		</tr>
	</table>
	<h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>