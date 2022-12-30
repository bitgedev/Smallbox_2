<%@page import="java.util.List"%>
<%@page import="vo.ReserveBean"%>
<%@page import="dao.ReserveDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- EL 에서 표기 방식(날짜 등)을 변경하려면 fmt(format) 라이브러리 필요  --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 예매 내역(목록)</title>
</head>
<body>
	<header>
		<!--  Login, Join -->
		<jsp:include page="/inc/top.jsp"></jsp:include>
	</header>
	<h1>마이페이지 예매 내역(목록)</h1>
	<table border="1">
		<tr>
			<th width="100">예약 번호</th>
<!-- 			<th width="150">예매자 아이디</th> -->
			<th width="150">영화 제목</th>
			<th width="150">영화관 이름<br>theater_title</th>
			<th width="100">상영관 번호<br>theater_idx</th>
			<th width="100">예약일<br>res_date</th>
			<th width="100">영화 상영일<br>theater_date</th>
			<th width="150">영화 상영시간인지,,상영시각인지,,모르겠음.<br>res_time</th>
			<th width="150">예매된 좌석</th>
<!-- 			<th width="150">관람인원</th>예약이 어떻게 될지 봐야 알것같아요.
근데 좌석 A12, C12 이런식으로 복수개 보여줘도 충분하지 않을까..고민 -->
			<th width="150">예매 취소하기</th>
			<th width="150">리뷰 작성하기</th>
		</tr>
		<c:forEach var="reserve" items="${reserveList }">
			<tr>
				<td>${reserve.res_num }</td>
<%-- 				<td>${reserve.member_id }</td> --%>
				<td>${reserve.movie_title }</td>
				<td><br>디비 작업 필요</td>
				<td>${reserve.theater_idx }<br>값이 자꾸만 0으로 나온다...</td>
				<td>
<!-- 					JSTL 의 fmt 라이브러리를 활용하여 날짜 표현 형식 변경 -->
<!-- 					fmt:formatDate - Date 타입 날짜 형식 변경 -->
<!-- 					fmt:parseDate - String 타입 날짜 형식 변경 -->
					<fmt:formatDate value="${reserve.res_date }" pattern="yy-MM-dd"/>
				</td>
				<td>${theater.theater_date }<br>디비작업필요</td>
				<td>${reserve.res_time }</td>
				<td>${reserve.res_seat }</td>
				<td>
					<input type="button" value="취소" onclick="location.href='ReserveCancel.me?member_id=${sessionScope.sId}&res_num=${reserve.res_num }'"><br>
				</td>
				<td>
					<input type="button" value="작성" onclick="location.href='ReserveCancel.me?member_id=${sessionScope.sId}&res_num=${reserve.res_num }'"><br>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>