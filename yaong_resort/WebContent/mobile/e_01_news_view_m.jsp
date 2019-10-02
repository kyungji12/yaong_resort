<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
	<head>
	<title>소식 읽기</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<style>/*리뷰테이블  */
		table {
		  border-collapse: collapse;
		  width: 100%;
		  border: 1px solid #ccccdb;
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
		a.title{
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
	
		/* 하단부분*/
		.footer {
		left: 0;
		bottom: 0;
		width: 100%;
		max-width: 1200px;
		background-color: #a2a2db;
		color: white;
		}
		.footer > p{
		font-size:12px;
		}
	</style>
	<%
	//try{
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
	
		//e_02_review.jsp에서 값 받아오기
		String reviewid = request.getParameter("id");
		int reviewID = Integer.parseInt(reviewid);
		
		//String srootid = request.getParameter("rootid");
		
		//글 조회수
		stmt.execute("update resortnews set viewcnt=(viewcnt+1) where id = "+reviewID+";");
						
		//값 읽어오기
		ResultSet rset = stmt.executeQuery("select * from resortnews where id ="+reviewID+";");
	%>
	<%!
		String newsid = "";
	
	%>
	
	</head>
	
	<body><!-- 메인부분-->
			<%
			while(rset.next()){
				out.println("<div class='viewcontainer'>");
				out.println("<form method='post' name='form'>"); //enctype='multipart/form-data'
				out.println("<input type='hidden' value='"+rset.getInt(1)+"' name='newsid'>");
				newsid=Integer.toString(rset.getInt(1));
				out.println("<h3>"+rset.getString(2)+"</h3>"); //title:input으로 넘기고싶을때는<input type='text' style='border:0' readonly name='reviewtitle' value='"+rset.getString(2)+"'>
				out.println("<p>작성자: "+rset.getString(6)+"</p>"); //name
				out.println("<p>등록일: "+rset.getDate(3)+"</p>"); //date
				out.println("<p>조회수: "+rset.getInt(5)+"</p>"); //viewcnt
				out.println("<hr class='new3'>"); 
				out.println("<p style='height:200px;'>"+rset.getString(4)+"</p>"); //content
				if (rset.getString(7) == null || rset.getString(7).equals("null")){
					out.println(" ");
				}else{
					out.println("<img height=150px src='image/"+rset.getString(7)+"'>");
				}
				out.println("<hr class='new3'>");
			}
			%>
				<div class="row">
					
					<button class="button" type="button" onclick="location.href='e_01_news_m.jsp'">목록</button>

			<%
 			String onlogin = null;
			onlogin = (String)session.getAttribute("onlogin");
			if(onlogin == null || !onlogin.equals("yes")){
			
			}else{%>
					
					<button class="button" type="button" onclick="location.href='?e_01_news_delete_m.jsp?id=<%=newsid%>'">삭제</button>
					<input type="submit" value="수정" formaction='e_01_news_update_m.jsp'>
					<%} %>					
				</div>
			</form>
			</div>		
	</body>
	
</html>