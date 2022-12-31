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
		// 아이디 찾기 버튼 클릭시 이벤트 처리
		$("#findId").on("click", function() {
			// AJAX 를 활용하여 FindIdPro.sm 서블릿 요청을 통해
			// 이름, 핸드폰번호, 생년월일이 같은 아이디 출력
			$.ajax({
					type: "get",
					url: "FindIdPro.sm",
					data: {
						name: $("#member_name").val(),
						phone: $("#member_phone").val(),
						birth_date: $("#member_birth_date").val()
					},
					success: function(result) {
						// 리턴받은 판별 결과("true", "false") 판별
						$("#resultArea").html(result);
						
						}
				});
		});
	});
	
</script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<h1>아이디 찾기</h1>
	
	<form action="" >
		<input type="text" value="이름" name="member_name" id="member_name" > <br>
		<input type="text" value="핸드폰번호" name="member_phone" id="member_phone"> <br>
		<input type="date" value="생년월일" name="member_birth_date" id="member_birth_date"> <br>
		<input type="button" id="findId" value="아이디 찾기">
	
	</form>
	<hr>
	<div id="resultArea"></div>	
</body>
</html>