<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Calendar" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
	<head>
	<title>글 삭제</title>
		<%
		//DB연결
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
			Statement stmt = conn.createStatement();	
		
			String reviewID = request.getParameter("id");
			//out.println(reviewID); //삭제할 id값 잘 넘어와용~
			stmt.execute("DELETE FROM resortreview WHERE id ="+ reviewID +";");
		%>
	</head>
	<body>
		<%
			response.sendRedirect("?contentPage=e_02_review.jsp");
		%>
<!-- 		<meta http-equiv="refresh" content="2; url=e_02_review.jsp">  2초후에 원하는 페이지로 넘어가기-->
		
	</body>
</html>