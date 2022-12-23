<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sId = (String)session.getAttribute("sId");
   MemberDAO dao = new MemberDAO();
   MemberDTO member = dao.selectMember(sId);
%>
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
		<h3><a href="reserve_detail.jsp">예매 확인(X)</a></h3>
		<h3><a href="reserve_result.jsp">예매 확인(임시로 예매결과랑 연결해둘게요)</a></h3>
		<h3><a href="point_list.jsp">포인트 관리</a></h3>
		<h3><a href="coupon_list.jsp?member_idx=<%=member.getMember_id() %>">쿠폰 관리</a></h3>
		<h3><a href="review_list.jsp">리뷰 관리</a></h3>
		<h3><a href="movie_like_list.jsp">찜 목록</a></h3>
		<h3><a href="pass_change_form.jsp">비밀번호 변경 폼</a></h3>
</body>
</html>