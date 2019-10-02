<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<style>
	.row {
	  display: -ms-flexbox; /* IE10 */
	  display: flex;
	  -ms-flex-wrap: wrap; /* IE10 */
	  flex-wrap: wrap;
	  margin: 0 -16px;
	}
	.col-50 {
	  -ms-flex: 50%; /* IE10 */
	  flex: 50%;
	  padding: 0 16px;
	}
	
	
	.info {
	  background-color: #d7d7fa;
	  border-left: 6px solid #9999ff;
	  margin-bottom: 15px;
	  padding: 4px 12px;
	}
	
	.loader {
	  border: 6px solid #f3f3f3;
	  border-radius: 50%;
	  border-top: 6px solid #babadb;
	  width: 12px;
	  height: 12px;
	  -webkit-animation: spin 1.5s linear infinite; /* Safari */
	  animation: spin 1.5s linear infinite;
	  float: left; 
	  margin:10px 10px 5px 8px;
	  }
	
	/* Safari */
	@-webkit-keyframes spin {
	  0% { -webkit-transform: rotate(0deg); }
	  100% { -webkit-transform: rotate(360deg); }
	}
	
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
	}
	</style>
</head>
<meta http-equiv="refresh" content="2; url='main.jsp'">
	<body style="background:#f1f1f1;">
	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div class="info">
		   <div class="row">
		     <div class="col-50">
		       <div class="loader"></div>
		       <%
		       session.invalidate();
		       out.println("<p><strong>로그아웃완료!</strong> 2초 뒤 메인페이지로 이동합니다.</p>");
		       %>
		       
		     </div>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	</body>
</html>