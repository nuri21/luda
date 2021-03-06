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
    <link href='css/setting.css' rel='stylesheet' />
    <link href='css/main_change3.css' rel='stylesheet' />
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="script/main_change3.js"></script>
    <style> 
    @font-face {
    font-family: 'Pretendard-ExtraLight';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-ExtraLight.woff') format('woff');
    font-weight: 200;
    font-style: normal;
	}
		
		body {
		font-family: 'Pretendard-ExtraLight';
		}
        .accordion {
          background-color: #eee;
          color: #444;
          cursor: pointer;
          padding: 18px;
          width: 100%;
          border: none;
          text-align: left;
          outline: none;
          font-size: 15px;
          transition: 0.4s;
        }
        
        .active, .accordion:hover {
          background-color: #ccc;
        }
        
        .accordion:after {
          content: '\002B';
          color: #777;
          font-weight: bold;
          float: right;
          margin-left: 5px;
        }
        
        .active:after {
          content: "\2212";
        }
        
        .panel {
          padding: 0 18px;
          max-height: 0;
          overflow: hidden;
          margin-top: 10px;
          margin-bottom: 10px;
          font-size: 14px;
          transition: max-height 0.2s ease-out;
        }

        .contact_form {
            display: block;
            justify-content: center;
            align-items: center;
        }

        .contact_form h3 {
            margin-top: 15px;
            margin-bottom: 10px;
        }

        .contact_form_txt {
            display: block;
            font-size: 14px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .contact_form input {
            position: relative;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 15px;
            margin-bottom: 16px;
            resize: vertical;
        }

        .contact_form button {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-top: 6px;
            margin-bottom: 16px;
            resize: vertical;
        }

        
        </style>

    <title>??????</title>
    </head>

<body>

	<%
		String userID = null;
		String userName = null;
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
                    <!-- ???????????? ?????? -->
                    <button class="accordion">??????????</button>
                    <div class="panel">
                      <p>?????????????????? '?????????'?????? ????????? ?????? ????????????, ???????????? ?????????????????????. <br>
                        ?????? ???, ???, ??? ????????? ???????????? ???????????? ????????? ?????? ????????? ???????????? ??????????????? ???????????? ?????????.</p>
                    </div>
                    
                    <button class="accordion">????????????, ?????????, 24?????? ?????????? </button>
                    <div class="panel">
                      <p>?????? ????????? ??????????????? ??????????????? ?????? ????????? ?????? ????????? ???????????? ??????????????????? ????????????. <br>
                        ???????????? ??????????????? ???????????? ??????????????? ??????????????? ????????? ??????, <br>
                        24?????? ????????? ??? ?????? AM, PM?????? ????????? ????????? ????????????. ??? </p>
                    </div>
                    
                    <button class="accordion">????????? ?????????? </button>
                    <div class="panel">
                      <p>????????? ?????? ???????????? ????????? ???????????? ?????????. 
                        2.0 ???????????? ?????????~ ????</p>
                    </div>
                    
                    <script>  
                    // ?????? ?????? ??????????????? ?????? ???????????? ????????? ???.. 
                    var acc = document.getElementsByClassName("accordion");
                    var i;
                    
                    for (i = 0; i < acc.length; i++) {
                      acc[i].addEventListener("click", function() {
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.maxHeight) {
                          panel.style.maxHeight = null;
                        } else {
                          panel.style.maxHeight = panel.scrollHeight + "px";
                        } 
                      });
                    }
                    </script>
                    
                <!-- ???????????? ??? -->

                <!-- ????????? ????????? -->
                <div class="contact_form">
                    <h3>???????????????</h3>
                <div class="contatc_form_txt">???????????? ????????? ????????????, ????????? ????????? ???????????????. ???? </div>

                <input type="text" value="example@gmail.com" id="myInput">
                <button onclick="myFunction()">????????????</button>

                <script>
                function myFunction() {
                var copyText = document.getElementById("myInput");
                copyText.select();
                copyText.setSelectionRange(0, 99999)
                document.execCommand("copy");
                alert("????????? ????????? ?????????????????????!: " + copyText.value);
                }
                </script>
                </div>

                </div>
				<div class="right_box">
                    <div class="top_box">
                        <div class="btn">+ EVENT</div>
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
                    </div>
                    <div class="bottom_box">
                        <div class="text_title">?????? ??????</div>
                        <div class="options">
                            <div class="line line1">
                                <div class="option_text">????????????</div>
                                <label class="switch">
                                    <input type="checkbox" id="togBtn" class="night_btn">
                                    <div class="slider round">
                                     
                                     <span class="on">ON</span>
                                     <span class="off">OFF</span>
                                     
                                    </div>
                                   </label>

                            </div>
                            <div class="line line2">
                                <div class="option_text">????????? ??????</div>
                                <label class="switch">
                                    <input type="checkbox" id="togBtn">
                                    <div class="slider round">
                                     <!--ADDED HTML -->
                                     <span class="on">ON</span>
                                     <span class="off">OFF</span>
                                     <!--END-->
                                    </div>
                                   </label>

                            </div> 
                            <div class="line line3">
                                <div class="option_text">24?????? ??????</div>
                                <label class="switch">
                                    <input type="checkbox" id="togBtn" value="none24" class="time_button">
                                    <div class="slider round">

                                     <span class="on">ON</span>
                                     <span class="off">OFF</span>

                                    </div>
                                   </label>

                            </div>
                            <div class="line line4">
                                <div class="option_text">?????? ??????</div>
                                <select class="calendar_option">
                                    <option value="month">???</option>
                                    <option value="week">???</option>
                                    <option value="day">???</option>
                                </select>
                            </div> 
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
			<div class="name_box" style="font-size:14px;"><%=userID%></div>
                <div class="btn_box">
                    <div class="logout_btn">
                        <div class="text"><a href="logout.jsp">????????????</div>
                    </div>
                    <div class="user_update_btn">
                        <div class="text">???????????? ??????</div>
                    </div>
                    <div class="text_contents_btn">
                        <div class="text"><a href="list.jsp">????????? ??????</a></div>
                    </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</body>

</html>