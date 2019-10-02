<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Insert title here</title>
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
</script>
<style>
/*헤드 부분*/
body {
	background-color: #f1f1f1;
	padding: 20px;
	font-family: Arial;
	margin: 0;
}
/* Add a #9999ff background color to the top navigation */
.topnav {
	overflow: hidden;
	background-color: #a2a2db;
}

.menucontainer {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 768px) {
	.menucontainer {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.menucontainer {
		width: 970px;
	}
}

@media ( min-width : 1200px) {
	.menucontainer {
		width: 1170px;
	}
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
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
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
@media screen and (max-width: 600px) {
	.topnav a:not (:first-child ), .dropdown .dropbtn {
		display: none;
	}
	.topnav a.icon {
		float: right;
		display: block;
	}
}
/* The "responsive" class is added to the topnav with JavaScript when the user clicks on the icon.
		 This class makes the topnav look good on small screens (display the links vertically instead of horizontally) */
@media screen and (max-width: 600px) {
	.topnav.responsive {
		position: relative;
	}
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
	.topnav.responsive .dropdown {
		float: none;
	}
	.topnav.responsive .dropdown-content {
		position: relative;
	}
	.topnav.responsive .dropdown .dropbtn {
		display: block;
		width: 100%;
		text-align: left;
	}
}
</style>

</head>
<body>
	<!-- 	<div class="menucontainer" style="min-width: 500px;"> -->
	<!-- 해드부분 -->
	<a href="main.jsp"><img src="./image/logo_bbwc.png" width=22%></a>
	<!-- <img src="./image/kkamang.png"><img src="./image/ruby.png"> -->
	<div class="topnav" id="myTopnav">
		<!--<a href="#home" class="active">Home</a>-->
		<div class="dropdown">
			<button class="dropbtn">
				리조트 소개 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="a_01_vipRoom.html">VIP룸</a> <a href="a_02_standardRoom.html">일반룸</a> <a href="a_03_fairRoom.html">합리적인룸</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				찾아오기 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="b_01_direction.html">찾아오는 길</a> <a href="b_02_transit.html">대중교통 이용</a> <a href="b_03_car.html">자가용 이용</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				주변 여행지 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="c_01_mt.html">야옹 산</a> <a href="c_02_beach.html">야옹 해수욕장</a> <a href="c_03_spring.html">야옹 온천</a>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				예약 하기 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="d_01_bookstatus.jsp">예약 상황</a> <a href="d_02_booking.jsp">예약하기</a>
				<%
					String onlogin = null;

					onlogin = (String) session.getAttribute("onlogin");
					if (onlogin == null || !onlogin.equals("yes")) {
					} else {
				%>
				<a href="adm_allview.jsp">예약 상황(관리자)</a> <a href="adm_makedb.jsp">관리자추가</a>
				<%
					}
				%>
			</div>
		</div>
		<div class="dropdown">
			<button class="dropbtn">
				리조트 소식 <i class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-content">
				<a href="e_01_news.jsp">리조트 소식</a> <a href="e_02_review.jsp">이용후기</a>

			</div>
		</div>
		<a href="javascript:void(0);" style="font-size: 15px;" class="icon" onclick="myFunction()">&#9776;</a>
	</div>
	<br>
	<!-- 			</div> -->
</body>
</html>