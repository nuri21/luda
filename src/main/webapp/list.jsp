<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>  
<%@ page import="board.Board" %>  
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setPropertyname="user" property="userID" />    
<jsp:setPropertyname="user" property="userName" />     
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>일정 목록</title>
<style>
@font-face {
    font-family: 'Pretendard-Light';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Light.woff') format('woff');
    font-weight: 300;
    font-style: normal;
}
body {font-family: Pretendard-Light;
padding-top:25px;
padding-left: 20px;
box-sizing: border-box;}
a. a:hover {
	color: #000000;
	text-decoration: none;
}

</style>
</head>
<body>

	<%
		String userID = null;
	
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");
		}
		int pageNumber = 1 ; 
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if (userID == null) {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('로그인이 필요합니다.')");
		   script.println("location.href = 'login.jsp'");
		   script.println("</script>");  
		}

		
	%>

<div class="container mt-3">
  <h2>목록보기</h2>
	<p>탭을 클릭하시면 작성한 일정, 다이어리를 확인할 수 있습니다.</p>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#Calendar">Calendar</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#Diary">Diary</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="Calendar" class="container tab-pane active"><br>
      <table class="table table-striped" style="text-align:center; border: 1px solid #dddddd; overflow: hidden;">
		  <thead>
		    <tr>
		  	<th style="backgroud-color:#eeeeee; text-aligin:center;">번호</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">시작일</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">종료일</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">내용</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">작성일</th>
		    </tr>
		   </thead>
		   <tbody>
		   <%
		   	BoardDAO boardDAO = new BoardDAO();
		   	ArrayList<Board> list = boardDAO.find(userID);
		   	for(int i = 0; i<list.size(); i++) {
		   %>
		   <tr>
		   		<td><%=list.get(i).getIndex() %></td>
		   		<td><%=list.get(i).getStartDate() %></td>
		   		<td><%=list.get(i).getEndDate() %></td>
		   		<td><a href="view.jsp?index=<%=list.get(i).getIndex()%>"><%=list.get(i).getContent() %></a></td>
		   		<td><%= list.get(i).getWriteDate().substring(0, 11) + list.get(i).getWriteDate().substring(11, 13) + "시" + list.get(i).getWriteDate().substring(14, 16) + "분" %></td> 
		   		</tr>
		   		<% } %>
		   </tbody>
		</table>
			<%
				if(pageNumber !=1) {
			%>	
				<a href="list.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-outline-primary btn-arraw-left">이전</a>
			<% 	
				} if (boardDAO.nextPage(pageNumber)) {
			%>	
				<a href="list.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-outline-primary btn-arraw-left">다음</a>
			<% 			
				}
			%>
    </div>
    <div id="Diary" class="container tab-pane fade"><br>
            <table class="table table-striped" style="text-align:center; border: 1px solid #dddddd; overflow: hidden;">
		  <thead>
		    <tr>
		  	<th style="backgroud-color:#eeeeee; text-aligin:center;">번호</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">이미지</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">내용</th>
		    <th style="backgroud-color:#eeeeee; text-aligin:center;">작성일</th>
		    </tr>
		   </thead>
		   <tbody>
		
		   <tr>
		   		<td>1</td>
		   		<td>이미지</td>
		   		<td>어쩌구저쩌구</td>
		   		<td>7월 28일 오후 12시</td> 
		   		</tr>	
		   </tbody>
		</table>	
    </div>
  </div>
</div>

</body>
</html>