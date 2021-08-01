<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.BoardDAO" %>  
<%@ page import="board.Board" %>  
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setPropertyname="user" property="userID" />       
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
		
		if (userID == null) {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('로그인이 필요합니다.')");
		   script.println("location.href = 'login.jsp'");
		   script.println("</script>");  
		}
		
		
		int pageSize = 10; // 한 페이지에 출력할 레코드 수

		// 페이지 링크를 클릭한 번호 / 현재 페이지
		String pageNumber = request.getParameter("pageNumber");
		if (pageNumber == null){ // 클릭한게 없으면 1번 페이지
			pageNumber = "1";
		}
		// 연산을 하기 위한 pageNumber 형변환 / 현재 페이지
		int currentPage = Integer.parseInt(pageNumber);

		// 해당 페이지에서 시작할 레코드 / 마지막 레코드
		int startRow = ((currentPage - 1) * 10);
		int endRow = currentPage * pageSize;
		
		BoardDAO boardDAO = new BoardDAO();
		ArrayList<Board> list = boardDAO.getList(userID, startRow);
		int count = boardDAO.getCount(userID);
		
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
				for(int i = 0; i<list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getIndex() %></td>
		   		<td><%=list.get(i).getStartDate() %></td>
		   		<td><%=list.get(i).getEndDate() %></td>
		   		<td><a href="view.jsp?index=<%=list.get(i).getIndex()%>"><%=list.get(i).getContent() %></a></td>
		   		<td>
		   			<%= list.get(i).getWriteDate().substring(0, 11) + list.get(i).getWriteDate().substring(11, 13) + ":" + list.get(i).getWriteDate().substring(14, 16)%>
	   			</td>
	   		</tr>
		   	<% } %>
		   	
		   	<tr>
				<td colspan="6" align="center">
					<%	// 페이징  처리
						if(count > 0){
							// 총 페이지의 수
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
							
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 5;
							
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage-1)/pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;
							
							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if(endPage > pageCount){
								endPage = pageCount;
							}
							
							if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
					%>
								<a href="list.jsp?pageNumber=<%=startPage-1%>" class="btn btn-primary">이전</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									<div class="btn btn-outline-light text-dark"><%=i%></div>
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="list.jsp?pageNumber=<%=i%>" class="btn btn-outline-dark"><%=i %></a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="list.jsp?pageNumber=<%=endPage + 1%>" class="btn btn-primary">다음</a>
					<%			
							}
						}
					%>
				</td>
			</tr>
		   	
		   	
	   	</tbody>
		</table>
		
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