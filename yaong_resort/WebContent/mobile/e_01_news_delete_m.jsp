<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Calendar" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>글 삭제</title>
		<%
		//DB연결
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
			Statement stmt = conn.createStatement();	
		
			String reviewID = request.getParameter("id");
			//out.println(reviewID); //삭제할 id값 잘 넘어와용~
			stmt.execute("DELETE FROM resortnews WHERE id ="+ reviewID +";");
		%>
	</head>
	<body>
		<%
			response.sendRedirect("e_01_news_m.jsp");
		%>
	</body>
</html>