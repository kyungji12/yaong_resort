<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Calendar" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
	<html>
	<head>
	<title>관리자 로그인</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	/*메인 부분*/
		/*공지테이블  */
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
		/*버튼  */
		.button {
		  background:#babadb;
		  border: none;
		  color:#56569c;
		  padding: 6px 16px;
		  text-align: center;
		  text-decoration: none;
		  display: inline-block;
		  margin: 4px 2px;
		  cursor: pointer;
		  border-radius: 16px;
		}
		
		/*페이지네이션  */
		.pagination a {
		  color: black;
		  float: left;
		  padding: 8px 16px;
		  text-decoration: none;
		  transition: background-color .3s;
		}
		.pagination{align: center;}
		.pagination a.active {
		  background-color: #a2a2db;
		  color: white;
		}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}
		
		/*로그인*/
		/* style the container */
		.admincontainer {
		  position: relative;
		  border-radius: 5px;
		  background-color: #f2f2f2;
		  padding: 50px;
		} 
		
		/* style inputs and link buttons */
		input,
		.btn {
		  width: 30%;
		  padding: 12px;
		  border: none;
		  border-radius: 4px;
		  margin: 5px 0;
		  opacity: 0.85;
		  display: inline-block;
		  font-size: 17px;
		  line-height: 20px;
		  text-decoration: none; /* remove underline from anchors */
		}
		
		input:hover,
		.btn:hover {
		  opacity: 1;
		}
		
		/* style the submit button */
		input[type=submit] {
		  background-color: #babadb;
		  color: #56569c;
		  cursor: pointer;
		}
		
		input[type=submit]:hover {
		  background-color: #9797bf;\
		  
		}
		
		/* Two-column layout */
		.col {
		  float: center;
		  width: 80%;
		  margin: auto;
		  padding: 0 50px;
		  margin-top: 6px;
		 
		}
		
		/* Clear floats after the columns */
		.row:after {
		  content: "";
		  display: table;
		  clear: both;
		}
		
		
		/* hide some text on medium and large screens */
		.hide-md-lg {
		  display: none;
		}
		
		/* Responsive layout - when the screen is less than 650px wide, make the two columns stack on top of each other instead of next to each other */
		@media screen and (max-width: 650px) {
		  .col {
		    width: 100%;
		    margin-top: 0;
		  }
		  /* show the hidden text on small screens */
		  .hide-md-lg {
		    display: block;
		    text-align: center;
		  }
		}

		</style>
		
	</head>
	
	<body>
		
	<!-- 메인부분-->
		<br>
		<div class="admincontainer">
		  <form method="post"action="adm_loginck.jsp">
		   <div class="row">
		   <br><br><br><br><br><br>
		      <h2 style="text-align:center">관리자 로그인</h2>
			      <div class="col">					
			        <input type="text" name="id" placeholder="Username" required>
			        <input type="password" name="pw" placeholder="Password" required>
			        <input type="submit" value="Login">
			      </div>
			      
		    </div>
		  </form>
		</div>
		
		
					
		<br><br><br><br><br><br>

	</body>
</html>