<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상영 영화관 정보수정</title>
</head>
<body>
	<h1>관리자 - 상영 영화관 정보수정</h1>
	<form action="AdminTheaterModifyPro.ad" name="fr" method="post">
	<input type="hidden" name="theater_idx" value="${theater.theater_idx }">
		<table border="1">
			<tr>
				<td>상영 영화명</td>
				<td>
					<input type="text" name="theater_title" value="${theater.theater_title }" required="required">
				</td>
			</tr>
			<tr>
				<td>상영 날짜</td>
				<td>
					<input type="date" name="theater_date" value="${theater.theater_date }" required="required">
				</td>
			</tr>
			<tr>
				<td>영화 상영시각</td>
				<td>
<%-- 					<input type="text" name="theater_time" value="${theater.theater_time }" required="required">  --%>
					1회차 [09:00]<input type="checkbox" name="theater_time" value="09:00:00"><br>
					2회차 [12:00]<input type="checkbox" name="theater_time" value="12:00:00"><br>
					3회차 [15:00]<input type="checkbox" name="theater_time" value="15:00:00"><br>
					4회차 [18:00]<input type="checkbox" name="theater_time" value="18:00:00"><br>
					5회차 [21:00]<input type="checkbox" name="theater_time" value="21:00:00"><br>
					6회차 [24:00]<input type="checkbox" name="theater_time" value="24:00:00">
				</td>
			</tr>
			<tr>
				<td>예매 현황</td>
				<td><input type="number" name="theater_reserved" value="${theater.theater_reserved }"></td>
			</tr>
			<tr>
				<td>좌석 수</td>
				<td><input type="number" name="theater_seat" value="${theater.theater_seat }"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정완료">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>