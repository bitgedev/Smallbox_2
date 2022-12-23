<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 작성</title>
</head>
<body>
<h1>극장 등록</h1>
	<form action="admin_notice_result.jsp" name="fr" method="post" enctype="multipart/form-data">
		<table border="1">
			<!-- 글쓴이는 관리자로 고정 -->
			<tr><td>제목</td><td><input type="text" name="notice_subject" required="required"></td></tr>
			<tr>
				<td>내용</td>
				<td><textarea name="movie_intro" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>파일</td>
				<td><input type="file" name="original_file" required="required"></td>
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