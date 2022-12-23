<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>회원 가입</h1>
	<form action="joinPro.jsp" method="post" name="joinForm">
		<table border="1">
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
				<td>생년월일</td>
				<td>
					<input type="date" name="member_birth_date" required="required"> 
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="button" value="취소" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>