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
<script src="http://code.jquery.com/jquery-3.6.3.min.js"></script>
<script type="text/javascript">

$(function() {
   $("#member_id").on("change",function(){
      $.ajax({
         url:"MemberCheckId.me",
         data: {
         id:$("member_id").val()
         },
         success: function(result){
            if(result == "true"){
               $("#checkIdResult").html("이미 존재하는 아이디입니다.").css("color","red");
            }else{
               $("#checkIdResult").html("사용가능한 아이디입니다.").css("color","green");
            }
         }
      });
   });
	   
	   $("#selectDomain").on("change",function(){
		      let domain = $("#selectDomain").val();
		      $("#email2").val(domain);
		      
		      //단 , 선택된 도메인이 "직접입력" 이 아닐경우 email2 입력창 잠금 
		      //주의 ! 자바스크립트상의 readonly 속성 제어 시 명칭이 readOnly
		      if(domain == ""){
		         $("#email2").prop("readonly", false);
		         $("#email2").css("background", "white");
		         $("#email2").focus();
		      }else{
		         $("#email2").prop("readonly",true);
		         $("#email2").css("background", "lightgray");
		      }
	   
   });
   
});

</script>
<title>회원 가입</title>
</head>
<body>
	<header id="header">
		<jsp:include page="/inc/top.jsp"></jsp:include>
	</header>
	<hr>
    <!-- //header -->
<div id="container" class="container" align="center">
	<form action="MemberJoinPro.sm" method="post" name="joinForm" >
		<h1 align="center">회원 가입</h1>
			<table border="1" align="center" width="500" height="300">
				<tr>
					<td> 이름</td>
					<td><input type="text" name="member_name" id="member_name" required="required" size="20"></td>
				</tr>
				<tr>
				<tr>
					<td> 아이디</td>
					<td>
						<input type="text" name="member_id" id="member_id" required="required" size="20" placeholder="4-16자리 영문자,숫자 조합">
						<span id="checkIdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</td>
				<tr>
				<tr>
					<td> 패스워드</td>
					<td>
						<input type="password" name="member_passwd" id="member_passwd" required="required" size="20" placeholder="8-20자리 영문자,숫자,특수문자 조합">
						<span id="checkPasswdResult"><!-- 자바스크립트에 의해 메세지가 표시될 공간 --></span>
					</td>
				</tr>
				<tr>
					<td> E-Mail</td>
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
					<td> 연락처</td>
					<td>
						<input type="text" name="member_phone" id="member_phone" required="required" size="20">
					</td>
				</tr>
				<tr>
					<td> 가입날짜</td>
					<td>
						<input type="date" name="member_join_date" required="required"> 
					</td>
				</tr>
				<tr>
					<td> 생년월일</td>
					<td>
						<input type="date" name="member_birth_date" required="required"> 
					</td>
				</tr>
				<tr>
			</table>
		<tr align="center">
			<td colspan="2" align="center">
				<input type="submit" value="회원가입" class="button">
				<input type="button" value="취소" class="button" onclick="history.back()">
			</td>
		</tr>
	</form>
</div>
<!-- ---------------footer------------- -->
<footer id="footer">
	<jsp:include page="/inc/bottom.jsp"></jsp:include>
</footer>
<!-- ---------------footer------------- -->
</body>
</html>