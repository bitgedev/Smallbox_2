<%@page import="java.util.List"%>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
	<header>
		<jsp:include page="top.jsp"></jsp:include>
	</header>
<h1>회원 관리</h1>
	<table border="1">
		<tr>
			<th width="100">회원 번호</th>
			<th width="150">아이디</th>
			<th width="150">이름</th>
			<th width="200">E-Mail</th>
			<th width="200">연락처</th>
			<th width="150">가입날짜</th>
			<th width="150">생년월일</th>
			<th width="100">보유 적립금</th>
		</tr>
		
		<% 
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> memberlist = dao.selectMemberList();
		
		for(MemberDTO member : memberlist) {
		%>
		<tr>
			<td><%=member.getMember_idx() %></td>
			<td><%=member.getMember_id() %></td>
			<td><%=member.getMember_name() %></td>
			<td><%=member.getMember_email() %></td>
			<td><%=member.getMember_phone() %></td>
			<td><%=member.getMember_join_date() %></td>
			<td><%=member.getMember_birth_date() %></td>
			<td>
				<input type="button" value="쿠폰 지급" onclick="location.href='admin_coupon_insert.jsp?member_id=<%=member.getMember_id() %>'">
				<input type="button" value="포인트 지급" onclick="location.href='admin_point_insert.jsp?member_id=<%=member.getMember_id() %>'">
				<input type="button" value="수정" onclick="">
				<input type="button" value="삭제" onclick="">
			</td>
		<%} %>
		</tr>
	</table>
	<h1>성공하셨나요?  ค^•ﻌ•^ค  </h1>
</body>
</html>