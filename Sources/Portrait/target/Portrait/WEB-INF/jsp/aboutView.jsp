
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Portrait</title>

<link rel="shortcut icon" href="./img/portraitfavicon.ico">
<link rel="stylesheet" type="text/css" href="css/about/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/about/demo.css" />
<link rel="stylesheet" type="text/css" href="css/about/component.css" />
<style type="text/css">
@import
	url( http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css)
	;

img {
	max-width: 100%;
}
</style>

</head>
<body class="demo-1">
	<div id="container" class="container intro-effect-push">
		<header class="header">
		<div class="bg-img">
			<img src="./images/camera.png" alt="Background Image" />
		</div>
		<div class="title">
			<h1 style="margin-bottom: 20%; text-shadow: 2px 2px 15px black;">Welcome
				to PORTRAIT</h1>
		</div>
		</header>
		<button class="trigger"
			data-info="Click here to learn about 'Portrait'">
			<span>Trigger</span>
		</button>
		<div class="title">
			<p class="subline"
				style="font-family: 'nanum gothic'; letter-spacing: -2px; color: #F96E5B;">디지털
				세상 안에서 당신의 따뜻한 추억을 되살려 줄</p>
			<p style="color: gray;">
			<h1 style="color: gray;">Portrait</h1>

			<a style="color: gray;">by <strong>CJM, HDH, KMK, SYA,
					YJH</strong> <strong>Dec 17, 2014</strong></a>
			</p>
		</div>
		<article class="content">
		<div style="font-family: 'nanum gothic'; letter-spacing: -1px;">
			<img src="./images/take00.PNG" > <br> <br>
			<p>
				<a style="color: #F96E5B">Portrait</a>는 사용자 스스로 사진을 관리 할 수 있는
				사이트입니다.<br> 자유롭게 사진을 올리고, 분류하고, 또 당신의 <a style="color: #F96E5B">추억</a>을
				찾아보세요.
			</p>
			<br>
			<p>
			</p>
			<h3>Portrait, 사진을 쉽게 보관할 수 있는 서비스를 제공합니다.</h3><br>
			<img class="img-polaroid" src="./images/about001.PNG"><br><br>
			<p style="letter-spacing: -2px;">'UPLOAD' 항목을 클릭하면 당신의 사진을 업로드 할 수 있는 화면이 나타납니다.
			사진을 드래그하여 화면 위에 올려놓는 간단한 작업으로 사진 업로드가 완료됩니다.
			이렇게 업로드 된 사진은 Portrait의 서비스를 거쳐 Google Picasa의 저장소에 보관됩니다.
			해상도 2024X2024 이하의 사진은 무한대로 저장할 수 있습니다.
			용량 걱정 없이, 자료의 소실 없이 당신의 추억을 Portrait에서 간직하세요.</p>

			<h3>Portrait, 당신의 사진 기록을 시간, 장소, 인물별로 분류합니다.</h3>
			<p>다양한 분류 기준을 통해 당신의 사진 기록은 세분화되어 보관됩니다.</p>
			<img class="img-polaroid" src="./images/time001.PNG" ><br>
			<p>Time</p>
			<p>당신의 일대기를 직접 작성해보세요. 생일을 입력하면 즉시 일대기가 시작됩니다.
			입학식, 졸업식, 결혼식, 생일 등 당신의 특별한 추억을 사진과 함께 기록할 수 있습니다.
			</p>
			<img class="img-polaroid" src="./images/location001.jpg" ><br>
			<p>Location</p>
			<p>당신이 찍은 사진을 지도 위에서 바로 확인 할 수 있습니다. 
			지도 위 사진을 클릭하면 해당 장소에서 찍은 사진을 볼 수 있습니다.
			근방에서 찍었던 사진을 슬라이드쇼로 볼 수 있습니다.
			어디에서 찍었는지 확인하기 위해 사진 폴더를 열어봤던 시간을 단축 할 수 있습니다.</p>
			<img class="img-polaroid" src="./images/people001.PNG" ><br>
			<p>People</p>
			<p>사람들과 함께 찍은 사진에 인물 태그를 달아보세요. 사진을 찍은 순간 누구와 있었는지 
			기록하기 더욱 쉬워집니다.</p>
			
			<img class="img-polaroid" src="./images/search001.PNG" ><br>
			<h3>Portrait은 당신이 찾고 싶어하는 사진을 정확하게 찾아줍니다.</h3>
			<p>사진 기본 정보와 사용자 입력 태그를 통해 완벽한 검색을 구현합니다. 인물, 장소, 시간, 태그 분류를 
			세분화하여 자세한 검색이 가능합니다.</p>

			<img class="img-polaroid" src="./images/share001.jpg" ><br>
			<h3>Portrait, 당신이 나누고 싶은 추억을 공유할 수 있는 서비스를 제공합니다.</h3>
			<p>Portrait의 사용자 누구에게든 당신의 사진을 전송 할 수 있습니다. 함께 찍었던 사진, 
			나누고 싶었던 사진을 공유해보세요. Facebook 전송을 통해 여러장의 사진을 간편하게 
			SNS에 등록하세요.</p>

			<blockquote>Learn from yesterday, 
			Live for today, Hope for tomorrow</blockquote>
			<p>어제를 배우고, 오늘을 위해 살며 Portrait과 함께 내일을 꿈꾸세요.</p>

		</div>
		</article>
		<center>
		<section class="related">
		<p style="color: gray;">If you want to use our service</p>
		<div>
			<a href="./index.do" data-transition="fade"><h4>Go to
					Portrait</h4> <img src="./images/logo.png" style="width: 30%"></a>
		</div>
		</section>
		</center>
	</div>
	<!-- /container -->
	<script src="js/about/classie.js"></script>
	<script>
		(function() {

			// detect if IE : from http://stackoverflow.com/a/16657946		
			var ie = (function() {
				var undef, rv = -1; // Return value assumes failure.
				var ua = window.navigator.userAgent;
				var msie = ua.indexOf('MSIE ');
				var trident = ua.indexOf('Trident/');

				if (msie > 0) {
					// IE 10 or older => return version number
					rv = parseInt(
							ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
				} else if (trident > 0) {
					// IE 11 (or newer) => return version number
					var rvNum = ua.indexOf('rv:');
					rv = parseInt(ua.substring(rvNum + 3, ua
							.indexOf('.', rvNum)), 10);
				}

				return ((rv > -1) ? rv : undef);
			}());

			// disable/enable scroll (mousewheel and keys) from http://stackoverflow.com/a/4770179					
			// left: 37, up: 38, right: 39, down: 40,
			// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
			var keys = [ 32, 37, 38, 39, 40 ], wheelIter = 0;

			function preventDefault(e) {
				e = e || window.event;
				if (e.preventDefault)
					e.preventDefault();
				e.returnValue = false;
			}

			function keydown(e) {
				for (var i = keys.length; i--;) {
					if (e.keyCode === keys[i]) {
						preventDefault(e);
						return;
					}
				}
			}

			function touchmove(e) {
				preventDefault(e);
			}

			function wheel(e) {
				// for IE 
				//if( ie ) {
				//preventDefault(e);
				//}
			}

			function disable_scroll() {
				window.onmousewheel = document.onmousewheel = wheel;
				document.onkeydown = keydown;
				document.body.ontouchmove = touchmove;
			}

			function enable_scroll() {
				window.onmousewheel = document.onmousewheel = document.onkeydown = document.body.ontouchmove = null;
			}

			var docElem = window.document.documentElement, scrollVal, isRevealed, noscroll, isAnimating, container = document
					.getElementById('container'), trigger = container
					.querySelector('button.trigger');

			function scrollY() {
				return window.pageYOffset || docElem.scrollTop;
			}

			function scrollPage() {
				scrollVal = scrollY();

				if (noscroll && !ie) {
					if (scrollVal < 0)
						return false;
					// keep it that way
					window.scrollTo(0, 0);
				}

				if (classie.has(container, 'notrans')) {
					classie.remove(container, 'notrans');
					return false;
				}

				if (isAnimating) {
					return false;
				}

				if (scrollVal <= 0 && isRevealed) {
					toggle(0);
				} else if (scrollVal > 0 && !isRevealed) {
					toggle(1);
				}
			}

			function toggle(reveal) {
				isAnimating = true;

				if (reveal) {
					classie.add(container, 'modify');
				} else {
					noscroll = true;
					disable_scroll();
					classie.remove(container, 'modify');
				}

				// simulating the end of the transition:
				setTimeout(function() {
					isRevealed = !isRevealed;
					isAnimating = false;
					if (reveal) {
						noscroll = false;
						enable_scroll();
					}
				}, 1200);
			}

			// refreshing the page...
			var pageScroll = scrollY();
			noscroll = pageScroll === 0;

			disable_scroll();

			if (pageScroll) {
				isRevealed = true;
				classie.add(container, 'notrans');
				classie.add(container, 'modify');
			}

			window.addEventListener('scroll', scrollPage);
			trigger.addEventListener('click', function() {
				toggle('reveal');
			});
		})();
	</script>
</body>
</html>