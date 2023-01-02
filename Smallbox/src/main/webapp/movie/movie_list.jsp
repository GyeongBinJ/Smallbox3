<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>SMALLBOX</title>
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
  
<link href="assets/css/style.css" rel="stylesheet">
 
 <!-- ajax -->
<script src="js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	// 영화목록 페이지 접속시 찜여부 확인
	$(document).ready(function(){
	      $.ajax({
	      type: 'POST',
	      url: 'CheckMovieLikePro.mv', 
	      data: { 
	    	  "member_id" : ${sessionScope.sId},
	    	  "movie_idx" : ${movie.movie_idx} 
	      },
	      success: function(data) {
	    	  console.log(${sessionScope.isLike }))
	        if(${sessionScope.isLike }) {
	        $("#btn_like").
	        } 
	      }
	      });
	    });    
	  });

</script>
<!-- ajax -->

</head>
<body>
	<header>
		<jsp:include page="../inc/top.jsp"></jsp:include>
	</header>
	  <!-- ======= header ======= -->
	
	<main id="main">
	
	<!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>전체 영화</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>전체 영화</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
	
	 <!-- ======= 찐 본문영역 ======= -->
	<section class="inner-page" style="display: inline;">
    	 
		<h2 style="text-align: center; margin-top: 10px;">현재 상영작</h2>
<!-- 		임시로 디비에 저장된 모든 영화를 현재 상영작으로 취급합니다.  -->
<!-- 		<input type="text" name="keyword" class="input_box"> -->
<!-- 		<input type="submit" value="Search" class="btn"> -->
      <div class="container">
        <p>
       	  <section class="py-5">
        	<div class="wrap">
       		<div class="row row-cols-1 row-cols-md-4 g-4">
        	<!-- MovieLikeListProAction으로 부터 전달받은 request 객체의 likeList(영화 정보)를 꺼내서 출력 -->
			<c:forEach var="movie" items="${movieList }">
        		<div class="col">
            	<div class="card" style="object-fit:cover">
               		 <img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}"  width="300" height="350"
                     class="card-img-top" alt="..." > <!-- 포스터 클릭하면 상세페이지로 이동 -->
                <div class="card-body">
                <h5 class="card-title" style="text-align: center;">${movie.movie_title }</h5>
                <h5 class="card-date" style="text-align: center;">개봉일 ${movie.movie_open_date }</h5>
                <h5 class="card-date" style="text-align: center;">${sessionScope.isLike }</h5>
                <P class="card-star" style="text-align: center;">⭐⭐⭐</P> <!-- 평균낸 별점과 자바스크립트 들어가면 될듯 -->
                <div class="text-center"> 
                <a class="btn btn-outline-dark mt-auto" href="MovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}">찜</a>   			
<!--                    <a class="btn btn-outline-dark mt-auto" id="btn_like">찜</a> -->
<%--                     <c:choose> --%>
<%--                     	<c:when test="${sessionScope.isLike eq true }"> --%>
<%--                     		<a class="btn btn-outline-dark mt-auto" href="CancelMovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}">찜해제</a> --%>
<%--                     	</c:when> --%>
<%--                     	<c:when test="${sessionScope.isLike eq false }"> --%>
<%--                    			<a class="btn btn-outline-dark mt-auto" href="MovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}">찜</a> --%>
<%--                     	</c:when> --%>
<%--                     </c:choose> --%>
                   
                   <!-- 에이젝스로 바꿀거~~ -->
<%--                     <c:choose> --%>
<%--                     	<c:when test="${sessionScope.isLike eq true }"> --%>
<%--                     		<a class="btn btn-outline-dark mt-auto" href="CancelMovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}">찜해제</a> --%>
<%--                     	</c:when> --%>
<%--                     	<c:otherwise> --%>
<%--                    			<a class="btn btn-outline-dark mt-auto" href="MovieLikePro.mv?member_id=${sessionScope.sId }&movie_idx=${movie.movie_idx}">찜</a> --%>
<%--                     	</c:otherwise> --%>
<%--                     </c:choose> --%>
                    <!-- 에이젝스로 바꿀거 -->
                    
                <a class="btn btn-outline-dark mt-auto" href="#" id="reserve">예매하기</a></div>
                   
                </div>
           		</div>
       	        </div>
       		</c:forEach>
   			</div>
    		</div>
    	</section>
       </p>
    </div>
   </section>
		
		</main>
		  <!-- ======= 본문영역 ======= -->
		
		  <!-- ======= Footer ======= -->
		<jsp:include page="../inc/bottom.jsp" />
</body>
</html>