<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰함</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<h1>쿠폰함</h1>
	
	<table border="1">
		<tr>
			<th>쿠폰 유형</th>
			<th>할인율</th>
			<th>쿠폰 지급일</th>
			<th>쿠폰 만료일</th>
		</tr>
		
		<!-- CouponListProAction으로 부터 전달받은 request 객체의 couponList를 꺼내서 출력 -->
		<c:forEach var="coupon" items="${couponList }">
		<tr>
			<td>${coupon.coupon_type }</td>
			<td>${coupon.coupon_rate }</td>
			<td>${coupon.coupon_date }</td>
			<td>${coupon.coupon_end_date }</td>
		</tr>	
		</c:forEach>
			
	</table>
	
	<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
	<c:choose>
		<c:when test="${empty param.pageNum }">
			<c:set var="pageNum" value="1" />
		</c:when>
		<c:otherwise>
			<c:set var="pageNum" value="${param.pageNum }" />
		</c:otherwise>
	</c:choose>
	
	<section id="pageList"> <!-- 페이징 처리 영역 -->
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='CouponList.my?pageNum=${pageNum - 1}'">
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
					<a href="CouponList.my?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" onclick="location.href='CouponList.my?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</section>
</body>
</html>