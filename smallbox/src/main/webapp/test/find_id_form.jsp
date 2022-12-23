<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>아이디 찾기</h1>
	
	<form action="find_idPro.jsp" method="post">
		<input type="text" value="이름" name="name"> <br>
		<input type="text" value="생년월일(6자리 입력)" name="birth_day"> <br><br>
		<input type="submit" value="아이디 찾기">
	
	</form>
	
</body>
</html>