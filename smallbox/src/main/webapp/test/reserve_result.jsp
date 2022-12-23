<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 결과 -> 결제창에 출력</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>예매 결과</h1>
	<table border="1">
		<tr>
			<th width="150">회원 번호</th>
			<th width="150">상영 영화명</th>
			<th width="150">상영 날짜</th>
			<th width="150">상영 시간</th>
			<th width="50">좌석</th>
			<th width="100"></th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<input type="button" value="예매 취소" onclick="">
			</td>
		</tr>
	</table>
</body>
</html>