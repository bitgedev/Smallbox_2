<%@page import="vo.MemberBean"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
	<h1>마이 페이지</h1>
		<h3><a href="WishList.sm">찜 목록</a></h3>
		<h3><a href="MemberModifyForm.sm?member_id=${sessionScope.sId }">회원 정보</a></h3>
</body>
</html>