<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 관리</title>
</head>
<body>
	<header>
		<jsp:include page="/top.jsp"></jsp:include>
	</header>
	<h1>공지 목록</h1>
				<c:choose>
					<c:when test="${empty param.pageNum }">
						<c:set var="pageNum" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum }" />
					</c:otherwise>
				</c:choose>
				
	<table border="1">
		<tr>
			<th width="100">글번호</th> 
			<th width="150">제목</th>
			<th width="50">조회수</th>
			<th width="200">작성일자</th>
		</tr>
		
<!-- 		글 상세 목록 표시 -->
		<c:forEach var="notice" items="${noticeList }">
			<tr>
				<td>${notice.notice_idx }</td>
				<c:choose>
					<c:when test="${empty param.pageNum }">
						<c:set var="pageNum" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum }" />
					</c:otherwise>
				</c:choose>
				<td id="subject">
					<a href="NoticeDetail.ad?notice_idx=${notice.notice_idx }&pageNum=${pageNum }">
						${notice.notice_subject }
					</a>
				</td>
				<td>${notice.notice_readCount }</td>
				<td>
					<%-- JSTL 의 fmt 라이브러리를 활용하여 날짜 표현 형식 변경 --%>
					<%-- fmt:formatDate - Date 타입 날짜 형식 변경 --%>
					<%-- fmt:parseDate - String 타입 날짜 형식 변경 --%>
					<fmt:formatDate value="${notice.notice_date }" pattern="yy-MM-dd HH:mm"/>
				</td>
			</tr>
		</c:forEach>
	</table>
	<section id="buttonArea">
		<form action="NoticeList.ad">
			<input type="text" name="keyword">
			<input type="submit" value="검색">
			&nbsp;&nbsp;
			<input type="button" value="글쓰기" onclick="location.href='Admin_notice_write.ad'" />
		</form>
	</section>
	<section id="pageList">
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='Notice_list.ad?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="NoticeList.ad?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" onclick="location.href='Notice_list.ad?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>