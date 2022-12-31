<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sId = (String)session.getAttribute("sId");
   MemberDAO dao = new MemberDAO();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<h1>마이 페이지</h1>
		<h3><a href="reserve_detail.jsp">예매 확인(X)</a></h3>
		<h3><a href="reserve_result.jsp">예매 확인(임시로 예매결과랑 연결해둘게요)</a></h3>
		<h3><a href="CouponList.bo?member_id=" + ${member.member_id }>쿠폰 관리</a></h3>
		<h3><a href="review_list.jsp">리뷰 관리</a></h3>
		<h3><a href="movie_like_list.jsp">찜 목록</a></h3>
		<h3><a href="pass_change_form.jsp">비밀번호 변경 폼</a></h3>
</body>
</html>