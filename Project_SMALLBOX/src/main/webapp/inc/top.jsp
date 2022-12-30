<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function confirm_logout() {
		let result = confirm("로그아웃 하시겠습니까?");
		
		if(result) {
			location.href="./MemberLogout.sm";
		}
	}
</script>
<style type="text/css">
#dropdown-menu {
	width: 1300px;
}
</style>
</head>
<body>
<c:choose>
	<c:when test="${empty sessionScope.sId}">
	  <header id="header" class="d-flex align-items-center">
	    <div class="container d-flex align-items-center">
	    	<nav id="navbar" class="navbar">
	    	<li class="dropdown">
              	<a  href="#"><img src="assets/img/menubar.png" ></a> 
              		<ul>
	          		<li class=""><h4>전체 메뉴</h4></li>
          			<li class="dropdown"><a href="#"><span>영화</span> <i class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
					</li>
	          		<li class="dropdown"><a href="#">예매<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">극장<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">이벤트<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">혜택<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">스토어<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
                    <li class="dropdown"><a href="#">나의 스몰박스<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
                    <li class="dropdown"><a href="#">고객센터<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
                    <li class="dropdown"><a href="#">조원소개<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
                    <li class="dropdown"><a href="#">이용정책<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
	          	</ul>
              </li>
	    	 </nav><!-- .navbar -->
	    	  <!-- 로고 -->
		      <h1 class="logo me-auto">
			      <a href="./">
			        <img src="assets/img/logo.png">
			      </a>
		      </h1>
		        <!-- 로고 끝 -->
		      
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	
	      <nav id="navbar" class="navbar">
	        <ul>
	          <li class="dropdown"><a class="nav-link scrollto active" href="MovieList.mv">영화<i class="bi bi-chevron-down"></i></a>
	          	<ul>
	          		<li><a href="#">전체 영화</a></li>
                    <li><a href="#">큐레이션</a></li>
                    <li><a href="#">무비포스트</a></li>
	          	</ul>
	          </li>
	          <li><a class="nav-link scrollto" href="#services">극장</a></li>
	          <li><a class="nav-link scrollto" href="#contact">오시는길</a></li>
	          <li><a class="nav-link scrollto" href="#team">스토어</a></li>
              <li><a class="nav-link scrollto" href="MemberLoginForm.sm">로그인</a></li>
	          <li><a class="getstarted scrollto" href="#about">빠른예매</a></li>
	        </ul>
	        <i class="bi bi-list mobile-nav-toggle"></i>
	      </nav><!-- .navbar -->
	
	    </div>
	  </header><!-- End Header -->
	</c:when>
	<c:otherwise>
		<header id="header" class="d-flex align-items-center">
	    <div class="container d-flex align-items-center">
			<nav id="navbar" class="navbar">
	    	<li class="dropdown">
              	<a  href="#"><img src="assets/img/menubar.png" ></a> 
              		<ul>
	          		<li class=""><h4>전체 메뉴</h4></li>
          			<li class="dropdown"><a href="#"><span>영화</span> <i class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
					</li>
	          		<li class="dropdown"><a href="#">예매<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">극장<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">이벤트<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">혜택<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
	          		<li class="dropdown"><a href="#">스토어<i class="bi bi-chevron-right"></i></a>
	          			<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
	          		</li>
                    <li class="dropdown"><a href="#">나의 스몰박스<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
                    <li class="dropdown"><a href="#">고객센터<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
                    <li class="dropdown"><a href="#">조원소개<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
                    <li class="dropdown"><a href="#">이용정책<i class="bi bi-chevron-right"></i></a>
                    	<ul>
							<li><a href="#">박스오피스</a></li>
							<li><a href="#">현재 상영작</a></li>
							<li><a href="#">개봉 예정작</a></li>
							<li><a href="#">큐레이션</a></li>
							<li><a href="#">무비포스트</a></li>
						</ul>
                    </li>
	          	</ul>
              </li>
	    	 </nav><!-- .navbar -->
	    	  <!-- 로고 -->
	    	  <h1 class="logo me-auto">
		    	 <a href="./">
		     		<img src="assets/img/logo.png">
		     	 </a>
		       <!-- 로고 -->
	      </h1>
	      <nav id="navbar" class="navbar">
	      <ul>
	          <li class="dropdown"><a href="MovieList.mv"><span>영화</span><i class="bi bi-chevron-down"></i></a>
	          	 <ul>
	          		<li><a href="#">전체 영화</a></li>
                    <li><a href="#">큐레이션</a></li>
                    <li><a href="#">무비포스트</a></li>
	             </ul>
	          </li>
	        <li><a class="nav-link scrollto" href="#services">극장</a></li>
	        <li><a class="nav-link scrollto" href="#contact">오시는 길</a></li>
	        <li><a class="nav-link scrollto" href="#team">스토어</a></li>
			<li class="dropdown"><a href="MyPageForm.bo">${sessionScope.sId } 님<i class="bi bi-chevron-down"></i></a>
		   	 <ul>
					<li class="dropdown"><a href="#"><span>필요하면</span> <i class="bi bi-chevron-right"></i></a>
						<ul>
							<li><a href="#">씁시다</a></li>
							<li><a href="#">Deep Drop Down 2</a></li>
							<li><a href="#">Deep Drop Down 3</a></li>
							<li><a href="#">Deep Drop Down 4</a></li>
							<li><a href="#">Deep Drop Down 5</a></li>
						</ul>
					</li>
					<c:if test='${sessionScope.sId eq "admin"}'> 
						<li  class="dropdown"><a class="nav-link scrollto" href="AdminMain.ad">관리자페이지<i class="bi bi-chevron-right"></i></a>
							<ul>
								<li><a href="#">회원관리</a></li>
								<li><a href="#">영화 등록</a></li>
								<li><a href="#">극장 등록</a></li>
								<li><a href="#">공지 등록</a></li>
							</ul>
						</li>
					</c:if>		
					<li><a href="#">컬렉션</a></li>
					<li><a href="#">쿠폰함</a></li>
					<li><a href="#">코멘트</a></li>
				</ul>
			</li>
	          <li><a class="nav-link scrollto" href="MemberLogout.sm">로그아웃</a></li>
	          <li><a class="getstarted scrollto" href="#about">빠른예매</a></li>
	        </ul>
<!-- 	        <i class="bi bi-list mobile-nav-toggle"></i> -->
	      </nav><!-- .navbar -->
	
	    </div>
	  </header><!-- End Header -->
	</c:otherwise>
</c:choose>

<!-- ======= Header ======= -->
</body>
</html>