<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>
<jsp:setProperty name="board" property="startDate" />
<jsp:setProperty name="board" property="endDate" />
<jsp:setProperty name="board" property="content" />
<!-- jsp:setProperty property값을 받아온다는 뜻임 -->


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인</title>
</head>
<body>
<%
	String userID = null;
	
	//자신에게 할당된 세션 아이디를 담는 공간을 만드는 것.
	if(session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	
	// 이미 로그인이 된 사람은 회원가입 페이지에 접속 불가능.
	if (userID == null) {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('로그인이 필요합니다.')");
	   script.println("location.href = 'login.jsp'");
	   script.println("</script>");  
	}
	else {	
		if(board.getStartDate() == null || board.getEndDate() == null || board.getContent() == null ) {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('모두 입력해주세요.')");
		   script.println("history.back()");
		   script.println("</script>");  
	} else {
		BoardDAO boardDAO = new BoardDAO();
		  int result = boardDAO.write(userID, board.getStartDate(),board.getEndDate(),board.getContent());
		  if(result == -1){
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('일정 등록에 실패하였습니다.')");
			   script.println("history.back()");
			   script.println("</script>");  
		  }		  
		  else {
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('일정 등록 성공.')");
			   script.println("location.href = 'main.jsp'");
			   script.println("</script>");  
		  } 
	}
		
}


			  
 %>
	
</body>
</html>