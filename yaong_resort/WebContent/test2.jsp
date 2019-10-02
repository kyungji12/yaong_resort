<meta http-equiv="Content-Type" content="text/8html; charset=utf-8" />
<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.*" %>
<%@ page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>달력</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	* {box-sizing: border-box;}
	ul {list-style-type: none;}
	body {font-family: Verdana, sans-serif;}
	
	.container {
	  padding-right: 15px;
	  padding-left: 15px;
	  margin-right: auto;
	  margin-left: auto;
	}
	.month {
	  padding: 30px 25px;
	  width: 100%;
	  background: #babadb;
	  text-align: center;
	}
	
	.month ul {
	  margin: 0;
	  padding: 0;
	}
	
	.month ul li {
	  color: white;
	  font-size: 20px;
	  text-transform: uppercase;
	  letter-spacing: 3px;
	}
	
	/*.month .prev {
	  float: left;
	  padding-top: 10px;
	}
	
	.month .next {
	  float: right;
	  padding-top: 10px;
	}*/
	
	.weekdays {
	  margin: 0;
	  padding: 10px 0;
	  background-color: #ddd;
	}
	
	.weekdays li {
	  display: inline-block;
	  width: 13.6%;
	  color: #666;
	  text-align: left;
	}
	
	.days {
	  padding: 10px 0;
	  background: #eee;
	  margin: 0;
	  
	}
	
	.days li { /*날짜*/
	  list-style-type: none;
	  display: inline-block;
	  width: 13.6%;
	  text-align: left;
	  padding-bottom: 20px;
	  font-size:12px;
	  color: #777;
	  border:1px solid #babadb;
	}
	
	.days li .active { /*오늘 날짜 선택*/
	  padding: 5px;
	  background: #9999ff;
	  color: white !important
	}
	
	/* Add media queries for smaller screens */
	@media screen and (max-width:720px) {
	  .weekdays li, .days li {width: 13.1%;}
	}
	
	@media screen and (max-width: 420px) {
	  .weekdays li, .days li {width: 12.5%;}
	  .days li .active {padding: 2px;}
	}
	
	@media screen and (max-width: 290px) {
	  .weekdays li, .days li {width: 12.2%;}
	}
	</style>
	<%
	int year;
	int month;
	int date;
	
	List<String> yearList = new ArrayList<String>();
	//날짜 처리
	Calendar cal = Calendar.getInstance();
	
	year = cal.get(Calendar.YEAR);
	//out.println(year); //확인완료
	month = cal.get(Calendar.MONTH)+1;
	//out.println(month); //확인완료
	date = cal.get(Calendar.DATE);
	//out.println(date); //확인완료
	
	
	
	
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
	
	<h1>CSS Calendar</h1>
	<div class="container">
	<div class="month">      
	  <ul>
	    <!--<li class="prev">&#10094;</li>
	    <li class="next">&#10095;</li> -->
	    <li><%=year %></li>
	  </ul>
	</div>
	
	<ul class="weekdays">
	  <li>Su</li>
	  <li>Mo</li>
	  <li>Tu</li>
	  <li>We</li>
	  <li>Th</li>
	  <li>Fr</li>
	  <li>Sa</li>
	</ul>
	
	<ul class="days">  
	 <% while(rset.next()){
				String available="";
				String day=rset.getString(1).substring(5,10).replace("-","/");
				//"YYYY-MM-DD"형태 → "MM-DD"로, 그리고 -를 /로 대체
				int yoil2 = rset.getInt(2);
				String yoil = "";
				if(yoil2 == 1){
					yoil = "일";
				}else if (yoil2 == 2){
					yoil = "월";
				}else if (yoil2 == 3){
					yoil = "화";
				}else if (yoil2 == 4){
					yoil = "수";
				}else if (yoil2 == 5){
					yoil = "목";
				}else if (yoil2 == 6){
					yoil = "금";
				}else if (yoil2 == 7){
					yoil = "토";
				}
	%>
	 	<li><%=day+" <span style='color:red;'>"+yoil+"</span><br><br>"+
	
	 			"VIP룸: <a style='decoration:none;'href='d_02_booking2.jsp?bookdate="+rset.getString(1)+"&roomtype='1'>"+rset.getString(3)+"</a>"+"<br><br>"+
	 			
	 			"일반룸: <a style='decoration:none;'href='d_02_booking2.jsp?bookdate="+rset.getString(1)+"&roomtype='1'>"+rset.getString(4)+"</a>"+"<br><br>"+
	 			
	 			"합리룸: <a style='decoration:none;'href='d_02_booking2.jsp?bookdate="+rset.getString(1)+"&roomtype='1'>"+rset.getString(5)+"</a>"	%></li>	
	 <%		
	 		
	 		
	 		
	 		
	 		
	 	}
	 %>
<!-- 	  <li><span class="active">10</span></li> -->
	</ul>
	</div>
	</body>
</html>
