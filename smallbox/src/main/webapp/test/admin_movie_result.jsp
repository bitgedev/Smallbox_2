<%@page import="vo.MovieBean"%>
<%@page import="dao.MovieDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 결과</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>영화 출력</h1>
		<input type="button" value="영화 등록" onclick="location.href='admin_movie_insert.jsp'"><hr>
		<table border="1">
		<tr>
			<th width="50">영화번호</th>
			<th width="150">영화명</th>
			<th width="150">등급</th>
			<th width="100">장르</th>
			<th width="150">개봉 날짜</th>
			<th width="100">상영시간(runtime)</th>
			<th width="150">줄거리</th>
			<th width="150">등장인물</th>
			<th width="150">영화 포스터</th>
			<th width="50">누적 관람객 수</th>
			<th width="100"></th>
		</tr>
		
		<%
		MovieDAO dao = new MovieDAO();
		//movie dao 에 원래 private 인데 안불러와져서 일단 public으로 바꿈,
		List<MovieBean> movieList = dao.selectMovieList();
		
		for(MovieBean movie : movieList) {
		%>
		<tr>
			<td><%=movie.getMovie_idx() %></td>
			<td><%=movie.getMovie_title() %></td>
			<td><%=movie.getMovie_grade() %></td>
			<td><%=movie.getMovie_genre() %></td>
			<td><%=movie.getMovie_open_date() %></td>
			<td><%=movie.getMovie_runtime() %></td>
			<td><%=movie.getMovie_intro() %></td>
			<td><%=movie.getMovie_actors() %></td>
			<td><%=movie.getMovie_picture() %></td>
			<td><%=movie.getMovie_viewer() %></td>
			<td>
				<input type="button" value="수정" onclick="">
				<input type="button" value="삭제" onclick="">
			</td>
		</tr>
		<%} %>
	</table>
	 <h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
</body>
</html>