<%@page import="java.sql.Date"%>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberDTO"%>
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

// String member_birth_date = request.getParameter("member_birth_date");
// Date date = Date.valueOf(member_birth_date);
Date date = Date.valueOf(request.getParameter("member_birth_date"));

MemberDTO member = new MemberDTO();
member.setMember_name(request.getParameter("member_name"));
member.setMember_id(request.getParameter("member_id"));
member.setMember_passwd(request.getParameter("member_passwd"));
member.setMember_email(request.getParameter("member_email1")+"@"+request.getParameter("member_email2"));
member.setMember_phone(request.getParameter("member_phone"));
member.setMember_birth_date(date);

MemberDAO dao = new MemberDAO();
int insertCount = dao.insertMember(member);

if(insertCount>0) {
	response.sendRedirect("main.jsp");
} else { %>
	<script type="text/javascript">
	alert("회원 가입 실패!");
	history.back();
	</script>
<%} %>

</body>
</html>