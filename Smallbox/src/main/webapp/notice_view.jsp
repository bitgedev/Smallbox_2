<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지 상세 페이지</h1>
	
	<section id="articleForm">
		<h2>글 상세내용 보기</h2>
		<section id="basicInfoArea">
			<table border="1">
			<tr><th width="70">제 목</th><td colspan="3" >${notice.notice_subject }</td></tr>
			<tr>
				<th width="70">작성자</th><td>관리자</td>
				<th width="70">작성일</th>
				<td><fmt:formatDate value="${notice.notice_date }" pattern="yy-MM-dd HH:mm:SS" /></td>
			</tr>
			<tr>
				<th width="70">첨부파일</th>
				<td>
					<a href="upload/${notice.notice_real_file }" download="${notice.notice_file }">
						${notice.notice_file }
					</a>
				</td>
				<th width="70">조회수</th>
				<td>${notice.notice_readCount }</td>
			</tr>
			</table>
		</section>
		<section id="articleContentArea">
			${notice.notice_content }
		</section>
	</section>
	<section id="ButtonList">
		<input type="button" value="수정" onclick="location.href='NoticeModifyForm.ad?notice_idx=${param.notice_idx}&pageNum=${param.pageNum }'">
		<input type="button" value="삭제" onclick="location.href='NoticeDeleteForm.ad?notice_idx=${param.notice_idx}&pageNum=${param.pageNum }'">
		<input type="button" value="목록" onclick="location.href='Notice_list.ad?pageNum=${param.pageNum}'">
	</section>
</body>
</html>