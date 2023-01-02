<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
<link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
	 <main id="main">
	
	<!-- 본문 -->
   
     <section class="inner-page" style="display: inline-block;">
      <div class="container" style="margin-left: 30px;">
        <p>
             <section class="py-5">
               <div class="wrap">
        <div class="row row-cols-1 row-cols-md-4 g-4">
        <!-- MovieLikeListProAction으로 부터 전달받은 request 객체의 likeList(영화 정보)를 꺼내서 출력 -->
		<c:forEach var="movie" items="${movieList }">
        <div class="col">
            <div class="card">
                <img src="<%=request.getContextPath() %>/upload/${movie.movie_real_picture}"  width="300" height="350"
                     class="card-img-top" alt="..." >
                <div class="card-body">
                    <h5 class="card-title" style="text-align: center;">${movie.movie_title }</h5>
                    <P class="card-star" style="text-align: center;">⭐⭐⭐</P> <!-- 평점 통계낸거~~ 자바스크립트 별적용~~ -->
                   
                    
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
    
	<section id="pageList" style="text-align: center;"> <!-- 페이징 처리 영역 -->
		
	   	<!-- 만약, pageNum 파라미터가 비어있을 경우 pageNum 변수 선언 및 기본값 1로 설정 -->
		<c:choose>
			<c:when test="${empty param.pageNum }">
				<c:set var="pageNum" value="1" />
			</c:when>
			<c:otherwise>
				<c:set var="pageNum" value="${param.pageNum }" />
			</c:otherwise>
		</c:choose>
		
		<!-- 
		현재 페이지 번호(pageNum)가 1보다 클 경우에만 [이전] 링크 동작
		=> 클릭 시 BoardList.bo 서블릿 주소 요청하면서 
		   현재 페이지 번호(pageNum) - 1 값을 page 파라미터로 전달
		-->
		<c:choose>
			<c:when test="${pageNum > 1}">
				<input type="button" value="이전" onclick="location.href='MovieLikeList.my?pageNum=${pageNum - 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="이전">
			</c:otherwise>
		</c:choose>
			
		<!-- 페이지 번호 목록은 시작 페이지(startPage)부터 끝 페이지(endPage) 까지 표시 -->
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<!-- 단, 현재 페이지 번호는 링크 없이 표시 -->
			<c:choose>
				<c:when test="${pageNum eq i}">
					${i }
				</c:when>
				<c:otherwise>
					<a href="MovieLikeList.my?pageNum=${i }">${i }</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- 현재 페이지 번호(pageNum)가 총 페이지 수보다 작을 때만 [다음] 링크 동작 -->
		<c:choose>
			<c:when test="${pageNum < pageInfo.maxPage}">
				<input type="button" value="다음" onclick="location.href='MovieLikeList.my?pageNum=${pageNum + 1}'">
			</c:when>
			<c:otherwise>
				<input type="button" value="다음">
			</c:otherwise>
		</c:choose>
	</section>

		
		<section id="buttonArea"> <!-- 버튼 영역 -->
			<form action="AdminMovieList.ad" method="get"> <!-- 검색 버튼 -->
				<input type="text" name="keyword" class="input_box">
				<input type="submit" value="Search" class="btn">
			</form>
			<!-- 영화 등록 버튼 -->
			<input type="button" value="영화 등록" class="btn" onclick="location.href='MovieInsertForm.ad'">
			</form>
		</section>
 	 </main><!-- End #main -->
</body>
</html>