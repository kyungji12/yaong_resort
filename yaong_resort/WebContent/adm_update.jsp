<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
	<head>
	<title>Insert title here</title>
	<%
	//try{
	String bookname = ""; //예약자 이름
	String bookemail = ""; //이메일
	String bookphone = ""; //핸드폰번호
	String payname = ""; //지불하는 이름
	String newbookdate = ""; //예약날짜
	String oldbookdate = "";
	int newroomtype = 0; //룸타입
	int oldroomtype = 0;
	int bookppl = 0; //인원

	bookname = new String(request.getParameter("bookname").getBytes("8859_1"),"utf-8"); //id값으로 다시 select하면 되기때문에 굳이 모든 내용을 다 받아올 필요없당~
	//out.println("예약자명"+bookname+"<br>"); //확인완료 , 새글쓰기null도
	bookemail = request.getParameter("bookemail");
	//out.println("이메일"+bookemail+"<br>"); //확인완료
	bookphone = request.getParameter("bookphone");
	//out.println("핸드폰번호"+bookphone+"<br>"); //확인완료
	payname = new String(request.getParameter("bookname2").getBytes("8859_1"),"utf-8");
	//out.println("지불명"+payname+"<br>"); //확인완료
	newbookdate = request.getParameter("bookdate");
	//out.println("날짜"+bookdate+"<br>"); //확인완료
	
	oldbookdate = request.getParameter("oldbookdate");
	//out.println("원래 숙박날짜"+oldbookdate); //확인완료
	
	newroomtype = Integer.parseInt(request.getParameter("roomtype"));
	//out.println("룸타입"+roomtype+"<br>"); //확인완료
	
	oldroomtype = Integer.parseInt(request.getParameter("oldroomtype"));
	//out.println("원래 방타입"+oldroomtype); //확인완료
	
	bookppl = Integer.parseInt(request.getParameter("bookppl"));
	//out.println("인원"+bookppl+"<br>"); //확인완료
	
	//DB연결
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
	Statement stmt = conn.createStatement();
	
	stmt.execute("UPDATE resortbook set bookname = '"+bookname+"', bookemail = '"+bookemail+"', bookphone ='"+bookphone+"', payname ='"+payname+"', roomtype = '"+newroomtype+"', bookppl = '"+bookppl+"', bookdate = '"+newbookdate+"' where roomtype = '"+oldroomtype+"' and bookdate = '"+oldbookdate+"';");
// 	stmt.execute("delete from resortbook where bookdate ='"+bookdate+"', roomtype ='"+roomtype+"'");
//	out.println("완료");
	%>
	
	</head>
	<meta http-equiv="refresh" content="1; url='?contentPage=adm_allview.jsp'">
	<body>
	
	
	</body>
</html>