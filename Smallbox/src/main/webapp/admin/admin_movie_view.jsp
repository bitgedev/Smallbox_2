<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
function confirm_delete() {
	let result = confirm("삭제 하시겠습니까?");
	
	if(result) {
		location.href="MovieDeletePro.ad?movie_idx=${movie.movie_idx}";
	}
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 결과</title>
</head>
<body>
	<h1>영화 출력</h1>
		<table border="1">
			<tr><td>영화명</td><td>${movie.movie_title }</td></tr>
			<tr>
				<td>등급</td>
				<td>${movie.movie_grade }</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>${movie.movie_genre }</td>
			</tr>
			<tr>
				<td>개봉일</td>
				<td>${movie.movie_open_date }</td>
			</tr>
			<tr>
				<td>상영시간</td>
				<td>${movie.movie_runtime }</td>
			</tr>
			<tr>
				<td height="300">줄거리</td>
				<td colspan="3">${movie.movie_intro }</td>
			</tr>
			<tr>
				<td>등장인물</td>
				<td>${movie.movie_actors }</td>
			</tr>
			<tr>
				<td>영화 포스터</td>
				<td>
					<img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}">
				</td>
			</tr>
			<tr>
				<td>누적 관람객 수</td>
				<td>${movie.movie_viewer }</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="목록" onclick="location.href='AdminMovieList.ad?pageNum=${param.pageNum}'">
					<input type="button" value="수정" onclick="location.href='MovieModifyForm.ad?movie_idx=${movie.movie_idx}&pageNum=${param.pageNum}'">
					<input type="button" value="삭제" onclick="javascript:confirm_delete()">
				</td>
			</tr>
		</table>
</body>
</html>