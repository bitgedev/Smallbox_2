<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Inner Page - Green Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

<style type="text/css">

	#py-5 {
	float: right;
	margin-left: 0.8em;
   }
   
    #aside {
    float: left
    margin-left: 5em;
    }

</style>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">SMALL BOX</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="nav-link scrollto " href="#hero">??????</a></li>
          <li><a class="nav-link scrollto" href="#about">????????????</a></li>
          <li><a class="nav-link scrollto" href="#services">?????????</a></li>
          <li><a class="nav-link scrollto " href="#portfolio">?????????</a></li>
          <li><a class="nav-link scrollto" href="#team">?????????</a></li>
          <li><a class="nav-link scrollto" href="#team">?????????</a></li>
          <li><a class="nav-link scrollto" href="#team">????????????</a></li>
          <li class="dropdown"><a href="#"><span>???????????????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">????????????</a></li>
              </li>
              <li><a href="#">?????????</a></li>
              <li><a href="#">?????????</a></li>
              <li><a href="#">?????????</a></li>
              <li class="dropdown"><a href="#"><span>????????????</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">?????????</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
          <li><a class="getstarted scrollto" href="#about">????????????</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Collection</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li><a href="index.html">MyPage</a></li>
            <li>Collection</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
  
    <div id="sd-in" style="width:1560px;margin: 0 auto;">
    <aside class="side" style="display: inline-block;width:200px;vertical-align: top !important; margin-top: 8em;">
   		<ul class="side-list"> 
   			<li class="side-li" style="font-size:20px;">
   				<p><a href="#">????????????</a></p>
   				<p><a href="#">?????????</a></p>
   				<p><a href="#">?????????</a></p>
   				<p><a href="#">????????????</a></p>
   			</li>
   		</ul>
   </aside>
    <section class="inner-page" style="display: inline-block;">
    
      <div class="container">
        <p>
             <section class="py-5">
               <div class="wrap">
        <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- MovieLikeListProAction?????? ?????? ???????????? request ????????? likeList(?????? ??????)??? ????????? ?????? -->
		<c:forEach var="movie" items="${likeList }">
        <div class="col">
            <div class="card">
                <img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}"
                     class="card-img-top" alt="..." >
                <div class="card-body">
                    <h5 class="card-title">${movie.movie_title }</h5>
                    <P>?????????</P>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    </div>
    </section>
    </div>
    </p>
    </div>
    </section>
    
    <section id="pageList" style="margin-left: 67em;"> <!-- ????????? ?????? ?????? -->
		<!-- 
		?????? ????????? ??????(pageNum)??? 1?????? ??? ???????????? [??????] ?????? ??????
		=> ?????? ??? BoardList.bo ????????? ?????? ??????????????? 
		   ?????? ????????? ??????(pageNum) - 1 ?????? page ??????????????? ??????
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="??????" onclick="location.href='BoardList.bo?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="??????">
			</c:otherwise>
		</c:choose>
			
		<!-- ????????? ?????? ????????? ?????? ?????????(startPage)?????? ??? ?????????(endPage) ?????? ?????? -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- ???, ?????? ????????? ????????? ?????? ?????? ?????? -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="BoardList.bo?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- ?????? ????????? ??????(pageNum)??? ??? ????????? ????????? ?????? ?????? [??????] ?????? ?????? -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="??????" onclick="location.href='BoardList.bo?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="??????">
			</c:otherwise>
		</c:choose>
	</section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
	<!-- ?????? ??????????????? -->
		<jsp:include page="../inc/bottom.jsp" />
		<!-- ?????? ??????????????? -->


  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>