<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body>
<h1>회원 관리</h1>
	<table border="1">
		<tr>
			<th width="150">회원 번호</th>
			<th width="150">아이디</th>
			<th width="100">패스워드</th>
			<th width="150">이름</th>
			<th width="150">E-Mail</th>
			<th width="100">연락처</th>
			<th width="100">가입날짜</th>
			<th width="100">생년월일</th>
			<th width="100">보유 적립금</th>
		</tr>
		<tr>
			<%-- List<MemberBean> 객체 (memberList) 만큼 반복하면서 데이터 출력 --%>
			<c:forEach var="member" items="${memberList }">
				<tr>
					<td>${member.member_idx }</td>
					<td>${member.member_id }</td>
					<td>${member.member_passwd }</td>
					<td>${member.member_name }</td>
					<td>${member.member_email }</td>
					<td>${member.member_phone }</td>
					<td>${member.member_join_date }</td>
					<td>${member.member_birth_date }</td>
					<td>${member.member_point }</td>
				</tr>
			</c:forEach>
			<td>
				<input type="button" value="수정" onclick="">
				<input type="button" value="삭제" onclick="">
			</td>
		</tr>
	</table>
</body>
</html>