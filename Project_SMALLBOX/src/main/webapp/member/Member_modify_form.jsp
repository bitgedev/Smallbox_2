<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 </title>
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

</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
  <!-- 로그인 화면 폼 -->
    <div id = "sform" align="center">
		<form action="MemberModifyPro.sm" method="post">
	    	<h4 align="center"><b>회원 정보</b></h4>
			         <table>
				         <tr>
				        	 <td width="300px"><input type="text" name="member_name" value="${member.member_name }" readonly="readonly"></td>
				         </tr>
				         <tr>
				       		 <td width="300px"><input type="text" name="member_id" value="${member.member_id }" readonly="readonly"></td>
				         </tr>
				         <tr>
				         	 <td width="300px"><input type="text" name="member_email" value="${member.member_email }" readonly="readonly"></td>
				         </tr>
				         <tr>
				             <td width="300px"><input type="text" name="member_phone" value="${member.member_phone }" readonly="readonly"></td>
				         </tr>
			         	 <br>
				         <tr> <!-- 기존 패스워드 -->
				        	 <td width="300px"><input type="password" placeholder="기존 비밀번호" name="oldPasswd" value = "${member.member_passwd }" readonly="readonly"></td>
				         </tr>
				         <tr> <!-- 새 패스워드 -->
				         	<td width="300px">
				         	<input type="password" name="newPasswd" onkeyup="checkPasswd(this.value)" placeholder="8 ~ 16글자 사이 입력" required="required">
							<span id="checkPasswdResult"></span>
				         	</td>
				         </tr>
				         <tr> 
				         	<!-- 새 패스워드 확인 -->
				        	 <td width="300px">
				        		<input type="password" name="newPasswdCheck" onkeyup="checkConfirmPasswd(this.value)" required="required">
								<span id="checkConfirmPasswdResult"></span><br>
				         	    <button type="submit">수정</button>
				        	 </td>
				         </tr>
			     </table>
        </form>
    </div>
</body>
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
<!-- ------------------------------------------------------------------------------------------------------------>

<!-- 비밀번호 수정 -->
<script type="text/javascript">
//2. 비밀번호 입력란에 키를 누를때마다 비밀번호 길이 체크하기
// => 체크 결과를 비밀번호 입력창 우측 빈공간에 표시하기
// => 비밀번호 길이 체크를 통해 8 ~ 16글자 사이이면 "사용 가능한 패스워드"(파란색) 표시,
//    아니면, "사용 불가능한 패스워드"(빨간색) 표시
function checkPasswd(passwd) { // 입력받은 패스워드 전달받기
	// span 태그 영역(checkPasswdResult) 객체 가져오기
	let spanCheckPasswdResult = document.getElementById("checkPasswdResult");

	// 입력된 패스워드 길이 체크
	if(passwd.length >= 8 && passwd.length <= 16) {
		spanCheckPasswdResult.innerHTML = "사용 가능";
		spanCheckPasswdResult.style.color = "GREEN";    		
	} else {
		spanCheckPasswdResult.innerHTML = "사용 불가";
		spanCheckPasswdResult.style.color = "RED";
	}
}

//3. 비밀번호확인 입력란에 키를 누를때마다 기존 비밀번호와 같은지 체크하기
// => 체크 결과를 비밀번호확인 입력창 우측 빈공간에 표시하기
// => 비밀번호와 비밀번호확인 입력 내용이 같으면 "비밀번호 일치"(파란색) 표시,
//    아니면, "비밀번호 불일치"(빨간색) 표시
function checkConfirmPasswd(confirmPasswd) {
	// 패스워드 입력란에 입력된 패스워드 가져오기
	let newPasswd = document.fr.newPasswd.value;
	
	// span 태그 영역(checkConfirmPasswdResult) 객체 가져오기
	let spanCheckConfirmPasswdResult = document.querySelector("#checkConfirmPasswdResult");
	
	// 두 패스워드 일치 여부 판별
	if(newPasswd == newPasswdCheck) {
		spanCheckConfirmPasswdResult.innerHTML = "일치";
		spanCheckConfirmPasswdResult.style.color = "GREEN";    		
	} else {
		spanCheckConfirmPasswdResult.innerHTML = "불일치";
		spanCheckConfirmPasswdResult.style.color = "RED";    	
	}
}


</script>

</body>
</html>
