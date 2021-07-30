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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.combootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript"> $(function(){ $("#alert-success").hide(); $("#alert-danger").hide(); $("input").keyup(function(){ var pwd1=$("#pwd1").val(); var pwd2=$("#pwd2").val(); if(pwd1 != "" || pwd2 != ""){ if(pwd1 == pwd2){ $("#alert-success").show(); $("#alert-danger").hide(); $("#submit").removeAttr("disabled"); }else{ $("#alert-success").hide(); $("#alert-danger").show(); $("#submit").attr("disabled", "disabled"); } } }); }); </script>
	<title>회원가입</title>
	<style>
	.w3-text-purple {color:#4d2557!important}
	.w3-deep-purple {background-color:#4d2557!important}
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

    <div class="row" style="float: none; margin-top:3%;">
        <div class="col-md-4" style="float: none; margin:0 auto;">
        		<div class="logo w3-center">
                <img src="img/logo.png" alt="">
            </div>
        
        <form action="joinAction.jsp" method="post" class="w3-container w3-card-4 w3-light-grey w3-text-purple" style="margin-left:20%;margin-right:20%;margin-top:10px;">
		
		<div class="w3-row w3-section" style="margin-left:16px;">
		  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" name="userID" type="email" placeholder="아이디(이메일)">
		    </div>
		</div>
		 
		<div class="w3-row w3-section" style="margin-left:16px;">
		  <div class="w3-col" style="width:50px"><i class="fa fa-key" style="font-size:36px"></i></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" name="userPassword" type="password" id="pwd1" required placeholder="비밀번호">
		    </div>
		</div>
		
		<div class="w3-row w3-section" style="margin-left:16px;">
		  <div class="w3-col" style="width:50px"><i class="fa fa-key" style="font-size:36px"></i></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" name="reuserPwd" type="password" id="pwd2" required placeholder="비밀번호 확인">
		    </div>
		</div>
		
		 <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div> 
        <div class="alert alert-danger" id="alert-danger" >비밀번호가 일치하지 않습니다.</div>
		
		
		<div class="w3-row w3-section" style="margin-left:16px;">
		  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
		    <div class="w3-rest">
		      <input class="w3-input w3-border" name="userName" type="text" placeholder="닉네임">
		    </div>
		</div>
		        <input type="checkbox" name="remember" required style="margin-left:16px;"> '루다' 이용약관에 동의합니다.<br><br>
		
		<button class="w3-button w3-block w3-section w3-deep-purple w3-ripple w3-padding">가입하기</button>

</form>

        </div>
    </div>  
    
</div>

</body>
</html>