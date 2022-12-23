<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>로그인</h1>
	<form action="loginPro.jsp" method="post">
	<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="member_id" required="required"></td>
			</tr>	
			<tr>
				<th>패스워드</th>
				<td><input type="password" name="member_passwd" required="required"></td>
			</tr>	
			<tr>
				<td colspan="1" align="center"><input type="submit" value="로그인"></td>
			</tr>
	</table>
	
			<div >
           		 <a href="find_id_form.jsp">아이디 찾기</a> | <a href="find_pass_form.jsp">비밀번호 찾기</a> | <a href="join_form.jsp">회원가입</a>
        	</div>
	
	
	
	</form>
</body>
</html>