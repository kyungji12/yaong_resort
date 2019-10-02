<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>

<!DOCTYPE html>
<html>
	<head>
	<title>예약실행 화면</title>
	<%
	//날짜 처리
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdt = new SimpleDateFormat("YYYY-MM-dd");
	//파일 업로드용 위치
		String bookname = ""; //예약자 이름
		String bookemail = ""; //이메일
		String bookphone = ""; //핸드폰번호
		String payname = ""; //지불하는 이름
		String bookdate = ""; //예약날짜
		int roomtype = 0; //룸타입
		int bookppl = 0; //인원
		
	//d_02_booking.jsp에서 값 받아오기  
		bookname = new String(request.getParameter("bookname").getBytes("8859_1"),"utf-8"); //id값으로 다시 select하면 되기때문에 굳이 모든 내용을 다 받아올 필요없당~
		//out.println("예약자명"+bookname+"<br>"); //확인완료 , 새글쓰기null도
		bookemail = request.getParameter("bookemail");
		//out.println("이메일"+bookemail+"<br>"); //확인완료
		bookphone = request.getParameter("bookphone");
		//out.println("핸드폰번호"+bookphone+"<br>"); //확인완료
		payname = new String(request.getParameter("bookname2").getBytes("8859_1"),"utf-8");
		//out.println("지불명"+payname+"<br>"); //확인완료
		bookdate = request.getParameter("bookdate");
		//out.println("날짜"+bookdate+"<br>"); //확인완료
		roomtype = Integer.parseInt(request.getParameter("roomtype"));
		//out.println("룸타입"+roomtype+"<br>"); //확인완료
		bookppl = Integer.parseInt(request.getParameter("bookppl"));
		//out.println("인원"+bookppl+"<br>"); //확인완료
try{			
	//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		//Statement stmt = conn.createStatement();
		PreparedStatement psmt = null;
		
		psmt = conn.prepareStatement(
				"insert into resortbook(bookname, bookemail, bookphone, payname, roomtype, bookppl, bookdate) values(?,?,?,?,?,?,?);");
		psmt.setString(1, bookname);
		psmt.setString(2, bookemail);
		psmt.setString(3, bookphone);
		psmt.setString(4, payname);
		psmt.setInt(5, roomtype);
		psmt.setInt(6, bookppl);
		psmt.setString(7, bookdate);
		psmt.execute();
		psmt.close();
		//stmt.close();
		conn.close();

	%>
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
<meta http-equiv="refresh" content="2; url=?contentPage=d_01_bookstatus.jsp">
	<body style="background:#f1f1f1;">
	 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div class="info">
		   <div class="row">
		     <div class="col-50">
		       <div class="loader"></div>
		       <p><strong>예약완료!</strong> 2초 뒤 예약 리스트로 이동합니다.</p>
		     </div>
			</div>
		</div>
		 <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<%}catch (Exception e){ %>
<script>
	alert("예약 가능한 일자를 확인하세요.");
	history.go(-1);
</script>
<%} %>
	</body>
</html>