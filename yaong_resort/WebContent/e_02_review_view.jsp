<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>후기 읽기</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
/*후기 쓰기 */
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
	
	.viewcontainer {
	  border-radius: 5px;
	  background-color: #f2f2f2;
	  padding: 20px;
	}
	
	.col-75 {
	  float: left;
	  width: 100%;
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

		/*리뷰테이블  */
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
		//글 조회수
		stmt.execute("update resortreview set viewcnt=(viewcnt+1) where id = "+reviewID+";");		
		//값 읽어오기
		ResultSet rset = stmt.executeQuery("select * from resortreview where id ="+reviewID+";");
	%>
	<%!
		String reviewid = "";
	%>
	</head>
	<body>
			<%
			while(rset.next()){
				out.println("<div class='viewcontainer'>");
				out.println("<form method='post' name='form'>"); //enctype='multipart/form-data'
				out.println("<input type='hidden' value='"+rset.getInt(1)+"' name='reviewid'>");
				reviewid=Integer.toString(rset.getInt(1));
				//out.println(reviewid); //삭제할 id 확인완료 
				out.println("<h3>"+rset.getString(2)+"</h3>"); //title:input으로 넘기고싶을때는<input type='text' style='border:0' readonly name='reviewtitle' value='"+rset.getString(2)+"'>
				out.println("<p> 작성자: "+rset.getString(5)+"</p>"); //name
				out.println("<p> 등록일: "+rset.getDate(3)+"</p>"); //date
				out.println("<p> 조회수: "+rset.getInt(6)+"</p>"); //viewcnt
				out.println("<hr class='new3'>"); 
				out.println("<p style='height:200px;'>"+rset.getString(4)+"</p>"); //content
				if (rset.getString(9) == null || rset.getString(9).equals("null")){
					out.println(" ");
				}else{
					out.println("<img height=150px src='image/"+rset.getString(9)+"'>");
				}
				out.println("<hr class='new3'>");
			}
			%>
				<div class="row">
					<button class="button" type="button" onclick="location.href='?contentPage=e_02_review_delete.jsp?id=<%=reviewid %>'">삭제</button>
					<input type="submit" value="수정" formaction='?contentPage=e_02_review_update.jsp'>
					<input type="submit" value="답글" formaction='?contentPage=e_02_review_reinsert.jsp'>
					<button class="button" type="button" onclick="location.href='?contentPage=e_02_review.jsp'">목록</button>					
				</div>
			</form>
			</div>
	</body>
</html>