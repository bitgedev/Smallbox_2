<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	<h1>마이페이지</h1>
		<h3><a href="MovieLikeList.mv?member_id=${sId }">찜목록</a></h3>
</body>
</html>