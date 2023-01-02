<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SMALL BOX - 관리자</title>
        <link href="./resources/css/style.css" rel="stylesheet" />
        <link href="./resources/css/styles.css" rel="stylesheet" />
        <script src="./resources/js/all.js" crossorigin="anonymous"></script>
    </head>
    <!-- 공통 템플릿 구간 시작 -->
  	<header>
		<jsp:include page="../inc/admin_top.jsp"></jsp:include>
	</header>
        <!-- 공통 템플릿 구간 끝 -->
        
        <!-- 왼쪽 카테고리 구간 시작 -->
    <aside>
		<jsp:include page="../inc/admin_left.jsp"></jsp:include>
	</aside>
        <!-- 왼쪽 카테고리 구간 끝 -->
            
     <!-- 본문 영역 시작 -->
     <div id="layoutSidenav_content" style="display: inline;">
     <main>
             <div class="container-fluid px-4">
                 <h1 class="mt-4">관리자 메인페이지</h1>
                 <ol class="breadcrumb mb-4">
                     <li class="breadcrumb-item active">Admin - Main</li>
                 </ol>
                 <div class="row">
                     <div class="col-xl-3 col-md-6">
                         <div class="card bg-primary text-white mb-4">
                             <div class="card-body">영화관리</div>
                             <div class="card-footer d-flex align-items-center justify-content-between">
                                 <a class="small text-white stretched-link" href="#">View Details</a>
                                 <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                             </div>
                         </div>
                     </div>
                     <div class="col-xl-3 col-md-6">
                         <div class="card bg-warning text-white mb-4">
                             <div class="card-body">극장관리</div>
                             <div class="card-footer d-flex align-items-center justify-content-between">
                                 <a class="small text-white stretched-link" href="AdminTheaterList.ad">View Details</a>
                                 <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                             </div>
                         </div>
                     </div>
                     <div class="col-xl-3 col-md-6">
                         <div class="card bg-success text-white mb-4">
                             <div class="card-body">회원관리</div>
                             <div class="card-footer d-flex align-items-center justify-content-between">
                                 <a class="small text-white stretched-link" href="#">View Details</a>
                                 <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                             </div>
                         </div>
                     </div>
                     <div class="col-xl-3 col-md-6">
                         <div class="card bg-danger text-white mb-4">
                             <div class="card-body">공지사항</div>
                             <div class="card-footer d-flex align-items-center justify-content-between">
                                 <a class="small text-white stretched-link" href="#">View Details</a>
                                 <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="row">
                     <div class="col-xl-6">
                         <div class="card mb-4">
                             <div class="card-header">
                                 <i class="fas fa-chart-area me-1"></i>
                                 일별매출
                             </div>
                             <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                        			일별 매출 들어갈 자리
                         </div>
                     </div>
                     <div class="col-xl-6">
                         <div class="card mb-4">
                             <div class="card-header">
                                 <i class="fas fa-chart-bar me-1"></i>
                             	월별매출
                             </div>
                             <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                         		월별 매출 들어갈 자리
                         </div>
                     </div>
                 </div>
                 <div class="card mb-4">
                     <div class="card-header">
                         <i class="fas fa-table me-1"></i>
                         DataTable Example
                     </div>
                     <div class="card-body">
                         <table id="datatablesSimple">
                             <thead>
                                 <tr>
                                     <th>Name</th>
                                     <th>Position</th>
                                     <th>Office</th>
                                     <th>Age</th>
                                     <th>Start date</th>
                                     <th>Salary</th>
                                 </tr>
                             </thead>
                             <tfoot>
                                 <tr>
                                     <th>Name</th>
                                     <th>Position</th>
                                     <th>Office</th>
                                     <th>Age</th>
                                     <th>Start date</th>
                                     <th>Salary</th>
                                 </tr>
                             </tfoot>
                             <tbody>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div>
         </main>
         </div>
     <!-- 본문 영역 끝 -->
                
     <!-- footer 영역 -->
     <footer>
		<jsp:include page="../inc/admin_footer.jsp"></jsp:include>
	</footer>
                
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
