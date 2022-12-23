<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script type="text/javascript">
	function confirm_logout() {
		let result = confirm("로그아웃 하시겠습니까?");
		
		if(result) {
			location.href="./MemberLogout.sm";
		}
	}
</script>
	<c:choose>
		<c:when test="${empty sessionScope.sId}">
			<div id="member_area">
				<a href="./">Home</a>
					| <a href="MemberLoginForm.sm">login</a> 
					| <a href="MemberJoinForm.sm">Join</a>
<!-- 					| <a href="MyPageForm.sm">MyPage</a> -->
			</div>
		</c:when>
		<c:otherwise>
			<div id="member_area">
				<a href="./">Home</a>
					| <a href="MemberLoginForm.sm">${sessionScope.sId } 님</a> 
					| <a href="MemberLogout.sm">Logout</a>
					| <a href="MyPageForm.bo">MyPage</a>
			<c:if test='${sessionScope.sId eq "admin"}'> 
					 | <a href="MemberList.bo">관리자페이지</a>
			</c:if>
				</div>
			
		</c:otherwise>
		
	</c:choose>
		
		
				
</div>