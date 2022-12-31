<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../top.jsp"></jsp:include>
	</header>
	<h1>전체 영화</h1>
	
		<h2>현재 상영작</h2>
<!-- 		임시로 디비에 저장된 모든 영화를 현재 상영작으로 취급합니다.  -->
		
		<input type="text" name="keyword" class="input_box">
		<input type="submit" value="Search" class="btn">
		
		<hr>
		
		<table border="1">
			<tr>
				<th>영화 등급</th>
				<th>영화 제목</th>
				<th>개봉일</th>
			</tr>
			<c:forEach var="movie" items="${movieList }">
				<tr>
					<td>${movie.movie_grade }</td>
					<td>
						<a href="MovieDetail.mv?movie_idx=${movie.movie_idx }">${movie.movie_title }</a>
					</td>
					<td>${movie.movie_open_date }</td>
				</tr>
			</c:forEach>

		</table>
</body>
</html>