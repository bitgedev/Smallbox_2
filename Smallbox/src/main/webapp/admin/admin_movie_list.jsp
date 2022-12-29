<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
</head>
<body>
	<form>
	<h1>영화 목록</h1>
		<table border="1">
			<tr>
				<th>영화번호</th>
				<th width="200">영화명</th>
				<th width="200">영화포스터</th>
				<th>등급</th>
				<th>개봉일</th>
				<th>상영시간</th>
				<th>누적 관람객</th>
			</tr>
			
			<!-- action에서 request 객체에 저장한 movieList와 pageInfo 속성 사용 -->
			<c:forEach var="movie" items="${movieList }">
				<!-- 만약 pageNum이 비어있다면 pageNum 변수를 선언하고 기본값으로 1으로 설정 -->
				<c:choose>
					<c:when test="${empty param.pageNum }">
						<c:set var="pageNum" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum }" />
					</c:otherwise>
				</c:choose>
				
				<!-- 글 제목을 클릭하면 각 영화번호(movie_idx)에 맞는 상세정보 조회 페이지로 이동 -->
				<tr>
					<td>${movie.movie_idx }</td>
					<!-- action에서 넘겨받은 pageNum 파라미터가 아닌 뷰페이지에서 선언한 pageNum 변수 사용 -->
					<td>${movie.movie_title }</td>
					<td><a href="AdminMovieDetailPro.ad?movie_idx=${movie.movie_idx}&pageNum=${pageNum }"><img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}" width="200" height="200"></a></td>
					<td>${movie.movie_grade }</td>
					<td>${movie.movie_open_date }</td>
					<td>${movie.movie_runtime }</td>
					<td>${movie.movie_viewer }</td>
				</tr>
			</c:forEach>
		</table>
		
		<section id="buttonArea"> <!-- 버튼 영역 -->
			<form action="AdminMovieList.ad" method="get"> <!-- 검색 버튼 -->
				<input type="text" name="keyword" class="input_box">
				<input type="submit" value="Search" class="btn">
			</form>
			<!-- 영화 등록 버튼 -->
			<input type="button" value="영화 등록" class="btn" onclick="location.href='MovieInsertForm.ad'">
		</section>

		<section id="pageList"> <!-- 페이징 처리 영역 -->
		<!-- 현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달 -->
		   
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
		
		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		
		</section>
	</form>
</body>
</html>