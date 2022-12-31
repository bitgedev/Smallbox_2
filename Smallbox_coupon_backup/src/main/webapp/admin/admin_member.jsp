<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
<h1>회원 관리</h1> <!-- 회원목록 조회 -->
<form action="CouponInsert.ad" name="fr" method="post">  
	<input type="hidden" name="member_id" value="${param.member_id }">
	<table border="1">
		<tr>
			<th width="100">회원 번호</th>
			<th width="150">아이디</th>
			<th width="150">이름</th>
			<th width="200">E-Mail</th>
			<th width="200">연락처</th>
			<th width="150">가입날짜</th>
			<th width="150">생년월일</th>
			<th width="150"></th>
		</tr>
		<%-- List<MemberBean> 객체 (memberList) 만큼 반복하면서 데이터 출력 --%>
			<c:forEach var="member" items="${memberList }">
			<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
				<c:choose>
					<c:when test="${empty param.pageNum }">
						<c:set var="pageNum" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="pageNum" value="${param.pageNum }" />
					</c:otherwise>
				</c:choose>
				<tr>
					<td>${member.member_idx }</td>
					<td>${member.member_id }</td>
					<td>${member.member_name }</td>
					<td>${member.member_email }</td>
					<td>${member.member_phone }</td>
					<td>${member.member_join_date }</td>
					<td>${member.member_birth_date }</td>
					<td>
				<!-- 멤버 아이디와 일치하는 회원에게 쿠폰 지급 및 목록 수행 -->
						<input type="button" value="쿠폰 지급" onclick="location.href='CouponInsert.ad?member_id=${member.member_id }'"> 
						<input type="button" value="쿠폰 목록" onclick="location.href='CouponList.ad?member_id=${member.member_id }'">
					</td>
				</tr>
		</c:forEach>
	</table>
</form>
		<form action="MemberList.ad">
		<input type="text" name="keyword">
		<input type="submit" value="검색">
		</form>
<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 MemberList.ad 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='MemberList.ad?pageNum=${pageNum - 1}'">
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
					<a href="MemberList.ad?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" onclick="location.href='MemberList.ad?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
</body>
</html>