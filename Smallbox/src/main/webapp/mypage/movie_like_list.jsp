<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찜목록</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- header -->
	
	<!-- 본문 -->
	<form action="">
	<h1>찜목록</h1>
	
	<table border="1">
		<tr>
			<th>영화 제목</th>
			<th>영화 포스터</th>
		</tr>
		
		<!-- MovieLikeListProAction으로 부터 전달받은 request 객체의 likeList(영화 정보)를 꺼내서 출력 -->
		<c:forEach var="movie" items="${likeList }">
		<tr>
			<td>${movie.movie_title }</td>
			<td><img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}" width="150" height="150"></td>
		</tr>	
		</c:forEach>
	</table>
	</form>
	
	<!-- bottom -->
	<header>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</header>
</body>
</html>