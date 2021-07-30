<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<title>Insert title here</title>
	</head>
		<body>
		<% 
		session.invalidate();
		%>
		<script>
		location.href='login.jsp';
		</script>
	</body>
</html>