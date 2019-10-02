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

<!-- 부트스트랩 사용 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>

<script type="text/javascript">
   //좌우 회전, 화면 크기 변경 대응
   var orientationEvent;
   var uAgent = navigator.userAgent.toLowerCase();
   var mobilePhones = 'android';
   if (uAgent.indexOf(mobilePhones) != -1) {
      orientationEvent = "resize"; //안드로이드는 resize로 들어옴
   } else
      orientationEvent = "orientationchange"; //아이폰은 이렇게 들어옴
   window.addEventListener(orientationEvent, function() {
      //   alert("회전했어요");
      location.href('#');
   }, false); //false=버블단계 window에 이벤트는 캡쳐단계와 버블단계 둘중 하나에 걸림 교안 3-2강내용

   var prevScreen = 0;
   var sv_prevScreen = 0;
   function prevShow() {
      ScreenShow(prevScreen);
   }

   var muCnt = 5;//서브메뉴
   var scCnt = 13;//화면

   function fncShow(pos) {

      var i = 0;

      //모든 일반 화면 막는다.
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
            obj2.style.background = "#b1cef8";
         } else {
            obj.style.display = 'none';
            obj2.style.background = "#babaff";
         }
      }
   }

   //총 화면은 13개이고 화면이 선택된 번호에 따라 화면을 보여주는 함수
   var scCnt = 13;
   var ScrObj;
   var timer1;

   function ScrAnimation() {
      var offset = -50;
      if (parseInt(ScrObj.style.left) > 10) {

         ScrObj.style.left = parseInt(ScrObj.style.left) + offset + "px";
         timer1 = setTimeout("ScrAnimation()", 1);

      } else {
         ScrObj.style.left = 5;
         clearTimeout(timer1);
      }
   }
   //화면이 선택된 번호에 따라 화면을 보여주는 함수
   function ScreenShow(pos) {

      var i = 0;
      //모든 메뉴페이지는 막는다
      for (i = 0; i < muCnt; i++) {
         var obj = document.getElementById("menu" + i);
         obj.style.display = 'none';
      }

      //선택된 하면 번호의 화면만 보여준다.
      for (i = 0; i < scCnt; i++) {
         var obj = document.getElementById("s" + i);

         if (i == pos) {

            prevScreen = sv_prevScreen;
            sv_prevScreen = i;
            obj.style.display = '';

            obj.style.position = "relative";
            obj.style.top = 35;
            obj.style.left = screen.width;
            obj.style.height = screen.height - 120;

            ScrObj = obj;
            ScrAnimation();
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
   font-size: 16px;
}

ul {
   text-align: left;
   vertical-align: middle;
   margin: 2;
   padding: 10;
   height: 20;
   background-color: #b1cef8;
   border: 2px solid #b1cef8;
   font-size: 16px;
}

#container {
   height: 100vh;
   display: flex; /* 디스플레이를 플렉스로 준다 */
   flex-direction: column;
}

#head {
   height: 7vh;
}

#contents {
   height: 81vh;
   overflow: auto;
}

#foot {
   height: 11vh;
}
</style>


<title>m.Resort</title>
</head>
<body onload='ScreenShow(0);'onload="currentSlide(1);" onload="filterSelection('all');">
   <center>
      <div id="container"
         style="width: device-width; height: device-height;">

         <!-- 헤더 -->
         <div id="head">
            <div id="header1"
               style="background-color: #babaff; height: 35px; width: 15%; float: left;"
               onclick="prevShow();">
               <center>
                  <img src="../image/backbtn.png" width="40px" height="32px">
               </center>
            </div>
            <div id="header2"
               style="background-color: #babaff; height: 35px; width: 70%; float: left;">
               <center>
                  <img src="../image/logo_bbwc.png" height=32px/>
               </center>
            </div>
            <div id="header3"
               style="background-color: #babaff; height: 35px; width: 15%; float: left;"
               onclick="ScreenShow(0);">
               <center>
                  <img src="../image/homebtn.png" width="30px" height="32px">
               </center>
            </div>
         </div>

         <!-- 메뉴화면 -->
         <div id="menu0"
            style="background-color: #b1cef8; display: none; width: device-width;">
            리조트 소개
            <li onclick='ScreenShow(0);'>야옹 리조트</li>
			<li onclick='ScreenShow(1);'>VIP룸</li>
			<li onclick='ScreenShow(2);'>일반룸</li>
			<li onclick='ScreenShow(3);'>합리적인룸</li> <br>
         </div>
         <div id="menu1"
            style="background-color: #b1cef8; display: none; width: device-width;">
            찾아오기
            <li onclick='ScreenShow(4);'>찾아오는길</li>
            <li onclick='ScreenShow(5);'>대중교통이용</li>
         </div>
         <div id="menu2"
            style="background-color: #b1cef8; display: none; width: device-width;">
            주변명소
           <li onclick='ScreenShow(6);'>야옹산</li>
			<li onclick='ScreenShow(7);'>야옹해수욕장</li>
			<li onclick="ScreenShow(8);">야옹온천</li> <br>
         </div>
         <div id="menu3"
            style="background-color: #b1cef8; display: none; width: device-width;">
            예약하기
      		<li onclick='ScreenShow(9);'>예약상황</li>
			<li onclick='ScreenShow(10);'>예약하기</li> <br>
         </div>
         <div id="menu4"
            style="background-color: #b1cef8; display: none; width: device-width;">
            리조트소식
            <li onclick='ScreenShow(11);'>리조트소식</li> <br>
			<li onclick="ScreenShow(12);">후기</li>
         </div>

         <!-- 화면 부 -->
         <div id="contents">
            <div id="s0" style="display: none; width: device-width;">
               <jsp:include page="content_m.html"></jsp:include>
            </div>
            <div id="s1" style="display: none; width: device-width;">
               <jsp:include page="a_01_vipRoom_m.html"></jsp:include>
            </div>
            <div id="s2" style="display: none; width: device-width;">
               <jsp:include page="a_02_standardRoom_m.html"></jsp:include>
            </div>
            <div id="s3" style="display: none; width: device-width;">
               <jsp:include page="a_03_fairRoom_m.html"></jsp:include>
            </div>
            <div id="s4" style="display: none; width: device-width;">
               <jsp:include page="b_01_direction_m.html"></jsp:include>
            </div>
            <div id="s5" style="display: none; width: device-width;">
               <jsp:include page="b_02_transit_m.html"></jsp:include>
            </div>
            <div id="s6" style="display: none; width: device-width;">
               <jsp:include page="c_01_mt_m.html"></jsp:include>
            </div>
            <div id="s7" style="display: none; width: device-width;">
               <jsp:include page="c_02_beach_m.html"></jsp:include>
            </div>
            <div id="s8" style="display: none; width: device-width;">
               <jsp:include page="c_03_spring_m.html"></jsp:include>
            </div>
            <div id="s9" style="display: none; width: device-width;">
               <iframe src="d_01_bookstatus_m.jsp" frameborder="0" border="0"
                  bordercolor="white" margin-width="0"
                  style="width: -webkit-fill-available; height: -webkit-fill-available;"
                  margin-height="0" scroling="yes">예약상황</iframe>
            </div>
            <div id="s10" style="display: none; width: device-width;">
               <iframe src="d_02_booking_m.jsp" frameborder="0" border="0" bordercolor="white"
                  margin-width="0" margin-height="0"
                  style="width: -webkit-fill-available; height: -webkit-fill-available;"
                  scroling="yes">예약하기</iframe>
            </div>
            <div id="s11" style="display: none; width: device-width;">
               <iframe src="e_01_news_m.jsp" frameborder="0" border="0" bordercolor="white"
                  margin-width="0" margin-height="0"
                  style="width: -webkit-fill-available; height: -webkit-fill-available;"
                  scroling="yes">공지사항</iframe>
            </div>
            <div id="s12" style="display: none; width: device-width;">
               <iframe src="e_02_review_m.jsp" frameborder="0" border="0" bordercolor="white"
                  margin-width="0" margin-height="0"
                  style="width: -webkit-fill-available; height: -webkit-fill-available;"
                  scroling="yes">이용후기</iframe>
            </div>
         </div>

         <!-- footer -->
         <div id="foot">
            <div id="m0" onclick='fncShow(0);'
               style="position: absolute; bottom: 3px; position: absolute; left: 1%; background-color: #babaff; height: 60px; width: 18%; float: left;">
               <center>
                  <img src="../image/logocat.png" width="40px" height="40px"><br>
                  <font size=1.5>리조트소개</font>
               </center>
            </div>
            <div id="m1" onclick='fncShow(1);'
               style="position: absolute; bottom: 3px; position: absolute; left: 21%; background-color: #babaff; height: 60px; width: 18%; float: left;">
               <center>
                  <img src="../image/logocat.png" width="40px" height="40px"><br>
                  <font size=1.5>찾아오기</font>
               </center>
            </div>
            <div id="m2" onclick='fncShow(2);'
               style="position: absolute; bottom: 3px; position: absolute; left: 41%; background-color: #babaff; height: 60px; width: 18%; float: left;">
               <center>
                  <img src="../image/logocat.png" width="40px" height="40px"><br>
                  <font size=1.5>주변명소</font>
               </center>
            </div>
            <div id="m3" onclick='fncShow(3);'
               style="position: absolute; bottom: 3px; position: absolute; left: 61%; background-color: #babaff; height: 60px; width: 18%; float: left;">
               <center>
                  <img src="../image/logocat.png" width="40px" height="40px"><br>
                  <font size=1.5>예약하기</font>
               </center>
            </div>
            <div id="m4" onclick='fncShow(4);'
               style="position: absolute; bottom: 3px; position: absolute; left: 81%; background-color: #babaff; height: 60px; width: 18%; float: left;">
               <center>
                  <img src="../image/logocat.png" width="40px" height="40px"><br>
                  <font size=1.5>리조트소식</font>
               </center>
            </div>
         </div>
      </div>
   </center>



   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
</body>
</html>