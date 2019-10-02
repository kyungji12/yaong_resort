<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
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
		String reID = ""; //답글 id
		String reviewID = ""; //원글 id
		String reTitle = "";
		String reName = "";
		String reContent = "";
		String reFileName = "";
		String reOrgFileName = "";
		int reRootID ; //원글 id...? 
		String reviewRootID = "";
		String reviewReLevel = "";
		String reOldFileName = "";
		
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
		
	//e_02_review_reinsert.jsp에서 원글 id값 받아오기
		reviewID = multi.getParameter("reviewid");
		
	//e_02_review_reupdate.jsp에서 id값 받아오기  
	//답글 수정용 데이터값들	
		reID = multi.getParameter("reid"); //id값으로 다시 select하면 되기때문에 굳이 모든 내용을 다 받아올 필요없당~
		out.println("새 답글 id"+reID); //확인완료 , 새글쓰기null도 들어왕
		int reid;
		
		reTitle = multi.getParameter("retitle");
		//out.println(reTitle); //확인완료
		reName = multi.getParameter("rename");
		//out.println(reName); //확인완료
		reContent = multi.getParameter("recontent");
		//out.println(reContent);// 확인완료
		reFileName = multi.getFilesystemName("refile");
		//out.println(reFileName); //확인완료
		reOrgFileName = multi.getOriginalFileName("refile");
		//out.println(reOrgFileName); //확인완료
		reOldFileName = multi.getParameter("reoldfile");
		//out.println(reOldFileName); //확인완료
		
		ResultSet rset1 = stmt.executeQuery("select rootid, relevel from resortreview where id ="+reviewID+";");
		
		while(rset1.next()){
			reRootID = rset1.getInt(1);		
			reviewRootID = Integer.toString(reRootID);
			//out.println("rootid: "+reRootID); //확인완료
			reviewReLevel = rset1.getString(2);
			//out.println("relevel: "+reviewReLevel); //확인완료
		}
		
		int reviewReLength = reviewReLevel.length(); //길이
		
		//답글의 relevel구하기
		String newRelevel = null; //a, aa, ab, aaa, aab, aac..
		ResultSet rset2 = stmt.executeQuery("select id, rootid, relevel from resortreview where rootid = "+reviewRootID+" "+
				"and length(relevel) = "+(reviewReLength+1)+" and relevel like '"+reviewReLevel+"%' order by relevel;");
		
		while(rset2.next()){
			newRelevel = rset2.getString(3);
		} if (newRelevel == null){
			newRelevel = reviewReLevel + 'a';
		} else {
			newRelevel = newRelevel.substring(reviewReLength, reviewReLength+1);//0자리부터 시작하므로 제일 끝자리를 구하고싶으면 길이+1
			char alpha = newRelevel.charAt(0); //index로 주어진 값에 해당하는 문자를 리턴, 0=제일 첫 번째문자
			int ialpha = (int)alpha;//알파벳의 아스키코드 (ex: a=97, b=98, ~ , z=122)
			
			int ialpha2 = ialpha+1; //그 다음 알파벳을 구해야하므로 아스키코드숫자 +1
			char newReRelevel = (char)ialpha2; //그 숫자를 다시 문자로 변환
			
			newRelevel = reviewReLevel + newReRelevel; //ex: a+a=aa...
		}
		//실행
		ResultSet rset3 = null;
	
		//입력처리
		if( reID == null && reviewRootID != null ){
		stmt.execute("insert into resortreview (title, date, content, name, rootid, relevel, url1) "+
					"values ('"+reTitle+"', '"+sdt.format(cal.getTime())+"','"+reContent+"','"+reName+"','"+reviewRootID+"', '"+newRelevel+"', '"+reFileName+"');");
		rset3 = stmt.executeQuery("select * from resortreview where id = (select max(id) from resortreview);");
		}else//수정처리
		if( reID != null && reviewRootID != null ){
		reid = Integer.parseInt(reID);
			if(reFileName == null){
				reFileName = reOldFileName;
			}
		stmt.execute("update resortreview set title = '"+reTitle+"', content='"+reContent+"', url1='"+reFileName+"' where id = "+reid+";");
		rset3 = stmt.executeQuery("select * from resortreview where id = "+reid+";");
		}
	%>
	
	</head>

	<body>
	<%
	int newID = 0;
	   while(rset3.next()){
		   response.sendRedirect("e_02_review_view_m.jsp?id="+rset3.getInt(1)+"");
	   }

	
	%>
	</body>
</html>