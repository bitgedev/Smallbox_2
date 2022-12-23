<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트 지급</title>
</head>
<body>
	<h1>포인트 지급</h1>
	<form action="admin_coupon_result.jsp" name="fr" method="post">
		<table border="1">
			<tr><td>회원 번호</td><td><input type="number" name="member_idx" required="required"></td></tr>
			<tr>
				<td>지급할 적립금</td>
				<td>
					<input type="number" name="member_point" required="required"> 
				</td>
			</tr>
			<tr>
				<td>적립금 지급 날짜</td>
				<td><input type="date" name="member_point_date"></td>
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