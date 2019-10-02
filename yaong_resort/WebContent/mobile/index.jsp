<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>야옹리조트</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script>
	//헤드부분
	function myFunction() {
	  var x = document.getElementById("myTopnav");
	  if (x.className === "topnav") {
	    x.className += " responsive";
	  } else {
	    x.className = "topnav";
	  }
	}
	var orientationEvent;
	var uAgent=navigator.userAgent.toLowerCase();
	var mobilePhones= 'android';
	if(uAgent.indexOf(mobilePhones)!=-1){
		orientationEvent="resize";   //안드로이드는 resize로 들어옴
	}
	else orientationEvent="orientationchange"; //아이폰은 이렇게 들어옴
	window.addEventListener(orientationEvent, function(){
		//alert("회전했어요");
		location.href('#');
	}, false);

	var prevScreen=0;
	var sv_prevScreen=0;
	function prevShow(){
	  ScreenShow( prevScreen );
	}
	
	//서브메뉴를 선택(하단 버튼을 누름)했을 때 함수
	var muCnt = 5; //서브메뉴
	var scCnt = 12; //화면
	function fncShow( pos ){
		var i = 0;
		
		//모든 일반화면은 막는다.
		for(i=0; i<scCnt; i++){
			var obj = document.getElementById("s"+i);
			obj.style.display = 'none';
		}
	  
		//메뉴선택에 따라 중간메뉴 div는 보여주고, 누른 버튼의 배경을 바꿔준다
		for(i=0; i<muCnt; i++){
			var obj = document.getElementById("menu"+i);
			var obj2 = document.getElementById("m"+i);
			
			if(i == pos){
				obj.style.display = '';
				obj2.style.background="#ff0000"; //하단 버튼 누르면 빨강
			}else{
				obj.style.display = 'none';
				obj2.style.background="#ffff00"; //안눌리면 노랑
			}
		}
	}

	//총 화면은 12개이고 화면이 선택된 번호에 따라 화면을 보여주는 함수
	var scCnt = 12;
	var ScrObj;

	var timer1;
	function ScreenShow(pos){
		var i = 0;
		//모든 메뉴 페이지는 막는다.
		for (i=0;i<muCnt; i++){
			var obj = document.getElementById("menu"+i);
// 			obj.style.display = 'none';
		}
		
		//선택된 화면번호의 화면만 보여준다
		for(i=0; i<scCnt; i++){
			var obj = document.getElementById("s"+i);
			if(i == pos){
	      prevScreen = sv_prevScreen;
	      sv_prevScreen=i;

				obj.style.display = '';

	      obj.style.position="relative";
	      obj.style.top=35;
	      obj.style.left=screen.width;
	      obj.style.height=screen.height-120;

	      ScrObj=obj;
//	      ScrAnimation();
			}else{
// 				obj.style.display='none';
			}
		}
	}
	
	</script>
	<style>
	
		/*헤드 부분*/
		body {
		margin:0;
		font-family:Arial;
		width:device-width;
		height:device-height;
		}
		/* Add a #9999ff background color to the top navigation */
		.topnav {
		  overflow: hidden;
		  background-color: #a2a2db;
		}
		.container {
/* 		  padding-right: 15px; */
/* 		  padding-left: 15px; */
		  margin-right: auto;
		  margin-left: auto;
		  width:device-width;
		  height:device-height;
		}		
		/* Style the links inside the navigation bar */
		.topnav a {
		  float: left;
		  display: block;
		  color: #f2f2f2;
		  text-align: center;
		  padding: 14px 16px;
		  text-decoration: none;
		  font-size: 1em;
		  font-family: "나눔바른펜";
		  font-weight: normal;  
		}
		/* Add an active class to highlight the current page */
		.active {
		  background-color: #babadb;
		  color: white;
		}
		/* Hide the link that should open and close the topnav on small screens */
		.topnav .icon {
		  display: none;
		}
		/* Dropdown container - needed to position the dropdown content */
		.dropdown {
		  float: left;
		  overflow: hidden;
		}
		/* Style the dropdown button to fit inside the topnav */
		.dropdown .dropbtn {
		  border: none;
		  outline: none;
		  color: white;
		  padding: 14px 16px;
		  background-color: inherit; /*#babaff*/
		  font-size: 1em;
		  font-family: "나눔바른펜";
		  font-weight: normal; 
		  margin: 0;
		  min-width: 160px;
		}
		/* Style the dropdown content (hidden by default) */
		.dropdown-content {
		  display: none;
		  position: absolute;
		  background-color: #f9f9f9;
		  min-width: 160px;
		  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
		  z-index: 1;
		}
		/* Style the links inside the dropdown */
		.dropdown-content a {
		  float: none;
		  color: black;
		  padding: 12px 16px;
		  text-decoration: none;
		  display: block;
		  text-align: center;
		}
		
		/* Add a dark background on topnav links and the dropdown button on hover */
		.topnav a:hover, .dropdown:hover .dropbtn {
		  background-color: #babadb;
		  color: white;
		}
		/* Add a grey background to dropdown links on hover */
		.dropdown-content a:hover {
		  background-color: #ddd;
		  color: black;
		}
		/* Show the dropdown menu when the user moves the mouse over the dropdown button */
		.dropdown:hover .dropdown-content {
		  display: block;
		}
		/* When the screen is less than 600 pixels wide, hide all links, except for the first one ("Home").
		 Show the link that contains should open and close the topnav (.icon) */
/* 		@media screen and (max-width: 600px) { */
		  .topnav a:not(:first-child), .dropdown .dropbtn {
		    display: none;
		  }
		  .topnav a.icon {
		    float: right;
		    display: block;
		  }
/* 		} */
		/* The "responsive" class is added to the topnav with JavaScript when the user clicks on the icon.
		 This class makes the topnav look good on small screens (display the links vertically instead of horizontally) */
/* 		@media screen and (max-width: 600px) { */
		  .topnav.responsive {position: relative;}
		  .topnav.responsive .icon {
		    position: absolute; /* 메뉴 아이콘 위치 absolute*/
		    right: 0;
		    top: 0;
		  }
		  .topnav.responsive a {
		    float: none;
		    display: block;
		    text-align: left;
		  }
		  .topnav.responsive .dropdown {float: none;}
		  .topnav.responsive .dropdown-content {position: relative;}
		  .topnav.responsive .dropdown .dropbtn {
		    display: block;
		    width: 100%;
		    text-align: left;
		  }
/* 		} */
		#container {
		   height: 100vh;
		   display: flex; /* 디스플레이를 플렉스로 준다 */
		   flex-direction: column;
		}
		
		#head {
		   height: 7vh;
		}
		
		#contents {
		   height: 93vh;
		   overflow: auto;
		}
		</style>
	
</head>
<body>
	<div class="container">
		<!-- 해드부분 -->
		<!-- 			<a href="main.jsp"><img src="./image/logo_bbwc.png" width=22% height=12%></a> -->
		<!-- <img src="./image/kkamang.png"><img src="./image/ruby.png"> -->
		<div class="topnav" id="myTopnav">
			<!--<a href="#home" class="active">Home</a>-->
			<div id="menu0" class="dropdown">
				<button class="dropbtn">
					<div>리조트 소개 <i class="fa fa-caret-down"></i></div>
				</button>
				<div class="dropdown-content">
					<a href="?contentPage=content_m.html">야옹리조트</a>
					<a href="?contentPage=a_01_vipRoom_m.html">VIP룸</a>
					<a href="?contentPage=a_02_standardRoom_m.html">일반룸</a>
					<a href="?contentPage=a_03_fairRoom_m.html">합리적인룸</a>
				</div>
			</div>
			<div id="menu1"class="dropdown">
				<button class="dropbtn">
					찾아오기 <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="?contentPage=b_01_direction_m.html">찾아오는 길</a>
					<a href="?contentPage=b_02_transit_m.html">대중교통 이용</a>
				</div>
			</div>
			<div id="menu2"class="dropdown">
				<button class="dropbtn">
					주변 여행지 <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="?contentPage=c_01_mt_m.html">야옹 산</a>
					<a href="?contentPage=c_02_beach_m.html">야옹 해수욕장</a>
					<a href="?contentPage=c_03_spring_m.html">야옹 온천</a>
				</div>
			</div>
			<div id="menu3"class="dropdown">
				<button class="dropbtn">
					예약 하기 <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="?contentPage=d_01_bookstatus_m.jsp">예약 상황</a>
					<a href="?contentPage=d_02_booking_m.jsp">예약하기</a>
				</div>
			</div>
			<div id="menu4"class="dropdown">
				<button class="dropbtn">
					리조트 소식 <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="?contentPage=e_01_news_m.jsp">리조트 소식</a>
					<a href="?contentPage=e_02_review_m.jsp">이용후기</a>
				</div>
			</div>
			<a href="javascript:void(0);" style="font-size: 1em;;" class="icon" onclick="myFunction()"><span>야옹리조트　</span>&#9776;</a>
		</div>
		
		
		

	</div>
</body>
</html>