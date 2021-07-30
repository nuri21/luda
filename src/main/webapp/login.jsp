<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" crossorigin="anonymous">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/login.css">
	<title>로그인</title>
	<style>
    .btn-primary {
        background-color: #37153f;
        border-color: #37153f;
        color: #FFF; }
    .con_join {
        margin-top: 10px;
    }
    
    @font-face {
    font-family: 'Pretendard-Light';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Light.woff') format('woff');
    font-weight: 300;
    font-style: normal;
	}
	body {
		font-family: 'Pretendard-Light';
	} 
   
    </style>

</head>
<body>
<div class="wrap">

             <div class="logo text-center">
                <img src="img/logo.png" class="mx-auto d-block" alt="" style="margin-top:10%;">
            </div>
   <div id="logreg-forms" style="margin-top:-2%">
          <form class="form-signin" method="post" action="loginAction.jsp">
            <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> 로그인</h1>
            <div class="social-login">
                <button class="btn facebook-btn social-btn" type="button"><span><i class="fab fa-facebook-f"></i> Sign in with Facebook</span> </button>
                <button class="btn google-btn social-btn" type="button"><span><i class="fab fa-google-plus-g"></i> Sign in with Google+</span> </button>
            </div>

            <input type="email" name="userID" class="form-control" placeholder="아이디(이메일)" required autofocus>
            <input type="password" name="userPassword" class="form-control" placeholder="비밀번호" required>
            
            <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i> 로그인</button>
            <a href="#" id="forgot_pswd">Forgot password?</a>
            <hr>
           
            <button class="btn btn-primary btn-block" type="button" id="btn-signup"><a href="join.jsp" style="text-decoration:none;color:white;"><i class="fas fa-user-plus"></i>  회원가입</a></button>
            </form>

            <form action="/reset/password/" class="form-reset">
                <input type="email" id="resetEmail" class="form-control" placeholder="Email address" required="" autofocus="">
                <button class="btn btn-primary btn-block" type="submit">Reset Password</button>
                <a href="#" id="cancel_reset"><i class="fas fa-angle-left"></i> Back</a>
            </form>
            
          
            <br>
   			</div>
            
    	</div>

</body>
</html>