<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
			* {
		  box-sizing: border-box;
		}
		
		body {
		  background-color: #f1f1f1;
		  padding: 20px;
		  font-family: Arial;
		  margin:0;
		}
	/* 하단부분*/
		.footer {
		left: 0;
		bottom: 0;
		width: 100%;
		max-width: 100%;
		background-color: #a2a2db;
		color: white;
		}
		.footer > p{
		font-size:12px;
		}
		
		/*관리자 로그인 버튼*/
		/* Set a style for all buttons */
		.login {
		  background-color: #babadb;
		  color: #56569c;
		  padding: 8px 25px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		  border-radius:3px;
		}
		
		.login:hover {
		  background-color: #9797bf;
		}
				
		</style>
	</head>
	<body>
	<!-- 꼬리부분 -->
			<div class="footer">
			<p>야옹리조트</p>
			<p><br>Tel:010-8570-7475　｜ Acc. 카카오뱅크 3333-01-9362574　예금주 윤경지｜ Add. 경기 성남시 분당구 황새울로 329번길 5</p>
			<p><br>대표. 윤루비 윤까망</p>			
			</div>
			<br>
			
			<%
			//세션 체크
 			String onlogin = null;
			
			onlogin = (String)session.getAttribute("onlogin");
			if(onlogin == null){			
			%>
			<button class="login" onclick="location.href='adm_login.jsp'" style="width:auto;">관리자 로그인</button>
			<%	return;
			}
			if(!onlogin.equals("yes")){
			%>			
			<button class="login" onclick="location.href='adm_login.jsp'" style="width:auto;">관리자 로그인</button>
			<%	return;
			}else{
			%>
			<button class="login" onclick="location.href='adm_logout.jsp'" style="width:auto;">관리자 로그아웃</button>
			<%
			}
			%>
	
	</div>
	</body>
</html>