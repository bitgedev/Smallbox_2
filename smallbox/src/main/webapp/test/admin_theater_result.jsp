<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 출력</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>극장 출력</h1>
	<table border="1">
		<tr>
			<th width="150">상영 영화명</th>
			<th width="150">상영 날짜</th>
			<th width="150">상영 시간</th>
			<th width="50">좌석 수</th>
			<th width="50">좌석 행</th>
			<th width="50">좌석 열</th>
			<th width="100"></th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>
				<input type="button" value="수정" onclick="">
				<input type="button" value="삭제" onclick="">
			</td>
		</tr>
	</table>
	<h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
</body>
</html>