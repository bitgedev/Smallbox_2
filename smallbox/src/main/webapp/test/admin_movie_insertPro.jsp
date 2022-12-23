<%@page import="dao.MovieDAO"%>
<%@page import="vo.MovieBean"%>
<%@page import="java.sql.Date"%>
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

Date movie_open_date = Date.valueOf(request.getParameter("movie_open_date"));

MovieBean movie = new MovieBean();
movie.setMovie_title(request.getParameter("movie_title"));
movie.setMovie_grade(request.getParameter("movie_grade"));
movie.setMovie_genre(request.getParameter("movie_genre"));
movie.setMovie_open_date(movie_open_date);
movie.setMovie_runtime(Integer.parseInt(request.getParameter("movie_runtime")));
movie.setMovie_intro(request.getParameter("movie_intro")); // text 어케 받아올지
movie.setMovie_actors(request.getParameter("movie_actors"));
movie.setMovie_picture(request.getParameter("movie_picture")); 
// 사진을 어케 받아올까? 실제 경로를 알아내려면 일단 파일 업로드를 이용 해야함 
movie.setMovie_viewer(Integer.parseInt(request.getParameter("movie_viewer")));

MovieDAO dao = new MovieDAO();
int insertCount = dao.insertMovie(movie);

if(insertCount>0) {
	response.sendRedirect("admin_movie_result.jsp");
} else { %>
	<script type="text/javascript">
	alert("영화 등록 실패!");
	history.back();
	</script>
<%} %>


</body>
</html>