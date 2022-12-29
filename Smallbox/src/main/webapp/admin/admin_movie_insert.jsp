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
	<form action="MovieInsertPro.ad" name="fr" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>영화명</td>
				<td><label><input type="text" name="movie_title" required="required"></label></td>
			</tr>
			<tr>
				<td>등급</td>
				<td>
					<label><input type="radio" name="movie_grade" value="전체관람가" checked="checked">전체관람가</label>
					<label><input type="radio" name="movie_grade" value="12세이상관람가">12세이상관람가</label>
					<label><input type="radio" name="movie_grade" value="15세이상관람가">15세이상관람가</label>
					<label><input type="radio" name="movie_grade" value="청소년관람불가">청소년관람불가</label>
				</td>
			</tr>
			<tr>
				<td>장르</td>
				<td>
					<label><input type="checkbox" name="movie_genre" value="코미디">코미디</label>
					<label><input type="checkbox" name="movie_genre" value="로맨스">로맨스</label>
					<label><input type="checkbox" name="movie_genre" value="액션">액션</label>
					<label><input type="checkbox" name="movie_genre" value="애니메이션">애니메이션</label>
					<label><input type="checkbox" name="movie_genre" value="공포">공포</label>
					<label><input type="checkbox" name="movie_genre" value="SF">SF</label>
				</td>
				
			</tr>
			<tr>
				<td>개봉 날짜</td>
				<td>
					<label><input type="date" name="movie_open_date" required="required"></label>
				</td>
			</tr>
			<tr>
				<td>상영시간(runtime)</td>
				<td>
					<label><input type="number" name="movie_runtime" placeholder="분단위" min="0" required="required" ></label>
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
					<label><input type="file" name="movie_picture"></label>
				</td>
			</tr>
				<tr>
				<td>영화 스틸컷</td>
				<td>
					<label><input type="file" name="movie_stillcut" multiple="multiple"></label>
				</td>
			</tr>
			<tr>
				<td>누적 관람객 수</td>
				<td><label><input type="number" name="movie_viewer" min="0" ></label></td>
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