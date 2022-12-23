<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 관리</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>공지글 관리</h1>
	<table border="1">
		<tr>
			<th width="100">글번호</th> 
			<th width="150">작성자</th> <!-- 관리자 --> 
			<th width="150">제목</th>
			<th width="150">내용</th>
			<th width="150">파일명</th>
			<th width="50">조회수</th> <!-- 기본값 0 -->
			<th width="150">가입날짜</th>
			<th width="100"></th>
		</tr>
		
		<tr>
			<td></td>
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
</body>
</html>