$(document).ready(function(){
    var color = getCookie("color");
    var window_size = $(window).width();
    var text_color = getCookie("text_color");
    var alist = document.querySelectorAll('a');
    var right_box_color = getCookie("right_box_color");
    var i = 0;

    while(i < alist.length){
        alist[i].style.color = text_color;
        i = i + 1;
    }

    $(".left_box").css({"backgroundColor":color});
    $(".left_box").css({"color":text_color});
    $(".right_box .top_box").css({"backgroundColor":color});
    $(".right_box .middle_box").css({"backgroundColor":right_box_color});
    $(".right_box .bottom_box").css({"backgroundColor":right_box_color});
    $(".right_box #mini_calendar").css({"backgroundColor":right_box_color});
    $(".right_box .top_box .x_btn span").css({"backgroundColor":text_color});

    

    $(window).resize(function(){
        window_size = $(window).width();
        console.log($(".right_box").width());
        if(window_size>767){
            $(".right_box").css({"display":"block"});
            $(".diary_edit_form").css({"display":"none"});
        }
        else if(window_size<767){
            $(".right_box").css({"display":"none"});
            $(".black_box").css({"display":"none"});
            $(".diary_edit_form").css({"display":"none"});
        }
    });

    //디지털 시계 출력

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

    $('#mini_calendar .date_input').datepicker({
        language: 'ko',
        dateFormat: 'yy-mm-dd'
    });
    
    $(".diary_edit_form #diary_date").attr('value',y + "-" + m + "-" + d);
    var txt = document.getElementById('diary_text');
    txt.value = '';

    $(".right_box .top_box .btn").click(function(){
        $(".diary_edit_form").css({"display":"block"});
        $(".black_box").css({"display":"block"});
    });

    $(".diary_edit_form .x_btn").click(function(){
        $(".diary_edit_form").css({"display":"none"});
        $(".black_box").css({"display":"none"});
        $(".img_preview img").attr("src","img/photo.png");
        var filename = $(".img_preview img")[0].files[0].name;
        console.log(filename);
    });

    $(".moblie_left_btn_box .add_diary").click(function(){
        $(".diary_edit_form").css({"display":"block"});
        $(".black_box").css({"display":"block"});
    });

    //이미지 객체 타입으로 이미지 확장자 밸리데이션
    var validateType = function(img){
        return (['image/jpeg','image/jpg','image/png'].indexOf(img.type) > -1);
    }

    // 파일 선택 필드에 이벤트 리스너 등록
    document.getElementById('input_img').addEventListener('change', function(e){
    let elem = e.target;
    if(validateType(elem.files[0])){
        let preview = document.querySelector('.img_preview img');
        preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
        preview.onload = function() {
            URL.revokeObjectURL(preview.src); //URL 객체 해제
        }
    }else{
            console.log('이미지 파일이 아닙니다.');
        }
    });

    function setCookie(name, value, day) {
        var todayDate = new Date();
        
        todayDate.setDate(todayDate.getDate()+day);

        document.cookie = name + "=" + escape(value) + "; pastrh=/; expirex=" + todayDate.toUTCString() + ";";
    }

    //쿠키 값 가져오기
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

    function deleteCookie(name) {
        document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    }
});