$(document).ready(function(){
    $('.fc-day-sat').css({'color':'blue'});
    $(".event_add_box").css({"display":"none"});
    $(".photo_click_box").css({"display":"none"});
    $(".right_box .top_box span").css({"backgroundColor":"black"});

    var color = getCookie("color");
    var right_box_color = getCookie("right_box_color");
    var window_size = $(window).width();
    var text_color = getCookie("text_color");
    var alist = document.querySelectorAll('a');
    var i = 0;
    if (localStorage.getItem('nightBtn') === null) {
        localStorage.setItem('nightBtn', 'day');
        $('#togBtn').prop('checked',false);
    } else {
        if (localStorage.getItem('nightBtn') === 'night') {
            $('#togBtn').prop('checked',true);
        } else {
            $('#togBtn').prop('checked',false);
        }
    }

    while(i < alist.length){
        alist[i].style.color = text_color;
        i = i + 1;
    }
    
    $(".left_box").css({"backgroundColor":color});
    $(".left_box").css({"color":text_color});
    $(".right_box").css({"backgroundColor":color});
    $(".right_box").css({"color":text_color});
    $(".right_box .top_box").css({"backgroundColor":right_box_color});
    $(".right_box .middle_box").css({"backgroundColor":right_box_color});
    $(".right_box .bottom_box").css({"backgroundColor":right_box_color});
    $(".right_box .top_box .x_btn span").css({"backgroundColor":text_color});

    $(window).resize(function(){
        window_size = $(window).width();
        console.log($(".right_box").width());
        if(window_size>767){
            $(".right_box").css({"display":"block"});
            $(".photo_click_box").css({"display":"none"});
            $(".black_box").css({"display":"none"});
        }
        else if(window_size<767){
            $(".right_box").css({"display":"none"});
            $(".black_box").css({"display":"none"});
            $(".event_add_box").css({"display":"none"});
            $(".photo_click_box").css({"display":"none"});
        }
    });

    // 디지털 시계 출력
    var time;

    function setClock(){
        var today = new Date();
        var hour = modifyNumber(today.getHours());
        if(hour > 12){
            hour = hour-12;
        }
        var min = modifyNumber(today.getMinutes());
        var sec = modifyNumber(today.getSeconds());
        if(today.getHours()>11){
            document.getElementById("currentTime").innerHTML = 
            "PM "+hour + ":" + min + ":" + sec;
        }
        else{
            document.getElementById("currentTime").innerHTML = 
            "AM "+hour + ":" + min + ":" + sec;
        }
    }
    //24시간으로 시간 출력
    function setClock24(){
        var today = new Date();
        var hour = modifyNumber(today.getHours());
        var min = modifyNumber(today.getMinutes());
        var sec = modifyNumber(today.getSeconds());
        document.getElementById("currentTime").innerHTML =
        hour + ":" + min + ":" + sec;
    }

    function modifyNumber(time){
        if(parseInt(time) < 10){
            return "0" + time;
        }
        else
            return time;
    }
    time = setInterval(setClock,1000);

    //24시간 스위치
    $(".time_button").click(function(){
        if(this.value == "none24"){
            clearInterval(time);
            time = setInterval(setClock24,1000);
            this.value = "yes24";
        }
        else if(this.value == "yes24"){
            clearInterval(time);
            time = setInterval(setClock,1000);
            this.value = "none24";
        }
    });

    var color;
    //야간모드 스위치
    $(".night_btn").click(function(){
        var target = document.querySelector('.left_box');
        var target2 = document.querySelector('.right_box');
        var right_box_color;

        if($('#togBtn').prop('checked')){
            target.style.backgroundColor = '#212121';
            target2.style.backgroundColor = '#212121';
            target.style.color = 'white';
            target2.style.color = 'white';
            $(".right_box .top_box").css({"backgroundColor":"#212121"});
            $(".right_box .middle_box").css({"backgroundColor":"#212121"});
            $(".right_box .bottom_box").css({"backgroundColor":"#212121"});
            $(".top_box .x_btn span").css({"backgroundColor":"white"});

            localStorage.setItem("nightBtn","night");

            color = $(".left_box").css("background-color");//클릭하면 쿠키에 값이 저장됨
            right_box_color = $(".right_box .top_box").css("background-color");
            console.log("배경 색"+color);
            setCookie('color',color,1);
            setCookie('right_box_color',right_box_color,1);

            var alist = document.querySelectorAll('a');
            var i = 0;
            while(i < alist.length){
                alist[i].style.color = 'white';
                i = i + 1;
            }

            text_color = $(alist[0]).css("color");//클릭하면 쿠키에 값이 저장됨
            console.log("글씨 색"+text_color);
            setCookie('text_color',text_color,1);
        } else {
            target.style.backgroundColor = 'white';
            target2.style.backgroundColor = 'white';
            target.style.color = 'black';
            target2.style.color = 'black';
            $(".right_box .top_box").css({"backgroundColor":"white"});
            $(".right_box .middle_box").css({"backgroundColor":"#f0f0f0"});
            $(".right_box .bottom_box").css({"backgroundColor":"#f0f0f0"});
            $(".top_box .x_btn span").css({"backgroundColor":"black"});

            localStorage.setItem("nightBtn","day");
            
            color = $(".left_box").css("background-color");
            right_box_color = $(".right_box .middle_box").css("background-color");
            console.log(color);
            setCookie('color',color,1);
            setCookie("right_box_color",right_box_color,1);

            var alist = document.querySelectorAll('a');
            var i = 0;
            while(i < alist.length){
                alist[i].style.color = 'black';
                i = i + 1;
            }

            text_color = $(alist[0]).css("color");//클릭하면 쿠키에 값이 저장됨
            console.log("글씨 색"+text_color);
            setCookie('text_color',text_color,1);
        }
    });

    //날짜 출력
    n =  new Date();
    y = n.getFullYear();
    m = n.getMonth() + 1;
    d = n.getDate();
    document.getElementById("date").innerHTML = y + "년 " + m + "월 " + d + "일";

    //모바일 메뉴 클릭 동작
    $(".x_btn").click(function(){
        if(window_size<767){
            $(".right_box").css({"display":"none"});
            $(".black_box").css({"display":"none"});
        }
    });
    $(".menu_box").click(function(){
        if(window_size<767){
            $(".right_box").css({"display":"block"});
            $(".black_box").css({"display":"block"});
        }
    });

    //쿠키 부분
    var cookieData = document.cookie;
    var left_box = document.querySelector('.left_box');
    var color = $(".left_box").css("background-color");
    console.log(color);

    //쿠키에 값 저장하기
    function setCookie(name, value, day) {
        var todayDate = new Date();
        
        todayDate.setDate(todayDate.getDate()+day);

        document.cookie = name + "=" + escape(value) + "; pastrh=/; expirex=" + todayDate.toUTCString() + ";";
    }
    //쿠기에 저장한 값 불러오기
    function getCookie(cName) {
        cName = cName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cName);
        var cValue = '';
        if(start != -1){
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cValue = cookieData.substring(start, end);
        }
        return unescape(cValue);
    }

    //모바일 메뉴 이동
    $(".calendar_icon").click(function(){
        location.href = "main.jsp";
    });
    $(".diary_icon").click(function(){
        location.href = "main_diary.html";
    });
    $(".option_icon").click(function(){
        location.href = "setting.html";
    });

    //프로필 사진 클릭
    $(".top_box .photo").click(function(){
        $(".photo_click_box").css({"display":"block"});
        $(".black_box").css({"display":"block"});
    });

    $(".moblie_menu .profile").click(function(){
        $(".photo_click_box").css({"display":"block"});
        $(".black_box").css({"display":"block"});
    });

    $(".photo_click_box .x_btn").click(function(){
        $(".photo_click_box").css({"display":"none"});
        $(".black_box").css({"display":"none"});
    });
});