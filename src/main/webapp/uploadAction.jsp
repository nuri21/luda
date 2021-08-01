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
	String directory = application.getRealPath("/upload/");
	int maxSize = 1024 * 1024 * 15; 
	String encoding = "UTF-8";
	
	// 객체, 경로, 파일크기, 인코딩방식, 중복네임처리방법
	MultipartRequest multipartRequest =
	      new MultipartRequest(request, directory,
	      maxSize, encoding, new DefaultFileRenamePolicy());
	
	String userID = (String)session.getAttribute("userID");
	String fileName = multipartRequest.getOriginalFileName("file");
	String fileRealName = multipartRequest.getFilesystemName("file");
	String fileContents = multipartRequest.getParameter("fileContents");
	
	new FileDAO().upload(userID, fileName, fileRealName, fileContents);
	

%>
</body>
</html>