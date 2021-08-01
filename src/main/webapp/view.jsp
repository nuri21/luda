<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>    
<%@ page import="board.Board"%> 
<%@ page import="board.BoardDAO"%>     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<style>
	   
   @font-face {
    font-family: 'Pretendard-Light';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Light.woff') format('woff');
    font-weight: 300;
    font-style: normal;
	}
	body {
		font-family: 'Pretendard-Light';
	} 
	
	* {
	  box-sizing: border-box;
	}
	
	#datepicker1, #datepicker2, #dateContent {
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
	
	input[type=button] {
	  color: black;
	  padding-left: 3px;
	  padding-right: 3px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  float: right;
	}
	
	.container {
	  border-radius: 5px;
	  background-color: #f7f7f7;
	  padding: 20px;
	}
	
	.col-25 {
	  float: left;
	  width: 25%;
	  margin-top: 6px;
	}
	
	.col-75 {
	  float: left;
	  width: 75%;
	  margin-top: 6px;
	}
	
	/* Clear floats after the columns */
	.row:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	@media screen and (max-width: 600px) {
	  .col-25, .col-75, input[type=button] {
	    width: 100%;
	    margin-top: 0;
	  }
	}
	</style>
	<title>상세보기</title>
</head>
<body>

	<%
		String userID = null;
		String userName = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String)session.getAttribute("userID");
		}
		
		int index = 0;
		if (request.getParameter("index") != null) {
			index = Integer.parseInt(request.getParameter("index"));
		}
		
		if (index == 0) {
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('유효하지 않은 일정입니다.')");
			   script.println("location.href = 'list.jsp'");
			   script.println("</script>");  
		}
		
		Board board = new BoardDAO().getBoard(index);
		
	%>
	
	
	<div class="container">
	  <div class="row">
	    <input type="button" value="X" onClick="window.close()">
	  </div>
	  <div class="row">
	  	 <div class="col-25">
	      <label for="fname">작성시각</label>
	    </div>
	    <div class="col-75">
	    <div id="datepicker1" name="writeDate">
	      <%= board.getWriteDate() %>
	    </div>
	  </div>
	    <div class="col-25">
	      <label for="fname">시작일</label>
	    </div>
	    <div class="col-75">
	      <div id="datepicker1" name="startDate">
	      <%= board.getStartDate() %>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="lname">종료일</label>
	    </div>
	    <div class="col-75">
	      <div id="datepicker2" name="EndDate">
	      <%= board.getEndDate() %>
	    </div>
	  </div>
	  <div class="row">
	    <div class="col-25">
	      <label for="subject">내용</label>
	    </div>
	    <div class="col-75">
	      <div id="dateContent" name="content" style="height:100px">
	       <%= board.getContent() %>
	    </div>
	  </div>
	</div>
</div>
</div>
</div>
</body>
</html>