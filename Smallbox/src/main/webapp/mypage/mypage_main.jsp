<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% String sId = (String)session.getAttribute("sId");
   System.out.print(sId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	<!-- header -->
	
	<!-- 본문 -->
	
	<form action="">
	<h1>마이페이지</h1>
		<h3><a href="MovieLikeList.my?member_id=${sId }">찜목록</a></h3>
	</form>
		
	<!-- bottom -->
	<header>
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
	</header>
</body>
</html>