<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	$(function() {
	});
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<h1>비밀번호 찾기</h1>
	
	<form action="FindPasswdPro.sm" method="post">
		<input type="text" value="아이디" name="member_id" id="member_id" > <br>
		<input type="text" value="이메일" name="member_email" id="member_email"> <br>
		<input type="submit" id="findPasswd" value="비밀번호 찾기">
	</form>
	<hr>
	<div id="resultArea"></div>	
</body>
</html>