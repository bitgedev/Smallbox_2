<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script>
function checkPasswd(passwd) { 
	let spanCheckPasswdResult = document.getElementById("checkPasswdResult");

	if(passwd.length >= 8 && passwd.length <= 16) {
		spanCheckPasswdResult.innerHTML = "사용 가능한 패스워드";
		spanCheckPasswdResult.style.color = "BLUE";    		
	} else {
		spanCheckPasswdResult.innerHTML = "사용 불가능한 패스워드";
		spanCheckPasswdResult.style.color = "RED";
	}
}
function checkConfirmPasswd(confirmPasswd) {
	let passwd = document.fr.passwd.value;
	
	let spanCheckConfirmPasswdResult = document.getElementById("checkConfirmPasswdResult");
	
	if(passwd == confirmPasswd) {
		spanCheckConfirmPasswdResult.innerHTML = "패스워드 일치";
		spanCheckConfirmPasswdResult.style.color = "BLUE";    		
	} else {
		spanCheckConfirmPasswdResult.innerHTML = "패스워드 불일치";
		spanCheckConfirmPasswdResult.style.color = "RED";    	
	}
}
</script>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>비밀번호 변경 폼</h1>
	
	<form action="login.jsp" name="fr" method="post">
	<table border="1">
			<tr>
				<th>기존 비밀번호</th>
				<td><input type="password" placeholder="기존 비밀번호 입력하세요" id="pass" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="passwd" onkeyup="checkPasswd(this.value)" 
						placeholder="8 ~ 16글자 사이 입력" required="required">
					<span id="checkPasswdResult"></span>
				</td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td>
					<input type="password" name="passwd2" 
						onkeyup="checkConfirmPasswd(this.value)" required="required">
					<span id="checkConfirmPasswdResult"></span>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><input type="submit" value="변경완료"></td>
			</tr>
	</table>
	</form>
		
</body>
</html>