<%@page import="file.FileDAO,
            java.io.File,
            com.oreilly.servlet.multipart.DefaultFileRenamePolicy,
            com.oreilly.servlet.MultipartRequest
            "%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Insert title here</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String)session.getAttribute("userID");
		}
		
	%>

<%
	String directory = application.getRealPath("/upload/");
	ServletContext context = getServletContext();
	int maxSize = 1024 * 1024 * 100; 
	String encoding = "UTF-8";
	

	try{ MultipartRequest multipartRequest 
	= new MultipartRequest(request, directory, maxSize, encoding, 
	      new DefaultFileRenamePolicy());
	
	String writeDate = multipartRequest.getParameter("writeDate");
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");
	String fileContents = multipartRequest.getParameter("fileContents");
	
	new FileDAO().upload(userID, writeDate, fileName, fileRealName, fileContents);
	
	} catch(Exception e){
		e.printStackTrace();
	    }

%>



</body>
</html>