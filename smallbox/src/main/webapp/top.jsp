<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function confirm_logout() {
		let result = confirm("로그아웃 하시겠습니까?");
		
		if(result) {
			location.href="./MemberLogoutAction.me";
		}
	}
</script>
<div id="member_area">
	<a href="main.jsp">Home</a>
		| <a href="login.jsp">login</a> 
		| <a href="join_form.jsp">Join</a>
		| <a href="my_page.jsp">MyPage</a>
		
		
				
</div>