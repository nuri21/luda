<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%@ page import="board.BoardDAO" %>  
<%@ page import="board.Board" %>  
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>
<jsp:setPropertyname="user" property="userID" />
<jsp:setPropertyname="user" property="userName" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="main_change3.css">
    <link href='css/main.min.css' rel='stylesheet' />
    <link href='css/main_change3.css' rel='stylesheet' />
    <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="script/main_change3.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var start_date;
            var end_date;
            var content;
            
            //일정 추가 창 보이기
            
            $(".right_box .btn").click(function(){
                $("#datepicker1").datepicker('option','disabled',false);
                $("#datepicker2").datepicker('option','disabled',false);
                $("#datepicker1").datepicker({
                    language: 'ko',
                    dateFormat: 'yy-mm-dd'
                });
                $("#datepicker2").datepicker({
                    language: 'ko',
                    dateFormat: 'yy-mm-dd'
                });
                document.querySelector(".start_date input").value = "";
                document.querySelector(".end_date input").value = "";
                $(".event_add_box").css({"display":"block"});
                $(".black_box").css({"display":"block"});
            });

            $(".moblie_left_btn_box .add_event").click(function(){
                $("#datepicker1").datepicker('option','disabled',false);
                $("#datepicker2").datepicker('option','disabled',false);
                $("#datepicker1").datepicker({
                    language: 'ko',
                    dateFormat: 'yy-mm-dd'
                });
                $("#datepicker2").datepicker({
                    language: 'ko',
                    dateFormat: 'yy-mm-dd'
                });
                document.querySelector(".start_date input").value = "";
                document.querySelector(".end_date input").value = "";
                $(".start_date input").attr("readonly",true);
                $(".end_date input").attr("readonly",true);
                $(".event_add_box").css({"display":"block"});
                $(".black_box").css({"display":"block"});
            });
            
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
            
            themeSystem: 'bootstrap',
            initialView: 'dayGridMonth',
            headerToolbar: {  // 헤더에 뭘 표시할건지. 심플하게 했어요.
            left: 'prev',
            center: 'title',
            right: 'next'
                },
            events: [
                <%   
	        		int pageSize = 10; // 한 페이지에 출력할 레코드 수
	
	        		// 페이지 링크를 클릭한 번호 / 현재 페이지
	        		String pageNumber = request.getParameter("pageNumber");
	        		%>	

	        		<%
	        		String userID = null;
	        		String userName = null;
	        		if(session.getAttribute("userID") != null ) {
	        			userID = (String)session.getAttribute("userID");
	        		}
	        		%>
	        		
	        		<%
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
                        
                 <%for(int i = 0; i < list.size(); i++) {%>
                    {
                       
                       title: '<%=list.get(i).getContent()%>', 
                       start: '<%= list.get(i).getStartDate()%>',
                       end: '<%= list.get(i).getEndDate()%>'
                    },
                 <%} %>
             ],

            lang : "ko"
            , editable : true
            , eventLimit : true
            , selectable: true  // 이건 드래그 가능하게 해주는 옵션
            , select : function (info) {
                document.querySelector(".start_date input").value = "";
                document.querySelector(".end_date input").value = "";
                $(".event_add_box").css({"display":"block"});
                $(".black_box").css({"display":"block"});
                document.querySelector(".start_date input").value = info.startStr;
                document.querySelector(".end_date input").value = info.endStr;
                $(".start_date input").attr("readonly",true);
                $(".end_date input").attr("readonly",true);
                $("#datepicker1").datepicker('option','disabled',true);
                $("#datepicker2").datepicker('option','disabled',true);
            }
            , eventClick : function() { //일정 클릭시 이벤트
                alert();
            }
            , googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE"      // Google API KEY
        });
        calendar.render();
        $(".event_add_box .button").click(function(){
            start_date = $(".start_date input").val();
            end_date = $(".end_date input").val();
            content = $(".contents_box input").val();
            $(".event_add_box").css({"display":"none"});
            $(".black_box").css({"display":"none"});
            calendar.addEvent({
                title:content,
                start:start_date,
                end:end_date
            });
        });
        $(".event_add_box .x_btn").click(function(){
            $(".event_add_box").css({"display":"none"});
            $(".black_box").css({"display":"none"});
        });


        //공휴일 보이기 안보이기
        $(document).ready(function(){
            $(".holiday_btn").click(function(){ //공휴일 버튼 클릭
                if(this.value == "false"){
                    this.value = "true";
                    calendar.addEventSource({
                        googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
                        id:"holidays", 
                        className : "koHolidays", 
                        color : "#7691d9", 
                        textColor : "#FFFFFF",
                        editable : false
                        }
                    );
                }
                else if(this.value == "true"){
                    this.value = "false";
                    removeEvents = calendar.getEventSourceById("holidays");
                    removeEvents.remove();
                }
            });

            //달력 월 별로 바꾸기
            var option_value;
            $(".calendar_option").change(function(){
                option_value = $(".calendar_option").val();
                
                if(option_value == "month"){
                    calendar.changeView('dayGridMonth');
                }
                else if(option_value == "week"){
                    calendar.changeView('dayGridWeek');
                }
                else if(option_value == "day"){
                    calendar.changeView('timeGridDay');
                }
            });

            //세션값에 아이디 있으면 로그아웃으로 표시 없으면 로그인으로 표시
            var uid = '<%=(String)session.getAttribute("userID")%>';

            if(uid=="null"){ 
                document.querySelector(".photo_click_box .logout_btn #logout a").innerHTML = "로그인";
                $(".photo_click_box .logout_btn #logout a").attr("href", "login.jsp");
            }
            else{
                document.querySelector(".photo_click_box .logout_btn #logout a").innerHTML = "로그아웃";
                $(".photo_click_box .logout_btn #logout a").attr("href", "logout.jsp");
            }
        });
    });
    </script>
    <style>
   
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

    <title>루다</title>
    </head>

<body>
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
                    <div class="icon_box"><a href="setting.jsp"><img src="img/settings_icon.svg" alt=""></a></div>
                    <div class="text_box"><a href="setting.jsp">개발자 문의</a></div>
                </div>
                <div class="moblie_menu"><!--모바일 화면에서만 쓰이는 메뉴 pc화면에서는 안보임-->
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
                    <div id="calendar">

                    </div>
                    <div class="moblie_left_btn_box">
                        <div class="add_event">+event</div>
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
                        <div class="text_title">화면 설정</div>
                        <div class="options">
                            <div class="line line1">
                                <div class="option_text">야간모드</div>
                                <label class="switch">
                                    <input type="checkbox" id="togBtn" class="night_btn">
                                    <div class="slider round">
                                        <span class="on">ON</span>
                                        <span class="off">OFF</span>
                                    </div>
                                   </label>

                            </div>
                            <div class="line line2">
                                <div class="option_text">공휴일 표시</div>
                                <label class="switch">
                                    <input type="checkbox" id="togBtn" value = "false" class="holiday_btn">
                                    <div class="slider round">
                                     <!--ADDED HTML -->
                                     <span class="on">ON</span>
                                     <span class="off">OFF</span>
                                     <!--END-->
                                    </div>
                                   </label>

                            </div>
                            <div class="line line3">
                                <div class="option_text">24시간 표시</div>
                                <label class="switch">
                                    <input type="checkbox" id="togBtn" value="none24" class="time_button">
                                    <div class="slider round">

                                     <span class="on">ON</span>
                                     <span class="off">OFF</span>

                                    </div>
                                   </label>

                            </div>
                            <div class="line line4">
                                <div class="option_text">표시 방식</div>
                                <select class="calendar_option">
                                    <option value="month">월</option>
                                    <option value="week">주</option>
                                    <option value="day">일</option>
                                </select>
                            </div>
                            <div class="moblie_right_iconbox">
                                <div class="calendar_icon">
                                    <img src="img/date_icon.svg" width="100%" height="100%" alt="">
                                </div>
                                <div class="diary_icon">
                                    <img src="img/diary_icon.svg" width="100%" height="100%" alt="">
                                </div>
                                <div class="option_icon">
                                    <img src="img/settings_icon.svg" width="100%" height="100%" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="black_box">
    
                </div>
            </section>
            <form class="event_add_box" action="writeAction.jsp" method="post"> <!--form문으로 바꿔서 값을 jsp파일로 전달할 수 있게 수정-->
                <div class="x_btn">
                    <span></span>
                    <span></span>
                </div>
                <div class="title">이벤트를 입력해주세요</div>
                <div class="start_date">
                    <div class="text">시작일</div>
                    <input type="text" id="datepicker1" name="startDate">
                </div>
                <div class="end_date">
                    <div class="text">종료일</div>
                    <input type="text" id="datepicker2" name="endDate">
                </div>
                <div class="contents_box">
                    <div class="text">일정</div>
                    <input type="text" name="content" maxlength="100">
                </div>
                <input class="button" type="submit" value="일정 추가"></input>
            </form>
            <div class="photo_click_box">
                <div class="x_btn">
                    <span></span>
                    <span></span>
                </div>
                <div class="name_box" style="font-size:14px;"><%=userID%></div>
                <div class="btn_box">
                    <div class="logout_btn">
                        <div class="text" id="logout"><a href="logout.jsp">로그아웃</a></div>
                    </div>
                    <div class="user_update_btn">
                        <div class="text">회원정보 수정</div>
                    </div>
                    <div class="text_contents_btn">
                        <div class="text"><a href="list.jsp">작성글 목록</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>