<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/mygrid.css">
	<style rel="stylesheet" type="text/css">
	#header{
		
	}
	#header h1{
		height: 42px;
		background-image: url("imgs/logo.jpg");
		background-repeat: no-repeat;
		text-indent: -9999px;
	}
	#menu{
		text-align: center;
		background-color: grey;
	}
	#menu a{
		color: white;
		text-decoration: none;
		display: block;
		height: 35px;
		line-height: 30px;
	}
	#menu a:hover{
		border-bottom: 5px solid black;
		border-top: 5px solid black;
		box-sizing: border-box;
	}
	#bx{
		width: 800px;
		margin: 10px auto;
		position: relative;
	}
	#bx img{
		width: 800px;
	}
	#bx a{
		display: inline-block;
		position: absolute;
		top: 16px;
		height: 221px;
		width: 100px;
		background-color: black;
		opacity: 0.4;
		color: white;
		line-height: 230px;
		text-decoration: none;
		font-weight: bold;
		font-size: 100px;
		text-align: center;
	}
	#bx a:last-child{
		left: 700px;
	}
	#footer{
		padding-top: 100px;
		padding-left: 200px;
	}
	#list-group{
		width: 80%;
		margin: 0px auto;
		border-radius: 10px;
		border: 1px solid gray;
	}
	#list-group>*{
		padding: 20px;
	}
	#list-group>*:not(:last-child){
		border-bottom: 1px solid gray;
	}
	#list-group>*:first-child{
		background-color: aqua;
		border-radius: 10px 10px 0px 0px;
	}
	#list-group>*:last-child{
		border-radius: 0px 0px 10px 10px;
	}
	
	#popup{
		position: absolute;
		left: 0px;
		top: 0px;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.5);
	}
	#popup>div{
		background-color: white;
		width: 400px;
		height: 400px;
		margin: 100px auto;
		padding: 50px;
		box-sizing: border-box;
		border-radius: 20px;
	}
	#popup>div>form{}
	#popup>div>form>div{
		margin-bottom: 10px;
		text-align: center;
	}
	#popup>div>form>div>label{
		display: inline-block;
		width: 40%;
		background-color: darkgray;
	}
	#popup>div>form>div>input{
		width: 50%;
	}
	#popup>div>form>div>button{
		
	}
	#popup>div>.err{
		background-color: red;
		color: white;
		text-align: center;
		font-style: italic;
	}
	</style>
	<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="js/jquery.bxslider.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#popup').hide();
		
		$('#bx>ul').bxSlider({
			slideWidth: 800,
			minSlides: 1,
			maxSlides: 1,
			moveSlides: 1,
			auto: true,
			pager: false,
			nextText: '>',
			prevText: '<'
		});
		
		var getList = function(){
			$('#list-group').html('<div><span>ename</span></div>');
			$.getJSON('bbs/list.jsp', function(data){
				data.root.forEach(function(ele, idx){
					$('<div/>')
						.append($('<a/>').text(ele.ename).attr('href', '#'))
						.appendTo('#list-group');
				});
			});
		}
		
		var menu1Click = function(){
			$('#content>.row').hide().eq(0).show();
			return false;
		}
		var menu2Click = function(){
			$('#content>.row').hide().eq(1).show();
			return false;
		}
		var menu3Click = function(){
			$('#content>.row').hide().eq(2).show();
			getList();
			return false;
		}
		
		$('#menu a')
			.first()
			.click(menu1Click)
			.end().eq(1)
			.click(menu2Click)
			.end().eq(2)
			.click(menu3Click);
		
		$('#popup>div').click(function(e){
			e.stopPropagation();
			console.log('form...');
		});
		$('#popup').add('#popup form button:eq(2)').click(function(e){
			$('#popup form input').val('');
			$('#popup .err').remove();
			$('#popup').hide();
		});
		$('#p3>a').click(function(){
			$('#popup').show();
			return false;
		});
		
		var addList = function(param){
			$.ajax({
				url: 'bbs/insert.jsp',
				data: param,
				type: 'post',
				error: function(xhr, status, errmsg){
					$('#popup h2').before('<div class="err">에러발생(' + b + ')</div>');
				},
				success: function(param){
						$('#menu a').eq(2).click();
						$('#popup').click();
					}
			});
		};
		$('#popup form').submit(function(e){
			var param = $(e.target).serialize();
			addList(param);
			return false;
		});
		
		$('#menu a').first().click();
	});
	</script>
</head>
<body>
	<div class="container">
		<div id="header" class="row">
			<div class="grid12">
				<h1>비트교육센터</h1>
			</div>
		</div>
		<div id="menu" class="row">
			<div class="grid2">&nbsp;</div>
			<div class="grid2"><a href="#">HOME</a></div>
			<div class="grid2"><a href="#">INTRO</a></div>
			<div class="grid2"><a href="#">BBS</a></div>
			<div class="grid2"><a href="#">LOGIN</a></div>
			<div class="grid2">&nbsp;</div>
		</div>
		<div id="content">
			<div id="p1" class="row">
				<div id="bx">
					<ul>
						<li><img src="http://www.bitacademy.com/img/main_bn_0503.png"/></li>
						<li><img src="http://www.bitacademy.com/img/main_bn_0414_1.png"/></li>
						<li><img src="http://www.bitacademy.com/img/main_bn_0414_2.png"/></li>
						<li><img src="http://www.bitacademy.com/img/main_bn_0414_3.png"/></li>
					</ul>
				</div>
			</div>	
			<div id="p2" class="row">
				<dl>
					<dt>법률은 특별한 규정이</dt>
					<dd>정부는 회계연도마다 예산안을 편성하여 회계연도 개시 90일전까지 국회에 제출하고, 국회는 회계연도 개시 30일전까지 이를 의결하여야 한다. 공무원은 국민전체에 대한 봉사자이며, 국민에 대하여 책임을 진다.</dd>
					<dt>나는 헌법을 준수하고</dt>
					<dd>위원은 정당에 가입하거나 정치에 관여할 수 없다. 국회의원은 국가이익을 우선하여 양심에 따라 직무를 행한다. 국가는 건전한 소비행위를 계도하고 생산품의 품질향상을 촉구하기 위한 소비자보호운동을 법률이 정하는 바에 의하여 보장한다.</dd>
					<dt>모든 국민은 건강하고</dt>
					<dd>이 헌법시행 당시의 법령과 조약은 이 헌법에 위배되지 아니하는 한 그 효력을 지속한다. 모든 국민은 거주·이전의 자유를 가진다. 국회는 의장 1인과 부의장 2인을 선출한다.</dd>
					<dt>신체장애자 및 질병·</dt>
					<dd>국채를 모집하거나 예산외에 국가의 부담이 될 계약을 체결하려 할 때에는 정부는 미리 국회의 의결을 얻어야 한다. 군인은 현역을 면한 후가 아니면 국무위원으로 임명될 수 없다.</dd>
				</dl>
			</div>
			<div id="p3" class="row">
				<h2>리스트</h2>
				<a href="#">입력</a>
				<div id="list-group">
					<div><span>ename</span></div>
				</div>
			</div>
		</div>
		<div id="footer" class="row">
			<address>
			서울특별시 서초구 서초대로74길33 비트빌 3층
			</address>
			&copy; bitacademy co.ltd. All rights reserved.
		</div>
	</div>
	
	<div id="popup">
		<div>
			<h2>입력 페이지</h2>
			<form action="#" method="post">
				<div>
					<label for="empno">empno</label>
					<input type="number" name="empno" id="empno"/>
				</div>
				<div>
					<label for="ename">ename</label>
					<input type="text" name="ename" id="ename"/>
				</div>
				<div>
					<label for="sal">sal</label>
					<input type="text" name="sal" id="sal"/>
				</div>
				<div>
					<button>입력</button>
					<button type="reset">취소</button>
					<button type="button">뒤로</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
