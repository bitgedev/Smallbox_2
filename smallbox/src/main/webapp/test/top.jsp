<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="login">
<% String sId = (String)session.getAttribute("sId"); %>

<script type="text/javascript">
	function confirm_logout() {
		let result = confirm("로그아웃 하시겠습니까?");
		
		if(result) {
			location.href="logout.jsp";
		}
	}
</script>
		
  <% if(sId == null) { // 세션 아이디가 null -> 로그인 X%> 
  <a href="./">Home</a> | <a href="login.jsp">login</a> | <a href="join_form.jsp">join</a>
  <% } else { // 세션 아이디가 null이 아님 -> 로그인O %>
  <a href="main.jsp">Home</a> | <a href="javascript:confirm_logout()">logout</a> | <a href="my_page.jsp">MyPage</a>
  <!-- 세션 아이디가 "admin" 일 경우 "관리자페이지(admin/admin_main.jsp)" 링크 표시 -->
  	<% if(sId.equals("admin")) { %>
  		| <a href="admin.jsp">관리자페이지</a>
  	<% } %>
  <% } %>		
				
</div>