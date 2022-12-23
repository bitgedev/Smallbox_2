<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width">
    <!-- 웹 폰트 -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&amp;subset=korean" rel="stylesheet">
    
    <!-- css -->
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/swiper.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    
<script type="text/javascript">
	function confirm_logout() {
		let result = confirm("로그아웃 하시겠습니까?");
		
		if(result) {
			location.href="./MemberLogout.sm";
		}
	}
</script>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.sId}">	
	    <header id="header">
	        <div class="container">
	            <div class="row">
	                <div class="header clearfix">
	                    <h1>
	                        <a href="./">
	                            <em><img src="assets/img/logo.png" alt="SMALLBOX" ></em>
	                        </a>    
	                    </h1>
	                    <nav class="nav">
	                        <ul class="clearfix">
	                            <li><a href="#">영화</a></li>
	                            <li><a href="#">큐레이션</a></li>
	                            <li><a href="#">영화관</a></li>
	                            <li><a href="#">특별관</a></li>
	                            <li><a href="#">스토어</a></li>
	                            <li><a href="#">이벤트</a></li>
	                            <li><a href="MemberLoginForm.sm">로그인</a></li>
	                        </ul>
	                    </nav>    
	                </div>
	            </div>
	        </div>
	    </header>
	</c:when>
	<c:otherwise>
		 <header id="header">
		        <div class="container">
		            <div class="row">
		                <div class="header clearfix">
		                    <h1>
		                        <a href="./">
		                            <em><img src="assets/img/logo.png" alt="SMALLBOX" ></em>
		                        </a>    
		                    </h1>
		                    <nav class="nav">
		                        <ul class="clearfix">
		                            <li><a href="#">영화</a></li>
		                            <li><a href="#">큐레이션</a></li>
		                            <li><a href="#">영화관</a></li>
		                            <li><a href="#">특별관</a></li>
		                            <li><a href="#">스토어</a></li>
		                            <li><a href="#">이벤트</a></li>
		                            <li><a href="MyPageForm.bo">${sessionScope.sId } 님</a></li>
		                            <li><a href="MemberLogout.sm">로그아웃</a></li>
									<c:if test='${sessionScope.sId eq "admin"}'> 
										<li><a href="MemberList.bo">관리자페이지</a></li>
									</c:if>
		                        </ul>
		                    </nav>    
		                </div>
		            </div>
		        </div>
		    </header>
	</c:otherwise>
		
</c:choose>
    <!-- //header -->
    
    
    <!-- 자바스크립트 라이브러리 -->
    <script src="assets/js/jquery.min_1.12.4.js"></script>
    <script src="assets/js/modernizr-custom.js"></script>
    <script src="assets/js/ie-checker.js"></script>
</body>
</html>