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
	<title>예약상황</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>
	/*예약상황 */
	* {
	  box-sizing: border-box;
	}
	
	input[type=text], select, textarea {
	  width: 100%;
	  padding: 12px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  resize: vertical;
	}
	
	label {
	  padding: 12px 12px 12px 0;
	  display: inline-block;
	}
	
	input[type=submit] {
	  background:#ddd;
      color:#56569c;
	  padding: 12px 20px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  float: right;
	  margin: 10px;
	}
	
	input[type=submit]:hover {
	  background-color: #babadb;
	}
	
	.bookingcontainer {
	  border-radius: 5px;
	  background-color: #f2f2f2;
	  padding: 20px;
	}
	
	.col-25 {
	  float: left;
	  width: 18%;
	  margin-top: 6px;
	  text-align:center;
	}
	
	.col-75 {
	  float: left;
	  width: 82%;
	  margin-top: 6px;
	}
	
	/* Clear floats after the columns */
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
	@media screen and (max-width: 600px) {
	  .col-25, .col-75, input[type=submit], .button {
	    width: 100%;
	    margin-top: 0;
	  }
	}

		/*예약상황테이블  */
		table {
		  border-collapse: collapse;
		  width: 100%;
		  border: 1px solid #ccccdb;
/* 		  margin: auto; /* margin auto를 줘야 테이블 정렬이 중앙으로 온다.*/ */
/* 		  text-align: center; */
		}
		th, td {
		  text-align: center;
		  padding: 8px;
		  border: 1px solid #ccccdb;
		  font-size: 1em;
		}
		tr:nth-child(even) { /* 짝수번째 글에는 색칠하기 */
  		background-color: #f2f2f2
		}
		/* 맞춤 hr */
		hr.new3 {
		  border-top: 1px dotted #ccccdb;
		}
		a.booking{
		text-decoration:none;
		color: black;
		}
		/*취소 및 홈 버튼  */
		.button {
		  background:#ddd;
	      color:#56569c;
		  padding: 12px 20px;
		  border: none;
		  border-radius: 4px;
		  cursor: pointer;
		  float: right;
		  margin: 10px;
		}
		.button:hover {
	 	 background-color: #babadb;
		}
	
	</style>
		<%
		//날짜 처리
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdt = new SimpleDateFormat("dd");
		//오늘날짜
		String today = sdt.format(cal.getTime());
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		ResultSet rset = null;
 		rset = stmt.executeQuery("SELECT cal.onemonth, DAYOFWEEK(cal.onemonth) AS DAY,"+
 				"ifnull((SELECT bookname FROM resortbook WHERE roomtype = 1 AND bookdate = cal.onemonth),'예약가능') AS 'VIP룸', "+
 				"IFNULL((SELECT bookname FROM resortbook WHERE roomtype = 2 AND bookdate = cal.onemonth),'예약가능') AS '일반룸', "+
 				"IFNULL((SELECT bookname FROM resortbook WHERE roomtype = 3 AND bookdate = cal.onemonth),'예약가능') AS '합리적인룸' "+
 				"from (   SELECT dt+ INTERVAL lv - 1 DAY onemonth "+
 				"from (SELECT ordinal_position lv, concat(DATE_FORMAT(NOW(), '%Y%m'),'"+today+"') dt "+
 				"FROM information_schema.COLUMNS "+
 				"WHERE table_schema = 'mysql' AND TABLE_NAME = 'user') a "+
 				"WHERE lv <= DAY(LAST_DAY(dt)) "+
 				")   cal;");

		%>
	</head>
	
	<body>
			<!-- 메인부분-->
			<div style="width:90%; margin: auto; text-align:center;">
			<h2 style="text-align:left;">현재 예약 상황</h2>

			<table>
				<tr style="background:#babadb; color:#56569c;">
					<td width=180>날 짜</td>
					<td width=150 >VIP룸</td>
					<td width=150>일반룸</td>
					<td width=150>합리적인룸</td>
				</tr>
			<% while(rset.next()){
				String available="";	
			%>
			<tr>
			<td><%=rset.getString(1) %></td> <!--날짜  -->
			<% available = rset.getString(3); //vip룸
				if (available.equals("예약가능")){%>
				<td><a class='booking' href="d_02_booking2_m.jsp?bookdate=<%=rset.getString(1) %>&roomtype=1"><%=available %></a></td>
			<%} else { %>
				<td><%=rset.getString(3) %></td>
			<%}
				available = rset.getString(4); //일반룸
				if (available.equals("예약가능")){%>
				<td><a class='booking' href="d_02_booking2_m.jsp?bookdate=<%=rset.getString(1) %>&roomtype=2"><%=available %></a></td>
			<%} else { %>	
				<td><%=rset.getString(4) %></td>
			<%}
				available = rset.getString(5); //합리적인룸	
				if (available.equals("예약가능")){%>
				<td><a class='booking' href="d_02_booking2_m.jsp?bookdate=<%=rset.getString(1) %>&roomtype=3"><%=available %></a></td>
			<%} else { %>
				<td><%=rset.getString(5) %></td>
				</tr>
			<%}
				};%>
			</table>
	</div>
	</body>
	
</html>