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

String member_id = request.getParameter("member_id");

MemberDTO member = new MemberDTO();
member.setMember_id(member_id);
member.setMember_passwd(request.getParameter("member_passwd"));

MemberDAO dao = new MemberDAO();
boolean isLoginSuccess = dao.login(member);

if(isLoginSuccess) {
	// 세션 객체에 아이디 저장 / 회원번호는 어케저장하지..
	session.setAttribute("sId", member_id);
	response.sendRedirect("main.jsp");
} else { %>
 	<script type="text/javascript">
	alert("로그인 실패!");
	history.back();
	</script>
<% } %>

</body>
</html>