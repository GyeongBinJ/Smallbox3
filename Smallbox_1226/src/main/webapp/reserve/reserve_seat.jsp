<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 날짜 선택</title>
<style>
.reserve-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
    height: 800px;
    /* border: 1px solid #dddddd; */
}

.reserve-container>div {
    border: 1px solid #dddddd;
}

.reserve-title {
    border-bottom: 1px solid #dddddd;
    background-color: #444444;
    text-align: center;
    color: #dddddd;
    padding: 5px;
    font-size: 13px;
    font-weight: bold;
}

.select_seat_age {
	font-size: 12px;

}
.select_person:hover,
.select_person.active {
	background: pink;
  	color: white;
}
.select_person:visited {
	background: pink;
  	color: white;
}
.select_person {
	border: 0;
	width: 30px;
	height: 30px;
}


.seat-container {
    margin-top: 20px;
    display: flex;
    justify-content: center;
}

.screen-view {
    width: 140px;
    color: #777777;
    padding-top: 30px;
    font-size: 30px;
    text-align: center;
    margin: 0 auto 30px auto;
    border-bottom: 1px solid #666666;
    letter-spacing: 4px;
}

.seat-wrapper {
    background-color: lightgray;
    width: 700px;
    height: 460px;
    /* padding-top: 120px; */
}

.selected-part {
	width: 300px;

}
.select_seat {
	float: left;
    margin-right: 20px;
}
.payButton {
	width: 100px;
	height: 50px;
	font-size: 15px;
	font-weight: bold;
}
</style>
<script src="../js/jquery-3.6.3.js"></script>
<script type="text/javascript">
	 function change_btn(e) {
		  var btns = document.querySelectorAll(".select_person");
		  btns.forEach(function (btn, i) {
		    if (e.currentTarget == btn) {
		      btn.classList.add("active");
		      alert($(".select_person.active").val());
				$("input[name=selected_person]").val($(".select_person.active").val());
		    } else {
		      btn.classList.remove("active");
		    }
		  });
	}
	
</script>
</head>
<body>
<!-- 빈 좌석 파일 image폴더에 seat0 이라는 이름으로 덮어쓰기 하면 바로 반영 됩니다!! 지금은 걍 별모양임-->
	
	<!-- 인원 선택 구간 -->
	<h1>빠른예매</h1>
	
	<hr>
	
            <div class="">관람인원선택</div>
            
           <div class="select_seat">
				<div class="select_seat_number">
				<div class="select_seat_age">성인</div>
				
					<input type="button" class="select_person" name="select_number_adult" value="0" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_adult" value="1" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_adult" value="2" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_adult" value="3" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_adult" value="4" onclick="change_btn(event)">
					
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;
           <div class="select_seat">
				<div class="select_seat_number">
				<div class="select_seat_age">청소년</div>
				
					<input type="button" class="select_person" name="select_number_teen" value="0" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_teen" value="1" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_teen" value="2" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_teen" value="3" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_teen" value="4" onclick="change_btn(event)">
					
				</div>
			</div>
			&nbsp;&nbsp;&nbsp;
           <div class="select_seat">
				<div class="select_seat_number">
				<div class="select_seat_age">우대</div>
				
					<input type="button" class="select_person" name="select_number_elderly" value="0" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_elderly" value="1" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_elderly" value="2" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_elderly" value="3" onclick="change_btn(event)">
					<input type="button" class="select_person" name="select_number_elderly" value="4" onclick="change_btn(event)">
					
				</div>
			</div>
            
            
            <br>
            <br>
            
    <div class="reserve-container">
        
        <div class="seat-part">
            <div class="reserve-title">좌석 선택</div>
            <div class="reserve-date">
            
            <div class="seat-container">

				<div class="seat-wrapper">
					<div class="screen-view-wrapper">
						<div class="screen-view">SCREEN</div>
			     
					</div>
				</div>
			</div>
            
            
            
            
            
            
            </div>
        </div>
<!--         </form> -->
    <form action="">
        <div class="selected-part">
            <div class="reserve-title">선택 사항</div>
            <div class="selected-list">
		        ${param.movie_title } <br>
				${param.reserved_date } <br>
				${param.selected_time } <br>
				쿠폰: 
			<div class="selected_pay_result">
			<!-- ajax를 이용하여 인원당 가격의 값을 pay 테이블에서 불러온다 -->
			
			</div>	
		<!-- 선택한 영화 제목, 상영날짜, 상영 시간 값을 폼 파라미터로 넘김 -->		
			<input type="hidden" name="movie_title" value="${param.movie_title }">	
			<input type="hidden" name="theater_date" value="${param.reserved_date }">	
			<input type="hidden" name="theater_time" value="${param.selected_time }">	
			<input type="hidden" name="selected_adult" value="0">	
			<input type="hidden" name="selected_teen" value="0">	
			<input type="hidden" name="selected_elderly" value="0">	
	         </div>
	        <input type="submit" value="결제하기" class="payButton">
        </div>
    </form>
    </div>
	

	
</body>
</html>