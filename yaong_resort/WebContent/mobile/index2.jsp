<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- 페이지 크기 제어 사파리용 -->
<meta name="viewport" content="user-scable= no, width=device-width" />
<!-- Safari UI(URL Bar, Button Bar) 없애기 및 변경하기 -->
<meta name=”apple-mobile-web-app-capable” content=”yes” />
<meta name=”apple-mobile-web-app-status-bar-style” content=”black” />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-chache" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script language='javascript' type='text/javascript'>
	var orientationEvent;
	var uAgent = navigator.userAgent.toLowerCase();
	var mobilePhones = 'android';
	if (uAgent.indexOf(mobilePhones) != -1) {
		orientationEvent = "resize"; //안드로이드는 resize로 들어옴
	} else
		orientationEvent = "orientationonchange"; //아이폰은 이렇게 들어옴
	window.addEventListener(orientationEvent, function() {
		alert("회전했어요");
		location.href('#');
	}, false);

	//서브메뉴를 선택(하단 버튼을 누름)했을 때 함수
	var muCnt = 5; //서브메뉴
	var scCnt = 13; //화면
	function fncShow(pos) {
		var i = 0;

		//모든 일반화면은 막는다.
		for (i = 0; i < scCnt; i++) {
			var obj = document.getElementById("s" + i);
			obj.style.display = 'none';
		}

		//메뉴선택에 따라 중간메뉴 div는 보여주고, 누른 버튼의 배경을 바꿔준다
		for (i = 0; i < muCnt; i++) {
			var obj = document.getElementById("menu" + i);
			var obj2 = document.getElementById("m" + i);

			if (i == pos) {
				obj.style.display = '';
				obj2.style.background = "#b1cef8"; //하단 버튼 누르면 #b1cef8 하늘
			} else {
				obj.style.display = 'none';
				obj2.style.background = "#babaff"; //안눌리면 보라
			}
		}
	}

	//총 화면은 13개이고 화면이 선택된 번호에 따라 화면을 보여주는 함수
	var scCnt = 13;
	function ScreenShow(pos) {
		var i = 0;
		//모든 메뉴 페이지는 막는다.
		for (i = 0; i < muCnt; i++) {
			var obj = document.getElementById("menu" + i);
			obj.style.display = 'none';
		}

		//선택된 화면번호의 화면만 보여준다
		for (i = 0; i < scCnt; i++) {
			var obj = document.getElementById("s" + i);
			if (i == pos) {
				obj.style.display = '';
			} else {
				obj.style.display = 'none';
			}
		}
	}
</script>
<style type="text/css">
li {
	text-align: left;
	vertical-align: middle;
	margin: 2;
	padding: 10;
	height: 20;
	background-color: #b1cef8;
	border: 2px solid #b1cef8;
	font-size: 16px
}

ul {
	text-align: left;
	vertical-align: middle;
	margin: 2;
	padding: 10;
	height: 20;
	background-color: #b1cef8;
	border: 2px solid #b1cef8 ;
	font-size: 16px
}
/* #container { */
/*    height: 100vh; */
/*    display: flex; /* 디스플레이를 플렉스로 준다 */ */
/*    flex-direction: column; */
/* } */

/* #head { */
/*    height: 7vh; */
/* } */

/* #contents { */
/*    height: 81vh; */
/*    overflow: auto; */
/* } */

/* #foot { */
/*    height: 11vh; */
/* } */
</style>

</head>
<body onload='ScreenShow(0);'onload="filterSelection('all'); currentSlide(1);">

<!-- 		<div id="container" style=" width: device-width; height: device-height;"> -->
			<div id="header1" style="text-align: center; background-color: #babaff; height: 35px; width: 15%; float: left;" onclick='prevShow();'>
				<img src="../image/backbtn.png" width=40px height=32px>
			</div>
				
			<div id="header2" style="text-align: center; background-color: #babaff; height: 35px; width: 70%; float: left;">
				<img src="../image/logo_bbwc.png" height=32px/>
			</div>

			<div id="header3" style="background-color: #babaff; height: 35px; width: 15%; float: left;" onclick='ScreenShow(0);'>
				<img src="../image/homebtn.png" style="align: center; width: 30px; height: 32px;">
			</div>

			<div id="head">
			<div id="menu0" style="background-color: #b1cef8; display: none; width: device-width;">
				리조트소개
				<li onclick='ScreenShow(0);'>야옹 리조트</li>
				<li onclick='ScreenShow(1);'>VIP룸</li>
				<li onclick='ScreenShow(2);'>일반룸</li>
				<li onclick='ScreenShow(3);'>합리적인룸</li> <br>
			</div>
			<div id="menu1" style="background-color: #b1cef8; display: none; width: device-width;">
				찾아오기
				<li onclick='ScreenShow(4);'>찾아오는길</li>
				<li onclick='ScreenShow(5);'>대중교통이용</li>
			</div>
			<div id="menu2" style="background-color: #b1cef8; display: none; width: device-width;">
				주변명소
				<li onclick='ScreenShow(6);'>야옹산</li>
				<li onclick='ScreenShow(7);'>야옹해수욕장</li>
				<li onclick="ScreenShow(8);">야옹온천</li> <br>
			</div>
			<div id="menu3" style="background-color: #b1cef8; display: none; width: device-width;">
				예약하기
				<li onclick='ScreenShow(9);'>예약상황</li>
				<li onclick='ScreenShow(10);'>예약하기</li> <br>
			</div>
			<div id="menu4" style="background-color: #b1cef8; display: none; width: device-width;">
				리조트소개
				<li onclick='ScreenShow(11);'>리조트소식</li> <br>
				<li onclick="ScreenShow(12);">후기</li>
			</div>
			
			<div id="s0" style="  display:none; width:device-width;">
<!-- 			    <iframe src="content_m.html" frameborder="0" border="0" bordercolor="white" -->
<!-- 			     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0" -->
<!-- 			    scrolling="yes"></iframe> -->
			     <jsp:include page="content_m.html"></jsp:include>
			 </div>
<!-- 	</div> -->
<!-- 			<div id="contents">  -->
		  <div id="s1" style="  display:none; width:device-width;">
		    <iframe src="a_01_vipRoom_m.html" frameborder="0" border="0" bordercolor="white"
		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0"
		    scrolling="yes"></iframe>
 				<jsp:include page="a_01_vipRoom_m.html"></jsp:include>

		  </div>
		  
		  <div id="s2" style="  display:none; width:device-width;">
<!-- 		    <iframe src="a_02_standardRoom_m.html" frameborder="0" border="0" bordercolor="white" -->
<!-- 		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0" -->
<!-- 		    scrolling="yes"></iframe> -->
 				<jsp:include page="a_02_standardRoom_m.html"></jsp:include>
		  </div>
		  
		  <div id="s3" style="  display:none; width:device-width;">
<!-- 		    <iframe src="a_03_fairRoom_m.html" frameborder="0" border="0" bordercolor="white" -->
<!-- 		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0" -->
<!-- 		    scrolling="yes"></iframe> -->
				 <jsp:include page="a_03_fairRoom_m.html"></jsp:include>
		  </div>
		  
		  <div id="s4" style="  display:none; width:device-width;">
<!-- 		    <img src="../image/b_01.jpg" width="200px" height="150px"> 오시는길 -->
<!-- 		    <br>지하철 이용 시 -->
<!-- 		    <br>7호선 어린이대공원역 하차 후 6번 출구 -->
<!-- 		    <br>5호선 군자역 세종초등학교 방면 7번 출구 -->
<!-- 		    <br>※ 세종대학교 후문 건너편 흰색 높은 건물 102호(새날관)<br> -->
<!-- 		    <br>반버스 이용 시 -->
<!-- 		    <br>- 어린이대공원 : 간선 721 지선 4212, 3216 -->
<!-- 		    <br>- 화양리 : 간선 240, 302 지선 2016,2222, 3217, 3220 -->
<!-- 		    <br>- 세종사이버대학교정문(세종초등학교앞): 간선 240 지선 2012, 2016 -->
				 <jsp:include page="b_01_direction_m.html"></jsp:include>
		  </div>
		  <div id="s5" style="  display:none; width:device-width;">
<!-- 		    <img src="../image/b_02.jpg" width="200px" height="150px"> 주차장안내     -->
<!-- 		    <br>자가용 이용 시 -->
<!-- 		    <br>영동대교 이용 시 : 영동대교 화양사거리(우회전) 화양삼거리(좌회전) 나누리조트 -->
<!-- 		    <br>올림픽대교 이용 시 : 올림픽대교 화양사거리(직진) 화양삼거리(우회전) 나누리조트 -->
<!-- 		    <br>군자교 이용 시 : 군자교 면목로(우회전) 나누리조트<br> -->
<!-- 		    <br>※ 주차는 조아리조트 건물 뒤편으로 진입하여 나누리조트 주차장을 이용하시면 됩니다. -->
				 <jsp:include page="b_02_transit_m.html"></jsp:include>
		  </div>
		  
		  <div id="s6" style="display:none; width:device-width;">
<!-- 		    <iframe src="c_01_mt_m.html" frameborder="0" border="0" bordercolor="white" -->
<!-- 		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0" -->
<!-- 		    scrolling="yes"></iframe> -->
				 <jsp:include page="c_01_mt_m.html"></jsp:include>
		  </div>
		  
		  <div id="s7" style="display:none; width:device-width;">
<!-- 		    <iframe src="c_02_beach_m.html" frameborder="0" border="0" bordercolor="white" -->
<!-- 		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0" -->
<!-- 		    scrolling="yes"></iframe> -->
				 <jsp:include page="c_02_beach_m.html"></jsp:include>
		  </div>
		  
		  <div id="s8" style="display:none; width:device-width;">
<!-- 		    <iframe src="c_03_spring_m.html" frameborder="0" border="0" bordercolor="white" -->
<!-- 		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0" -->
<!-- 		    scrolling="yes"></iframe> -->
				 <jsp:include page="c_03_spring_m.html"></jsp:include>
		  </div>
		  
		  <div id="s9" style="display:none; width:device-width;">
		    <iframe src="d_01_bookstatus_m.jsp" frameborder="0" border="0" bordercolor="white"
		     style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0"
		    scrolling="yes"></iframe><!-- 예약 리스트 -->
		  </div>
		  
		  <div id="s10" style="display:none; width:device-width;">
		    <iframe src="d_02_booking_m.jsp" frameborder="0" border="0" bordercolor="white"
		    style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0"
		    scrolling="yes"></iframe><!-- 예약하기 -->
		  </div>
		  
		  <div id="s11" style="display:none; width:device-width;">
		    <iframe src="e_01_news_m.jsp" frameborder="0" border="0" bordercolor="white"
		    style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0"
		    scrolling="yes"></iframe><!-- 공지 -->
		  </div>
		  
		  <div id="s12" style="display:none; width:device-width;">
		    <iframe src="e_02_review_m.jsp" frameborder="0" border="0" bordercolor="white"
		    style="margin-top: 30px; width:100vw; height: 80vh;" marginwidth="0" marginheight="0"
		    scrolling="yes"></iframe><!-- 후기 -->
		  </div>
<!-- 	</div> -->
	
	
<!-- 	  <div id="foot"> -->
<!-- 	  <div id="m0" onclick="fncShow(0);" style="position:absolute;bottom: 3px;position: absolute;left:1%;background-color: #babaff;height: 40px;width: 18%;float:left;"> -->
	  <div id="m0" onclick="fncShow(0);" style="position: absolute; bottom: 3px; position: absolute; left: 1%; background-color: #babaff; height: 80px; width: 18%; float: left;">
	  <center><img src="../image/logocat.png" width="40px" height="40px"><br>
	    <font size=2>리조트 소개</font></center>
	  </div>
	  <div id="m1" onclick="fncShow(1);" style="position: absolute; bottom: 3px; position: absolute; left: 21%; background-color: #babaff; height: 80px; width: 18%; float: left;">
	    <center><img src="../image/logocat.png" width="40px" height="40px"><br>
	      <font size=2>오시는 길</center>
	  </div>
	  <div id="m2" onclick="fncShow(2);" style="position: absolute; bottom: 3px; position: absolute; left: 41%; background-color: #babaff; height: 80px; width: 18%; float: left;">
	      <center><img src="../image/logocat.png" width="40px" height="40px"><br>
	        <font size=2>주변 명소</center>
	  </div>
	  <div id="m3" onclick="fncShow(3);" style="position: absolute; bottom: 3px; position: absolute; left: 61%; background-color: #babaff; height: 80px; width: 18%; float: left;">
	    <center><img src="../image/logocat.png" width="40px" height="40px"><br>
	      <font size=2>예약하기</center>
	  </div>
	  <div id="m4" onclick="fncShow(4);" style="position: absolute; bottom: 3px; position: absolute; left: 81%; background-color: #babaff; height: 80px; width: 18%; float: left;">
	    <center><img src="../image/logocat.png" width="40px" height="40px"><br>
	      <font size=2>리조트 소식</center>
	  </div>
	</div>
<!-- 	</div> -->
	</center>
	
</body>
</html>