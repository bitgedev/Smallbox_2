<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
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
    
<title>로그인</title>
<style type="text/css">

form {
	padding : 150px 150px
}
 
</style>
</head>
<body>
	<header id="header">
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
    <!-- //header -->
<div id="container" class="container" align="center">
		<form action="MemberLoginPro.sm" method="post">
  			<h2 align="center">스몰박스 로그인</h2>
				<table border="1" >
					<tr>
						<th>아이디</th>
						<td><input type="text" name="member_id" required="required" value="${sessionScope.sId }"></td>
					</tr>	
					<tr>
						<th>패스워드</th>
						<td><input type="password" name="member_passwd" required="required" value="member_passwd"></td>
					</tr>	
					<tr>
						<td colspan="1" align="center"><input type="submit" value="로그인"></td>
					</tr>
			</table>
		</form>
		
			<div align="center">
           		<button> <a href="FindIdForm.sm">아이디 찾기</a></button> | <button><a href="FindPasswdForm.sm">비밀번호 찾기</a></button> | <button><a href="MemberJoinForm.sm">회원가입</a></button>
        	</div>
</div>
</body>
</html>