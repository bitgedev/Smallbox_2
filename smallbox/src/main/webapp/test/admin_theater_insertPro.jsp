<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.SimpleTimeZone"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Theater.TheaterDAO"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="Theater.TheaterDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 

request.setCharacterEncoding("UTF-8");

Date theater_date = Date.valueOf(request.getParameter("theater_date"));
Time theater_time = Time.valueOf(request.getParameter("theater_time"));
System.out.print(request.getParameter("theater_time"));

TheaterDTO theater = new TheaterDTO();
theater.setTheater_title(request.getParameter("theater_title"));
theater.setTheater_date(theater_date);
theater.setTheater_time(theater_time);
theater.setTheater_reserved(Integer.parseInt(request.getParameter("theater_reserved")));
theater.setTheater_seat(Integer.parseInt(request.getParameter("theater_seat")));


TheaterDAO dao = new TheaterDAO();
int insertCount = dao.insertTheater(theater);

if(insertCount>0) {
	response.sendRedirect("admin_coupon_result.jsp");
} else { %>
	<script type="text/javascript">
	alert("극장 등록 실패!");
	history.back();
	</script>
<%} %>

</body>
</html>