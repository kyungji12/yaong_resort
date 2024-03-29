﻿<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
	<head>
	<title>쓰기버튼 누르는 화면</title>
	<%
	//날짜 처리
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdt = new SimpleDateFormat("YYYY-MM-dd");
	//파일 업로드용 위치
		String uploadPath = request.getRealPath("image");
		String reviewID = "";
		String reviewTitle = "";
		String reviewName = "";
		String reviewContent = "";
		String reviewFileName = "";
		String reviewOrgFileName = "";
		String reviewOldFileName = "";
		
	MultipartRequest multi = new MultipartRequest( // MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
			request, 
			uploadPath, // 파일을 저장할 디렉토리 지정
			12 * 1024 * 1024, // 첨부파일 최대 용량 설정(bite) / 3mb / 용량 초과 시 예외 발생
			"utf-8", // 인코딩 방식 지정
			new DefaultFileRenamePolicy() // 중복 파일 처리(동일한 파일명이 업로드되면 뒤에 숫자 등을 붙여 중복 회피)
	);	
	
	//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		
	//e_02_review_update.jsp에서 id값 받아오기  
		reviewID = multi.getParameter("reviewid"); //id값으로 다시 select하면 되기때문에 굳이 모든 내용을 다 받아올 필요없당~
		//out.println(reviewID); //확인완료 , 새글쓰기null도 들어왕
		
		int reviewid;
		
		ResultSet rset1 = stmt.executeQuery("select *from resortnews where id ="+reviewID+";");
		
		reviewTitle = multi.getParameter("newstitle");
		//out.println(reviewTitle); 확인완료
		reviewName = multi.getParameter("newsname");
		//out.println(reviewName); 확인완료
		reviewContent = multi.getParameter("newscontent");
		//out.println(reviewContent); 확인완료
		reviewFileName = multi.getFilesystemName("newsfile");
		//out.println(reviewFileName); 확인완료
		reviewOrgFileName = multi.getOriginalFileName("newsfile");
		//out.println(reviewOrgFileName); 확인완료
		reviewOldFileName = multi.getParameter("newsoldfile");
		//out.println(reviewOldFileName); 확인완료

		//실행
		ResultSet rset2 = null;
		//입력처리
		if( reviewID == null){
		stmt.execute("insert into resortnews (title, date, content, name, url1) "+
					"values ('"+reviewTitle+"', '"+sdt.format(cal.getTime())+"','"+reviewContent+"','"+reviewName+"','"+reviewFileName+"');");
		rset2 = stmt.executeQuery("select * from resortnews where id = (select max(id) from resortnews);");
		}else//수정처리
		if( reviewID != null){
		reviewid = Integer.parseInt(reviewID);
			if(reviewFileName == null){
				reviewFileName = reviewOldFileName;
			}
		stmt.execute("update resortnews set title = '"+reviewTitle+"', content='"+reviewContent+"', url1='"+reviewFileName+"' where id = "+reviewid+";");
		rset2 = stmt.executeQuery("select * from resortnews where id = "+reviewid+";");
		}
	%>
	</head>
	<body>
	<%
	int newID = 0;
	   while(rset2.next()){
		   response.sendRedirect("?contentPage=e_01_news_view.jsp?id="+rset2.getInt(1)+"");
	   }

	
	%>
	</body>
</html>