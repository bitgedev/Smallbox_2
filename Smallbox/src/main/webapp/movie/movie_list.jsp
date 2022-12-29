<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html>
<% String sId = (String)session.getAttribute("sId"); 
//    System.out.print(sId);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
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
				<th>영화 포스터</th>
				<th>개봉일</th>
				<th>임시 찜버튼</th>
			</tr>
			
			<!-- MovieListProAction에서 request에 저장한 movieList 속성을 사용해 뷰 화면에 데이터 출력 -->
			<c:forEach var="movie" items="${movieList }">
				<tr>
					<td>${movie.movie_grade }</td>
					<td>
						${movie.movie_title }
					</td>
					<td><a href="AdminMovieDetailPro.ad?movie_idx=${movie.movie_idx}&pageNum=${pageNum }"><img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}" width="200" height="200"></a></td>
					<td>${movie.movie_open_date }</td>
					<!-- 찜 버튼을 누르면 MovieLikePro(찜 작업 수행) 매핑 -->
					<td> 
<%-- 					<input type="button" value="찜" onclick="location.href='MovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}'"> --%>
					<a href="MovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}"><i class='far fa-heart' style='font-size:24px;color:red'></i></a>
					<!-- 찜해제 버튼을 누르면 CancelMovieLikePro(찜 작업 수행) 매핑 -->
					<a href="CancelMovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}"><i class='fas fa-heart' style='font-size:24px;color:red'></i></a></td>
<%-- 					<input type="button" value="찜해제" onclick="location.href='CancelMovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}'"></td> --%>
				</tr>
			</c:forEach>
				
		</table>
</body>
</html>