<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
	<h1> 비밀번호찾기</h1>
	
	<form action="" method="post">
	<table border="1">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" required="required"></td>
			</tr>	
			<tr>
				<th>번호</th> <!-- 이메일이랑 폰번호중에 임의로 번호로 했습니다 -->
				<td><input type="text" name="phone" required="required"></td>
			</tr>	
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="찾기"></td>
			</tr>
	</table>
	</form>
	
</body>
</html>