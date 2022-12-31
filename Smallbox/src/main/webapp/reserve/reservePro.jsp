<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>reserve result</h2>
	<%
		String star = request.getParameter("star");
	
		out.println("좌석 번호 : " + star+"<br>");
		
		String h = star.substring(0, 1);
		String w = star.substring(1);
		
		out.println("line : " + h + " , no : " + w);
		
		
	%>



</body>
</html>