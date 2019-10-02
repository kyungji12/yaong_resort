<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8"%>
<html>
	<head>
	<title>전체화면</title>
	<%
		// 넘어오는 페이지값을 받아서 div에 배치할 내용 지정하기
		String contentPage = request.getParameter("contentPage");
		if (contentPage == null) { //넘어오는 값이 null이라면 메인 페이지만 보여주기
			contentPage = "content_m.html";
		}
	%>
	<style>
	* {
		width: device-width; /*500px이하로는 화면이 작아지지 않도록*/
		height: device-height;
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
		   height: 93vh;
		   overflow: auto;
		}
	</style>
		
	</head>
	<!-- 슬라이드 쇼 사진이 바로 뜨지 않아서 body 부분에 onload로 불러온다  -->
	<body onload="filterSelection('all'); currentSlide(1);">
	<div id="container" style="width: device-width; height: device-height;">
	<!-- 메뉴부분 -->
		<div id="head"> 
			<jsp:include page="index.jsp" />
		</div>
	<!-- 메인부분 -->
		<div id="contents" class="maincontainer">
			<jsp:include page="<%=contentPage%>" />
		</div>
			
	</div>	
	</body>
</html>