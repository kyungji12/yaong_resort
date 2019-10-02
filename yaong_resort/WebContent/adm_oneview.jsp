<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<!DOCTYPE html>
	<html>
	<head>
	<title>한 예약 상태</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script language="javascript">
////////예약자명 유효성 검사
		function checkName(bookname){
				var regExpName = /^[가-힣]{1,10}$/;
				if(regExpName.test(bookname)){
					return true;
				}else{
					return false;
				}	
		}
////////이메일 유효성 검사		
		function checkEmail(bookemail){
			var regExpEmail = /^[-!'#$%&*+./0-9=?A-Z^_a-z{|}~]+@[-!#$'%&*+/0-9=?A-Z^_a-z{|}~]+.[-!#$%&*+./0-9=?A-Z'^_a-z{|}~]+$/;
		      if(regExpEmail.test(bookemail)) { // test 는 정규 Methods 입니다. test는 변경없음
		        return true;
		      } else {
		        return false;
		      }
		}
////////핸드폰번호 유효성 검사		
		function checkPhone(bookphone){
		      var regExpPhone = /^\d{2,4}-\d{3,4}-\d{4}$/;
		      if(regExpPhone.test(bookphone)) { 
		        return true;
		      } else {
		        return false;
		      }
	    }
////////입금자명 유효성 검사
	    function checkPName(bookname2){
			var regExpPName = /^[가-힣]{1,10}$/;
			if(regExpPName.test(bookname2)){
				return true;
			}else{
				return false;
			}	
		}
////////////////////////////////////////////////////////////////////////////		
		function input_check(){ //form 안에 onsubmit='return input_check();'으로 넣기위한 함수
			var f = document.insert;//form의 name = insert
			
			if(f.bookname.value == ''){
				alert("이름을 입력하세요.");
				f.bookname.focus();
				return false;
			}else{
				if(!checkName(f.bookname.value)){
					alert('이름은 10자이내의 한글로 입력하세요');
					f.bookname.focus();
				 return false;
			      }	
			}
			
			////////////////////////////////////////////////////

			if(f.bookemail.value == '') {
			      alert('이메일 주소를 입력해 주십시오.');
			      f.bookemail.focus();
			      return false;
			    }
			    else {
			      if(!checkEmail(f.bookemail.value)) {
			        alert('이메일 주소를 바르게 입력해 주십시오.');
			        f.bookemail.focus();
			        return false;
			      }
			    }
			//////////////////////////////////////////

		    if(f.bookphone.value == '') {
		      alert('연락처를 입력해 주십시오.');
		      f.bookphone.focus();
		      return false;
		    }
		    else {
		      if(!checkPhone(f.bookphone.value)) {
		        alert('잘못된 전화번호입니다. 형식에 맞게 입력하세요.');
		        f.bookphone.focus();
		        return false;
		      }
		    }
		    /////////////////////////////////////////////////////

			if(f.bookname2.value == ''){
				alert("이름을 입력하세요.");
				f.bookname2.focus();
				return false;
			} else {
				if(!checkPName(f.bookname2.value)){
					alert('이름은 10자이내의 한글로 입력하세요');
					f.bookname2.focus();
				 return false;
			      }	
			}
			
		}
///////////////////////////////////////////////////////////////////////////////////		
		//전화번호에 자동'-'생성
		 function addCommas(x) {
		     return x.toString().replace(/\B(?=(\d{4})+(?!\d))/g, "-");
		 }
		 //모든 콤마 제거
		 function removeCommas(x) {
		     if(!x || x.length == 0) return "";
		     else return x.split("-").join("");
		 }
		 
		 $(document).ready(function(){
		 $('#bookphone').on("focus", function() {
			    var x = $(this).val();
			    x = removeCommas(x);
			    $(this).val(x);
			}).on("focusout", function() {
			    var x = $(this).val();
			    if(x && x.length > 0) {
			        if(!$.isNumeric(x)) {
			            x = x.replace(/[^0-9]/g,"");
			        }
			        x = addCommas(x);
			        $(this).val(x);
			    }
			}).on("keyup", function() {
			    $(this).val($(this).val().replace(/[^0-9]/g,""));
			}); 
		 });
		 
		 $(document).ready(function(){
				$("input, textarea").keyup(function(){
					var value = $(this).val();
					var arr_char = new Array();
					arr_char.push("'");
					arr_char.push("\"");
					arr_char.push("<");
					arr_char.push(">");
				
					for(var i=0 ; i<arr_char.length ; i++)	{
						if(value.indexOf(arr_char[i]) != -1)
						{	window.alert("<, >, ', \" 특수문자는 사용하실 수 없습니다.");
							value = value.substr(0, value.indexOf(arr_char[i]));
							$(this).val(value);		
						}
					}
				});
			});
		 
///////////////////////////////////////////////////////////////////////////////////////////
		</script>
	<style>
	/*메인 부분*/
		* {
		  box-sizing: border-box;
		}
		
		.row {
		  display: -ms-flexbox; /* IE10 */
		  display: flex;
		  -ms-flex-wrap: wrap; /* IE10 */
		  flex-wrap: wrap;
		  margin: 0 -16px;
		}
		
		.col-25 {
		  -ms-flex: 25%; /* IE10 */
		  flex: 25%;
		}
		
		.col-50 {
		  -ms-flex: 50%; /* IE10 */
		  flex: 50%;
		}
		
		.col-75 {
		  -ms-flex: 75%; /* IE10 */
		  flex: 75%;
		}
		
		.col-25,
		.col-50,
		.col-75 {
		  padding: 0 16px;
		}
		
		.bookingcontainer {
		  background-color: #f2f2f2;
		  padding: 5px 20px 15px 20px;
		  border: 1px solid lightgrey;
		  border-radius: 3px;
		}
		
		input {
		  width: 100%;
		  margin-bottom: 20px;
		  padding: 12px;
		  border: 1px solid #ccc;
		  border-radius: 3px;
		}
		
		label {
		  margin-bottom: 10px;
		  display: block;
		}
		
		.icon-container {
		  margin-bottom: 20px;
		  padding: 7px 0;
		  font-size: 24px;
		}
		
		.btn {
		  background-color: #babadb;
		  color: #56569c;
		  padding: 12px;
		  margin: 10px 0;
		  border: none;
		  width: 100%;
		  border-radius: 3px;
		  cursor: pointer;
		  font-size: 17px;
		  
		}
		
		.btn:hover {
		  background-color: #9797bf;
		  color: #ffffff;
		}
		
		a {
		  color: #2196F3;
		}
		
		hr {
		  border: 1px solid lightgrey;
		}
		
		span.price {
		  float: right;
		  color: grey;
		}
		
		/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
		@media (max-width: 800px) {
		  .row {
		    flex-direction: column;
		  } /*column-reverse: 컬럼의 레이아웃 방향을 반대로 바꾸는 것
		     그냥 column: 순방향, row, row-reverse도 있다.*/
		  .col-25 {
		    margin-bottom: 20px;
		  }
		}
		
	/*룸 타입용*/
		/*the container must be positioned relative:*/
		.custom-select {
		  position: relative;
		  font-family: Arial;
		}
		
		.custom-select select {
		  display: none; /*hide original SELECT element:*/
		}
		/*셀렉트박스 선택하기 전 색*/
		.select-selected {
		  background-color: #ffffff;
		  border-radius: 3px; /*셀렉트박스 둥근모서리*/
		  border-color: 
		}
		
		/*삼각형!*/
		.select-selected:after {
		  position: absolute;
		  content: "";
		  top: 14px;
		  right: 10px;
		  width: 0;
		  height: 0;
		  border: 6px solid transparent;  /*transparent: 투명*/
		  border-color: #bababd transparent transparent transparent; /*삼각형 색 & 테두리*/
		}
		
		/*셀렉트박스를 눌렀을때 삼각형이 위로 향하는 것 */
		.select-selected.select-arrow-active:after {
		  border-color: transparent transparent #bababd transparent;
		  top: 7px;
		}
		
		/*셀렉트박스 옵션 글씨:*/
		.select-items div,.select-selected {
		  color: black;
		  padding: 8px 16px;
		  border: 1px solid transparent; /*옵션 속 밑줄*/
		  border-color: rgba(0, 0, 0, 0.1); 
		  /*테두리중 밑줄만표시하려면 transparent transparent rgba(0, 0, 0, 0.1) transparent; */
		  cursor: pointer;
		  user-select: none;
		}
		
		/*셀렉트박스 옵션 색*/
		.select-items {
		  position: absolute;
		  background-color: #ffffff;
		  top: 100%;
		  left: 0;
		  right: 0;
		  z-index: 99;
		}
		
		/*hide the items when the select box is closed:*/
		.select-hide {
		  display: none;
		}
		
		.select-items div:hover, .same-as-selected {
		  background-color: rgba(0, 0, 0, 0.1);
		}

		</style>
		<%
		//날짜 처리
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdt = new SimpleDateFormat("dd");
		
		//변수 받아오기 from adm_allview.jsp
		String bookdate = request.getParameter("bookdate");
		//out.println(bookdate); //확인완료
		String roomtype = request.getParameter("roomtype");
		//out.println(roomtype); //확인완료
		
		//DB연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo14","root","ykj0112");
		Statement stmt = conn.createStatement();
		
		ResultSet rset = stmt.executeQuery("SELECT *from resortbook WHERE roomtype = '"+roomtype+"' AND bookdate ='"+bookdate+"';");
		
		String name = null;
		String email = null;
		String phone = null;
		String payname = null;
		int room = 0;
		int ppl = 0;
		String date = null;

		
		while (rset.next()){
			
			name = rset.getString(1);
			email = rset.getString(2);
			phone = rset.getString(3);
			payname = rset.getString(4);
			room = rset.getInt(5);
			ppl = rset.getInt(6);
			date = rset.getString(7);
		}
		
		%>
	</head>
	
	<body>
		<!-- 메인부분-->
		<div style="width:70%; margin: auto;">
			<h2 style="text-align:left;">예약 관리</h2>	
			<div class="row">
			  <div class="col-75">
			    <div class="bookingcontainer">
			      <form name="insert" onsubmit='return input_check();'  method="post" action="?contentPage=adm_update.jsp">
			      
			        <div class="row">
			          <div class="col-50">
			            <h3>예약자 정보</h3>
			            <label for="bookname"><i class="fa fa-user"></i> 예약자명</label>
			            <input type="text" id="bookname" name="bookname" value='<%=name%>'required>
			            <label for="bookemail"><i class="fa fa-envelope"></i> 이메일</label>
			            <input type="text" id="bookemail" name="bookemail" value='<%=email%>' required>
			            <label for="bookphone"><i class="fa fa-address-card-o"></i> 핸드폰 번호</label>
			            <input type="text" id="bookphone" name="bookphone" value='<%=phone%>' required>
			          </div>
			
			          <div class="col-50">
			            <h3>예약 사항</h3>
			            <label for=bookname2>입금자명</label>
			            <input type="text" id="bookname2" name="bookname2" value='<%=payname%>' required>
			            <label for="bookdate">예약일</label>
			            <input  type="date" id="bookdate" name="bookdate" value='<%=date%>' required>
			            <input type="hidden" name="oldbookdate" value='<%=bookdate %>'> <!-- 기존 예약일 값 넘겨줘야 수정할 쿼리에서 검색가능 -->
			            <div class="row">
			             <div class="col-50">
			                <label for="roomtype">룸 타입 <span style="color:grey;font-size:0.8em;">(1:vip, 2:일반, 3:합리적 )</span></label>
			                <input  min='1'max='3'type="number" id="roomtype" name="roomtype" value='<%=room %>' required>
			                <input type="hidden" name="oldroomtype" value='<%=roomtype %>'><!-- 기존 방타입 값 넘겨줘야 수정할 쿼리에서 검색가능 -->
			              </div> 
			              <div class="col-50">
			                <label for="cvv">인원</label>
			                <input  min='1' max='6'type="number" id="bookppl" name="bookppl" value='<%=ppl %>' required>			                
			              </div>
			            </div>
			          </div>
			          
			        </div>
			        <br><br>
			        <button type="button" class="btn" onclick="location.href='?contentPage=adm_allview.jsp'">목록</button> 
			        <input type="submit" value="수정하기" class="btn">
			        <button type="button" class="btn" onclick="location.href='?contentPage=adm_delete.jsp?bookdate=<%=date %>&roomtype=<%=room %>'">삭제</button>
			      </form>
			    </div>
			  </div>
			</div> <br><br><br><br><br>
	</div>
		
		
		
		
	<!-- Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon -->
	<script>
	//메인부분 select box
	var x, i, j, selElmnt, a, b, c;
	/*look for any elements with the class "custom-select":*/
	x = document.getElementsByClassName("custom-select");
	for (i = 0; i < x.length; i++) {
	  selElmnt = x[i].getElementsByTagName("select")[0];
	  /*for each element, create a new DIV that will act as the selected item:*/
	  a = document.createElement("DIV");
	  a.setAttribute("class", "select-selected");
	  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	  x[i].appendChild(a);
	  /*for each element, create a new DIV that will contain the option list:*/
	  b = document.createElement("DIV");
	  b.setAttribute("class", "select-items select-hide");
	  for (j = 1; j < selElmnt.length; j++) {
	    /*for each option in the original select element,
	    create a new DIV that will act as an option item:*/
	    c = document.createElement("DIV");
	    c.innerHTML = selElmnt.options[j].innerHTML;
	    c.addEventListener("click", function(e) {
	        /*when an item is clicked, update the original select box,
	        and the selected item:*/
	        var y, i, k, s, h;
	        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
	        h = this.parentNode.previousSibling;
	        for (i = 0; i < s.length; i++) {
	          if (s.options[i].innerHTML == this.innerHTML) {
	            s.selectedIndex = i;
	            h.innerHTML = this.innerHTML;
	            y = this.parentNode.getElementsByClassName("same-as-selected");
	            for (k = 0; k < y.length; k++) {
	              y[k].removeAttribute("class");
	            }
	            this.setAttribute("class", "same-as-selected");
	            break;
	          }
	        }
	        h.click();
	    });
	    b.appendChild(c);
	  }
	  x[i].appendChild(b);
	  a.addEventListener("click", function(e) {
	      /*when the select box is clicked, close any other select boxes,
	      and open/close the current select box:*/
	      e.stopPropagation();
	      closeAllSelect(this);
	      this.nextSibling.classList.toggle("select-hide");
	      this.classList.toggle("select-arrow-active");
	    });
	}
	function closeAllSelect(elmnt) {
	  /*a function that will close all select boxes in the document,
	  except the current select box:*/
	  var x, y, i, arrNo = [];
	  x = document.getElementsByClassName("select-items");
	  y = document.getElementsByClassName("select-selected");
	  for (i = 0; i < y.length; i++) {
	    if (elmnt == y[i]) {
	      arrNo.push(i)
	    } else {
	      y[i].classList.remove("select-arrow-active");
	    }
	  }
	  for (i = 0; i < x.length; i++) {
	    if (arrNo.indexOf(i)) {
	      x[i].classList.add("select-hide");
	    }
	  }
	}
	/*if the user clicks anywhere outside the select box,
	then close all select boxes:*/
	document.addEventListener("click", closeAllSelect);
	</script>
	</body>
</html>