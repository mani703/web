window.onload = function(){
    // 메뉴바 javascript
    var menuLis = document.querySelectorAll('.menubar>ul>li');
    var menuLi = document.querySelectorAll('.menubar>ul>li')[2];
    var subLis = document.querySelectorAll('.menubar>ul>li>ol>li');

    var hide = function (ele) {
        ele.querySelector('ol').style.display = 'none';
    };
    hide(menuLi);

    menuLi.addEventListener('click', function () {
        menuLi.style.backgroundColor = '#1dd178';
        if (menuLi.querySelector('ol').style.display == 'none') {
            hide(menuLi);
            menuLi.querySelector('ol').style.display = 'block';
        } else {
            menuLi.querySelector('ol').style.display = 'none';
        }
        return false;
    });

    menuLis.forEach(function (ele) {
        ele.onmouseenter = function () {
            ele.style.backgroundColor = '#92fc7c';
        }
        ele.onmouseleave = function () {
            ele.style.backgroundColor = '#1dd178';
        }
    });
    subLis.forEach(function (ele) {
        ele.onmouseenter = function () {
            ele.style.backgroundColor = '#92fc7c';
        }
        ele.onmouseleave = function () {
            ele.style.backgroundColor = '#1dd178';
        }
    });

    // 메인페이지 learning 이미지 jquery
    callback1 = function(){
        div = $('#section>.learn>.learcompo>ul').css({marginLeft:"0px"})
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000)
            .delay(1500)
            .animate({marginLeft:"-=227"}, 1000, function(){
                setTimeout(callback1, 500);
            })
    }
    setTimeout(callback1, 1000);
    
    $('#popup').hide();
    $('#popup>div').click(function(e){
    	e.stopPropagation();
    });
    $('#popup, #popup button:button').click(function(e){
    	$('#popup').hide();
    });
    $('#section>.wrap3>.board>.table>tbody a').click(function(e){
    	var deptno = $(e.target).parent().parent().find('td').eq(0).text();

    	$('#popup form div:nth-child(2)>input').attr('value', deptno);
    	$('#popup').show();
    });
    

}