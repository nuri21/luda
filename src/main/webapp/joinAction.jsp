<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<!-- jsp:setProperty property값(아이디, 패스워드)을 받아온다는 뜻임 -->


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
	if (userID != null) {
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('이미 로그인이 되어있습니다.')");
	   script.println("location.href = 'main.jsp'");
	   script.println("</script>");  
	}

	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ) {
		   PrintWriter script = response.getWriter();
		   script.println("<script>");
		   script.println("alert('모두 입력해주세요.')");
		   script.println("history.back()");
		   script.println("</script>");  
	} else {
		UserDAO userDAO = new UserDAO();
		  int result = userDAO.join(user);
		  if(result == -1){
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("alert('이미 존재하는 아이디입니다.')");
			   script.println("history.back()");
			   script.println("</script>");  
		  }		  
		  else {
			   session.setAttribute("userID",user.getUserID());
			   PrintWriter script = response.getWriter();
			   script.println("<script>");
			   script.println("location.href = 'main.jsp'");
			   script.println("</script>");  
		  } 
	}
			  
 %>
	
</body>
</html>