<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
</head>
<body>
<h1>영화 등록</h1>
	<form action="admin_movie_insertPro.jsp" name="fr" method="post">
		<table border="1">
			<tr><td>영화명</td><td><input type="text" name="movie_title" required="required"></td></tr>
			<tr>
				<td>등급</td>
				<td>
					<input type="text" name="movie_grade" placeholder="15세/청소년관람불가.." required="required">
				</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>
					<input type="text" name="movie_genre" required="required"> 
				</td>
			</tr>
			<tr>
				<td>개봉 날짜</td>
				<td>
					<input type="date" name="movie_open_date" required="required"> 
				</td>
			</tr>
			<tr>
				<td>상영시간(runtime)</td>
				<td>
					<input type="number" name="movie_runtime" placeholder="분단위로 할게요" required="required">
				</td>
			</tr>
			<tr>
				<td>줄거리</td>
				<td><textarea name="movie_intro" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>등장인물</td>
				<td><textarea name="movie_actors" cols="50" rows="10"></textarea></td>
			</tr>
			<tr>
				<td>영화 포스터</td>
				<td>
					<input type="text" name="movie_picture" placeholder="이미지 실제 경로 - 안해도됨" >
				</td>
			</tr>
			<tr>
				<td>누적 관람객 수</td>
				<td><input type="number" name="movie_viewer"></td>
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