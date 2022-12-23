<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
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
<div id="container" class="container" align="center">
	<form action="MemberJoinPro.sm" method="post" name="joinForm" >
		<h1 align="center"></em>회원 가입</h1>
			<table border="1" align="center">
				<tr>
					<td>이름</td>
					<td><input type="text" name="member_name" id="member_name" required="required" size="20"></td>
				</tr>
				<tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="member_id" id="member_id" required="required" size="20" placeholder="4-16자리 영문자,숫자 조합">
						<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</td>
				<tr>
				<tr>
					<td>패스워드</td>
					<td>
						<input type="password" name="member_passwd" id="member_passwd" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합">
						<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</td>
				</tr>
				<tr>
					<td>E-Mail</td>
					<td>
						<input type="text" name="member_email1" required="required" size="10">@
						<input type="text" name="member_email2" required="required" size="10">
						<select name="selectDomain">
							<option value="">직접입력</option>	
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
						</select>
					</td>
				</tr>
					<tr>
					<td>연락처</td>
					<td>
						<input type="text" name="member_phone" id="member_phone" required="required" size="20">
					</td>
				</tr>
				<tr>
					<td>가입날짜</td>
					<td>
						<input type="date" name="member_join_date" required="required"> 
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="member_birth_date" required="required"> 
					</td>
				</tr>
				<tr>
			</table>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="회원가입">
				<input type="button" value="취소" onclick="history.back()">
			</td>
		</tr>
	</form>
</div>
</body>
</html>