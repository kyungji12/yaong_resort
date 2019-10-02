<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Calendar" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
	<html>
	<head>
	<title>이용자 리뷰</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
	/*메인 부분*/
			/*리뷰테이블  */
		table {
		  border-collapse: collapse;
		  width: 100%;
		  border: 1px solid #ccccdb;
		}
		th, td {
		  text-align: center;
		  padding: 2px;
		  border: 1px solid #ccccdb;
		  font-size: 0.85em;
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
		  float: center;
		  padding: 8px 16px;
		  text-decoration: none;
		  transition: background-color .3s;
		  text-align:center;
		}
		.pagination{align: center;}
		.pagination a.active {
		  background-color: #a2a2db;
		  color: white;
		}
		
		.pagination a:hover:not(.active) {background-color: #ddd;}

		</style>
<!------------------------------------------------------------------------------------------>		
		<%
	//try{
		//날짜 처리 
		Calendar cal = Calendar.getInstance();	
		SimpleDateFormat sdt = new SimpleDateFormat("YYYY-MM-dd");
		
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
/////////////////////////////////////////////////////////////////////////////////////////////
		//자료 읽어오기용 변수
		int LineCnt = 0;
		int fromNum = 0;
		int toNum = 0;
		int toCnt = 0; 
		String fromTemp;
		String toTemp;
		
		//값 받기
	    fromTemp = request.getParameter("from"); //from이라는 이름은 내가 지정해준 것 
		toTemp = request.getParameter("cnt"); //몇개까지 값을 받았는지.
		
		//최초에 받은 값이 없을 때
	    if(fromTemp == null && toTemp == null){
	        fromNum = 1; //제일 처음 값
	        toCnt = 10;
	    }else{  //(만약 받은 값이 있다면)페이지 이동 번호를 눌렀다면 그 값을 페이지 이동 값으로 보내줘야함
	        fromNum = Integer.parseInt(fromTemp); //받은 String값을 Int값으로
	    	toCnt = Integer.parseInt(toTemp);
	    }toNum = fromNum + toCnt;
		
		//페이지네이션용 변수
		final int firstPage_firstNum = 1; //맨 첫 페이지의 번호 
		int firstNum = 1; //각 페이지의 첫 항목의 번호 
	    int prevPage_firstNum = 0; //이전 페이지용 
	    int nextPage_firstNum = 0; //다음 페이지용
	    int lastPage_firstNum = 0; //마지막 페이지용
	    int totalLineCnt = 0; //데이터의 전체 라인 수 (마지막 페이지용)
	    
	    //페이지네이션용 자료 읽기
	    ResultSet rset2 = stmt.executeQuery("select * from resortreview;");
		while(rset2.next()){
			totalLineCnt++; //총 게시물의 수
		}
		//각 페이지의 첫 번째 링크 숫자
	    String getFirstLink = request.getParameter("sendFirstLink");
	    if(getFirstLink != null){
	        firstNum = Integer.parseInt(getFirstLink);
	    }
	    //마지막p 첫 링크 번호 구하기 (총라인 몇개 산정하고 식을 도출해내는 식으로 구함)
	    //lastPage_firstNum = ((int)(totalLineCnt/100)*10)+1;
	    //if (totalLineCnt == 100) lastPage_firstNum = 1; //위의 식에서 나올 오류의 예외처리용

	    //페이지 이동
	    prevPage_firstNum = firstNum-10; //<용
	    nextPage_firstNum = firstNum+10; //>용
	    
////////////////////////////////////////////////////////////////////////////////////////////		
		//값 읽어오기
		ResultSet rset = stmt.executeQuery("select id, relevel, title, date, viewcnt, name, rootid from resortreview order by rootid desc, relevel asc;");
		
		
		%>
		
		
	</head>
	
	<body>
		<!-- 메인부분-->
		<div style="width:100%; margin: auto; text-align:center;">
			<h2 style="text-align:left;">이용자 후기</h2>
			<table>
				<tr style="background:#babadb; color:#56569c;">
					<td width=65>번호</td>
					<td width=440>제목</td>
					<td width=100>글쓴이</td>
					<td width=90>조회수</td>
					<td width=130>등록일</td>
				</tr>
			<%
			while(rset.next()){
				LineCnt++;	
				if(LineCnt < fromNum){continue;}
	              if(LineCnt >= toNum){break;}
	            out.println("<tr>");
	            out.println("<td>"+rset.getInt(1)+"</td>");
	            out.println("<td style='text-align:left;'>"); //제목시작
	            String relevel = rset.getString(2);
	            int relevellength = relevel.length() ; //relevellength=0 : 원글
	            if(relevellength != 0){ //원글이 아니라면
	               while(relevellength != 0) {
	                  out.print("　"); 	//한칸씩 밀려서 답글의 제목이 달린다. 
	                  relevellength --;
	               }
	               out.print("└RE: "); //답글이 달렸을 경우에는 제목 앞에 [RE]로 표시한다.
	            }
				out.println("<a class='title' href=e_02_review_view_m.jsp?id="+rset.getInt(1)+">"+rset.getString(3)+"</a>");
				if(sdt.format(cal.getTime()).equals(rset.getString(4))){
					//오늘날짜를 구해와서 그것이 rset.getString(4)인 column 'date'와 일치할 경우
					out.println("<img src='./image/new.jpg'>"); //새 글이 올라왔을 경우에는 'new'image를 제목 뒤에 붙인다. 
				}
				out.println("</td>"); //제목 끝
				out.println("<td>"+rset.getString(6)+"</td> "); //글쓴이
				out.println("<td>"+rset.getInt(5)+"</td> "); //조회수
				out.println("<td>"+rset.getDate(4)+"</td>"); //등록일
				out.println("</tr>");
			}
			rset.close();
			stmt.close();
			conn.close();
			%>
			</table>
			<table >
			<tr>
				<td style="border-color:#f1f1f1;text-align:right;"><button class="button" type="button" onclick="location.href='e_02_review_insert_m.jsp'">글쓰기</button></td>				
			</tr>
			</table>
			<!--페이지  -->
			<br>
			<div class="pagination">
			<%if(firstNum != 1){%>
			  <a href="e_02_review_m.jsp?sendFirstLink=<%=firstPage_firstNum%>">&laquo;</a>
<!-- 			  <a href="#">1</a> -->
<!-- 			  <a class="active" href="#">2</a> -->
<!-- 			  <a href="#">3</a> -->
<!-- 			  <a href="#">4</a> -->
<!-- 			  <a href="#">5</a> -->
<!-- 			  <a href="#">6</a> -->
			 <%}%>
			 <%-- 10쪽씩만 보이도록 처리 --%>
		       <%
                   for(int i=firstNum; i<firstNum+10; i++){
                       //더이상 나올 데이터가 없을 경우 페이지 번호도 보이지 않는다
                       if((i*10)-9 > totalLineCnt) break;
                       out.print("<td>");
                       out.print("<a href=e_02_review_m.jsp?sendFirstLink="+firstNum+"&from="+((i*10)-9)+"&cnt=10>"+i+"</a>");
                       out.print("</td>");
                   }
               %>
			   <%if((firstNum+9)*10 < totalLineCnt){%>
			  <a href="e_02_review_m.jsp?sendFirstLink=<%=lastPage_firstNum%>&from=<%=lastPage_firstNum*10-9%>&cnt=10">&raquo;</a>
				 <%}%>
			</div>			
		</div>
	</body>
</html>