<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*"%>
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
<body>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String adminid = "";
	String adminpw = "";

	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
	
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select * from resortadmin where id='"+id+"' and pw='"+pw+"';");
	while(rset.next()){
		adminid = rset.getString(1);
		adminpw = rset.getString(2);
	}
	
	boolean bPassChk=false;	
	//아이디,비밀번호 체크
	if(id.replaceAll(" ","").equals(adminid) && pw.replaceAll(" ","").equals(adminpw)){
		bPassChk=true;
	}else{
		bPassChk=false;
	}
	
	//패스워드 체크가 끝나면 세션을 기록하고 점프
	if(bPassChk) {
		session.setAttribute("onlogin","yes");
		session.setAttribute("login_id",id);
		response.sendRedirect("main.jsp"); //로그인 체크 이후 돌아갈 곳
	}else{
		out.println("<br><br><br>");
		out.println("<div class='info'><div class='row'><div class='col-50'><div class='loader'></div>");
		out.println("<h2>아이디 또는 패스워드 오류</h2>");
		out.println("<button><a href='main.jsp'>메인페이지</button>");	
		out.println("</dv></dv></dv>");
	}

%>

	
</body>
</html>