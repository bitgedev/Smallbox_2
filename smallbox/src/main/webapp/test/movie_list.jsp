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
		<jsp:include page="top.jsp"></jsp:include>
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
<!-- 			이 밑으로는 디비에서 불러온 값을 넣습니다. 반복문을 사용하여 작업해주시면 됩니다. -->
			<c:forEach var="movie" items="${movieList }">
				<tr>
					<td>${movie.movie_grade }</td>
	<!-- 			현재 사진을 바로 불러올 수는 없어서 임시로 영화 제목 클릭시 상세정보로 이동하도록 합니다. -->
	<!-- 			주소창에서 넘길 때 파라미터값 넘겨서 이동하기 -->
					<td>
						<a href="MovieDetail.mv?movie_idx=${movie.movie_idx }">${movie.movie_title }</a>
					</td>
					<td>${movie.movie_open_date }</td>
				</tr>
			</c:forEach>
				<tr>
					<td>${movie.movie_grade }</td>
				</tr>
				

		</table>
</body>
</html>