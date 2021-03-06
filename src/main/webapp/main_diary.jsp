<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>
<jsp:setPropertyname="user" property="userID" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='css/main_diary.css' rel='stylesheet' />
    <link href='css/main.min.css' rel='stylesheet' />
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="script/main_change3.js"></script>
    <script src="script/main_diary.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
  .carousel-inner img {
    width: 100%;
    height: 100%;
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
  
    <title>??????</title>
    </head>

<body>

	<%
		String userID = null;
		if(session.getAttribute("userID") != null ) {
			userID = (String)session.getAttribute("userID");
		}
		
	%>
    <div class="wrap">
        <div class="main_wrap">
            <header>
                <div class="header_main_box">
                    <div class="logo_box">
                        <img src="img/logo.svg" alt="">
                    </div>
                    <div class="btn_box">
                        <div class="calendar">
                            <div class="icon_box"><a href="main.jsp"><img src="img/date_icon.svg" alt=""></i> </a></div>
                            <div class="text_box"><a href="main.jsp">Calendar</a></div>
                        </div>
                        <div class="diary">
                            <div class="icon_box"><a href="main_diary.jsp"><img src="img/diary_icon.svg" alt=""></a></div>
                            <div class="text_box"><a href="main_diary.jsp">Diary</a></div>
                        </div>
                    </div>
                </div>
                <div class="option_box">
                    <div class="icon_box"><a href="setting.jsp"><img src="img/settings_icon.svg" alt=""></div>
                    <div class="text_box"><a href="setting.jsp">????????? ??????</a></div>
                </div>
                <div class="moblie_menu"><!--????????? ??????????????? ????????? ?????? pc??????????????? ?????????-->
                    <div class="profile">
                        <a><img src="img/hj_image.jpg" style="width:40px;height:40px;border-radius:100%"></a>
                    </div>
                    <div class="logo_box">
                        <img src="img/logo.svg" alt="">
                    </div>
                    <div class="menu_box">
                        <img src="img/menu_icon.svg" alt="">
                    </div>
                </div> 
            </header>
            <section>
                <div class="left_box">
                    <div class="date_box">
                        <div id="date">
                            
                        </div>
                        <div class="time" id="currentTime">
                        </div>
                    </div>
                    <div id="diary">
                             
                       <!-- ????????? ????????? ??????????????? -->              
                      <div id="demo" class="carousel slide" data-ride="carousel">

					  <!-- ?????? ?????? ???????????? ???????????? -->
					  <ul class="carousel-indicators">
					    <li data-target="#demo" data-slide-to="0" class="active"></li>
					    <li data-target="#demo" data-slide-to="1"></li>
					    <li data-target="#demo" data-slide-to="2"></li>
					    <li data-target="#demo" data-slide-to="3"></li>
					  </ul>
					  
					  <!-- ?????? ??????????????? -->
					  <div class="carousel-inner">
					    <div class="carousel-item active">
					      <img src="img/slide/cookie_01.png">
					    </div>
					    <div class="carousel-item">
					      <img src="img/slide/cookie_02.png">
					    </div>
					    <div class="carousel-item">
					      <img src="img/slide/cookie_03.png">
					    </div>
					    <div class="carousel-item">
					      <img src="img/slide/cookie_04.png">
					    </div>
					  </div>
					  
					  <!-- ?????? ????????? ??????????????? -->
					  <a class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
					</div>  
                        
             
                    </div>
                    <div class="moblie_diary_content">?????????</div> <!--?????????????????? ????????? pc????????? ?????????-->
                </div>
                <div class="right_box">
                    <div class="top_box">
                        <div class="btn">+ DIARY</div>
                        <div class="photo">
                         <a><img src="img/hj_image.jpg" style="width:50px;height:50px;border-radius:100%"></a>
                        </div>
                        <div class="x_btn">
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                    <div class="middle_box">
                        <div class="weather">
                            <a class="weatherwidget-io" href="https://forecast7.com/en/37d57126d98/seoul/" data-label_1="SEOUL" data-label_2="WEATHER" data-font="Roboto" data-mode="Current" data-days="3" data-theme="weather_one" >SEOUL WEATHER</a>
                            <script>
                                !function(d,s,id){
                                var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);
                                js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';
                                fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
                            </script>
                        </div>
                        <div id="mini_calendar">
                            <form class="datepicker">
                                <div class="text_box">?????? ??????</div>
                                <input type="text" class="date_input" name="diary_date">
                                <input class="button" type="submit" value="???????????? ??????"></input>
                            </form>
                        </div>
                    </div>
                    <div class="bottom_box">
                        <div class="contents_box">
                            <div class="moblie_right_iconbox">
                                <div class="calendar_icon">
                                    <img src="img/date_icon.svg" alt="">
                                </div>
                                <div class="diary_icon">
                                    <img src="img/diary_icon.svg" alt="">
                                </div>
                                <div class="option_icon">
                                    <img src="img/settings_icon.svg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="black_box">

                </div>
                <div class="photo_click_box">
                    <div class="x_btn">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="name_box"><%=userID%></div>
                    <div class="btn_box">
                    <div class="logout_btn">
                        <div class="text" id="logout"><a href="logout.jsp">????????????</div>
                    </div>
                    <div class="user_update_btn">
                        <div class="text">???????????? ??????</div>
                    </div>
                    <div class="text_contents_btn">
                        <div class="text"><a href="list.jsp">????????? ??????</a></div>
                    </div>
                    </div>
                </div>
                <form class="diary_edit_form" action="" method="post" enctype="multipart/form-data"> <!--form????????? ????????? ?????? jsp????????? ????????? ??? ?????? ??????-->
                    <div class="x_btn">
                        <span></span>
                        <span></span>
                    </div>
                    <div class="title">????????????</div>
                    <div class="date">
                        <div class="text">??????&nbsp;</div>
                        <input type="text" id="diary_date" name="writeDate" readonly>
                    </div>
                    <div class="image">
                        <div class="text">??????&nbsp;</div>
                        <input type="file" name="file" id="input_img"
                        accept="image/jpeg, image/jpg, image/png">
                    </div>
                    <div class="img_preview">
                        <img src="img/photo.png" alt="">
                    </div> <!--????????? ????????? ?????? ?????? ??? ??? ?????? ????????????-->
                    <div class="contents_area">
                        <div class="text">??????</div>
                        <textarea id="diary_text" name="contents" rows="6" cols="30"></textarea>
                    </div>
                    <input class="button" type="submit" value="????????????">
                </form>
                <div class="moblie_left_btn_box">
                    <div class="add_diary">+diary</div>
                </div>
            </section>
        </div>
    </div>
</body>
<script>
    var uid = '<%=(String)session.getAttribute("userID")%>';

    if(uid=="null"){ 
        document.querySelector(".photo_click_box .logout_btn #logout a").innerHTML = "?????????";
        $(".photo_click_box .logout_btn #logout a").attr("href", "login.jsp");
    }
    else{
        document.querySelector(".photo_click_box .logout_btn #logout a").innerHTML = "????????????";
        $(".photo_click_box .logout_btn #logout a").attr("href", "logout.jsp");
    }
  </script>
</html>