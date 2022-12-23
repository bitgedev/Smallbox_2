<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 등록</title>
</head>
<body>
	<h1>극장 등록</h1>
	<form action="admin_theater_insertPro.jsp" name="fr" method="post">
		<table border="1">
			<tr><td>상영 영화명</td><td><input type="text" name="theater_title" required="required"></td></tr>
			<tr>
				<td>상영 날짜</td>
				<td>
					<input type="date" name="theater_date" required="required">
				</td>
			</tr>
			<tr>
				<td>상영 시간</td>
				<td>
					<input type="time" name="theater_time" required="required"> 
				</td>
			</tr>
			<tr>
				<td>좌석 예약여부</td>
				<td><input type="number" name="theater_reserved"></td>
			</tr>
			<tr>
				<td>좌석 번호</td>
				<td><input type="number" name="theater_seat"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>