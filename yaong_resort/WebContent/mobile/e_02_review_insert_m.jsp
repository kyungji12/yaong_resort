<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.text.SimpleDateFormat,java.util.Calendar" %>
<%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
	<head>
	<title>후기 쓰는 폼</title>
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
	
	.insertcontainer {
	  border-radius: 5px;
	  background-color: #f2f2f2;
	  padding: 10px;
	}
	
	.col-25 {
	  float: left;
	  width: 18%;
	  margin-top: 6px;
/* 	  text-align:center; */
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
	<script> 
////////글쓴이 이름 유효성 검사
	function checkName(name){
			var regExpName = /^[가-힣]{1,10}$/;
			if(regExpName.test(name)){
				return true;
			}else{
				return false;
			}	
	}
	function input_check(){ //form 안에 onsubmit='return input_check();'으로 넣기위한 함수
		var f = document.insert;//form의 name = insert
		
		if(f.name.value == ''){
			alert("이름을 입력하세요.");
			f.name.focus();
			return false;
		}else{
			if(!checkName(f.name.value)){
				alert('이름은 10자이내의 한글로 입력하세요');
				f.name.focus();
			 return false;
		      }	
		}
	}
	/*첨부파일  */
	$(function() {
        $("#imgInp").on('change', function(){
            readURL(this);
        });
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            }
          reader.readAsDataURL(input.files[0]);
        }
    }
	</script>
	
	</head>
	
	<body>
	<!-- 메인부분-->
			<h2>후기 작성</h2>
			<p style="font-size:0.85em;">후기를 작성해주신 고객님 중 세분을 선정하여 매달 소정의 선물을 드리고있습니다. 많은 참여 바라겠습니다 :)</p>
			<hr class="new3">
			<div class="insertcontainer">
			<form name="insert" onsubmit='return input_check();' method="post" action="e_02_review_write_m.jsp" enctype="multipart/form-data">
				<div class="row">
			      <div class="col-25">
			        <label for="title">제목</label>
			      </div>
			      <div class="col-75">
			        <input type="text" id="title" maxlength="50" name="reviewtitle" required placeholder="제목을 입력해주세요.">
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-25">
			        <label for="name">성함</label>
			      </div>
			      <div class="col-75">
			        <input type="text" id="name" name="reviewname" maxlength="20" required placeholder="성함을 입력해주세요.">
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-25">
			        <label for="country">이용 객실</label>
			      </div>
			      <div class="col-75">
			        <select id="roomtype" name="reviewroomtype">
			          <option value="viproom">VIP룸</option>
			          <option value="standardroom">일반룸</option>
			          <option value="fairroom">합리적인룸</option>
			        </select>
			      </div>
			    </div>
			    <div class="row">
			      <div class="col-25">
			        <label for="reviewcontent">내용</label>
			      </div>
			      <div class="col-75">
			        <textarea id="reviewcontent" name="reviewcontent" maxlength="500" required placeholder="최대 500자까지만 입력가능합니다." style="height:200px"></textarea>
			      </div>
			    </div>
			    <div class="row">
			    	<div class="col-25">
			        <label for="file">사진첨부</label>
			      </div>
			      <div class="col-75">
			        <input type="file" id="imgInp" name="reviewfile" />
			        <img id="blah" src="#" alt="이미지 미리보기" />
			      </div>
			    </div>
			    <div class="row">
			      <input type="submit" value="등록">
			      <button class="button" type="button" onclick="location.href='e_02_review_m.jsp'">취소</button>
			    </div>
			</form>
			</div>
	
	</body>
	
</html>