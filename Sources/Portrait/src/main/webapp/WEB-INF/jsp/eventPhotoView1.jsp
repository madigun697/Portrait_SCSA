<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Portrait</title>

<link rel="stylesheet" type="text/css" href="css/search2/style.css" />
<script src="js/search/modernizr.custom.70736.js"></script>
<noscript>
	<link rel="stylesheet" type="text/css" href="css/seacrh2/noJS.css" />
</noscript>
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body{
background-color: #F1F1F1;}
#loadingDiv {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #ffffff;
	z-index: 9999;
	text-align: center;
}

#loadingImage {
	top: 50%;
	left: 50%;
	z-index: 100000;
}
</style>

</head>
<body>
<script type="text/javascript">
		function loading_st() {
			var loadingDiv = document.getElementById('loadingDiv');
			 var loadingImage = document.getElementById('loadingMessage');
			 loadingDiv.style.display = 'block';
			 loadingImage.style.display = 'block'; 
		}
		function loading_ed() {
			var loadingDiv = document.getElementById('loadingDiv');
			 var loadingImage = document.getElementById('loadingMessage');
			 loadingDiv.style.display = 'none';
			 loadingImage.style.display = 'none';
		}
		loading_st();
		window.onload = loading_ed;
	</script>
	<div id="loadingDiv" style="display: none;">
			<img src="./images/wait.gif" id="loadingImage"
				style="margin:auto; margin-top:20%; display: none;">
		</div>
	<div class="container">

		<div class="main">
			<header class="clearfix">

			<h1 style="font-family:'nanum gothic'; letter-spacing: -1px;">
				<font style="font-family: 'nanum gothic'; letter-spacing: -1;">${event.eventName}<small>//${event.eventDesc}</small></font>

			</header>
			</h1><button onclick="addEventPhotos()" class="btn">edit Photos</button>

			<div class="gamma-container gamma-loading" id="gamma-container">
				
				<ul class="gamma-gallery">
				 	<c:forEach var="list" items="${requestScope.eventPhotoList}">
					<li>
						<div data-alt="${event.eventName}" data-description="<h3>${event.eventDesc}</h3>"
							data-max-width="1800" data-max-height="1350">
							<div data-src="${list.photoUrl}" data-min-width="1300"></div>
							<div data-src="${list.photoUrl}" data-min-width="1000"></div>
							<div data-src="${list.photoUrl}" data-min-width="700"></div>
							<div data-src="${list.photoUrl}" data-min-width="300"></div>
							<div data-src="${list.photoUrl}" data-min-width="200"></div>
							<div data-src="${list.photoUrl}" data-min-width="140"></div>
							<div data-src="${list.photoUrl}"></div>
							<noscript>
								<img src="images/3.jpg" alt="img03" />
							</noscript>
						</div>
					</li>
					</c:forEach>
				</ul>

				<div class="gamma-overlay"></div>

			</div>

		</div>
		<!--/main-->
	</div>

	<script src="js/search/jquery.masonry.min.js"></script>
<!-- 	<script src="js/search/jquery.history.js"></script> -->
	<script src="js/search/js-url.min.js"></script>
	<script src="js/search/jquerypp.custom.js"></script>
	<script src="js/search/gamma.js"></script>
	<script type="text/javascript">
		$(function() {

			var GammaSettings = {
				// order is important!
				viewport : [ {
					width : 1200,
					columns : 5
				}, {
					width : 900,
					columns : 4
				}, {
					width : 500,
					columns : 3
				}, {
					width : 320,
					columns : 2
				}, {
					width : 0,
					columns : 2
				} ]
			};

			Gamma.init(GammaSettings, fncallback);

			// Example how to add more items (just a dummy):

			var page = 0, items = [ '<li><div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350"><div data-src="images/xxxlarge/3.jpg" data-min-width="1300"></div><div data-src="images/xxlarge/3.jpg" data-min-width="1000"></div><div data-src="images/xlarge/3.jpg" data-min-width="700"></div><div data-src="images/large/3.jpg" data-min-width="300"></div><div data-src="images/medium/3.jpg" data-min-width="200"></div><div data-src="images/small/3.jpg" data-min-width="140"></div><div data-src="images/xsmall/3.jpg"></div><noscript><img src="images/xsmall/3.jpg" alt="img03"/></noscript></div></li><li><div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350"><div data-src="images/xxxlarge/3.jpg" data-min-width="1300"></div><div data-src="images/xxlarge/3.jpg" data-min-width="1000"></div><div data-src="images/xlarge/3.jpg" data-min-width="700"></div><div data-src="images/large/3.jpg" data-min-width="300"></div><div data-src="images/medium/3.jpg" data-min-width="200"></div><div data-src="images/small/3.jpg" data-min-width="140"></div><div data-src="images/xsmall/3.jpg"></div><noscript><img src="images/xsmall/3.jpg" alt="img03"/></noscript></div></li><li><div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350"><div data-src="images/xxxlarge/3.jpg" data-min-width="1300"></div><div data-src="images/xxlarge/3.jpg" data-min-width="1000"></div><div data-src="images/xlarge/3.jpg" data-min-width="700"></div><div data-src="images/large/3.jpg" data-min-width="300"></div><div data-src="images/medium/3.jpg" data-min-width="200"></div><div data-src="images/small/3.jpg" data-min-width="140"></div><div data-src="images/xsmall/3.jpg"></div><noscript><img src="images/xsmall/3.jpg" alt="img03"/></noscript></div></li><li><div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350"><div data-src="images/xxxlarge/3.jpg" data-min-width="1300"></div><div data-src="images/xxlarge/3.jpg" data-min-width="1000"></div><div data-src="images/xlarge/3.jpg" data-min-width="700"></div><div data-src="images/large/3.jpg" data-min-width="300"></div><div data-src="images/medium/3.jpg" data-min-width="200"></div><div data-src="images/small/3.jpg" data-min-width="140"></div><div data-src="images/xsmall/3.jpg"></div><noscript><img src="images/xsmall/3.jpg" alt="img03"/></noscript></div></li><li><div data-alt="img03" data-description="<h3>Sky high</h3>" data-max-width="1800" data-max-height="1350"><div data-src="images/xxxlarge/3.jpg" data-min-width="1300"></div><div data-src="images/xxlarge/3.jpg" data-min-width="1000"></div><div data-src="images/xlarge/3.jpg" data-min-width="700"></div><div data-src="images/large/3.jpg" data-min-width="300"></div><div data-src="images/medium/3.jpg" data-min-width="200"></div><div data-src="images/small/3.jpg" data-min-width="140"></div><div data-src="images/xsmall/3.jpg"></div><noscript><img src="images/xsmall/3.jpg" alt="img03"/></noscript></div></li>' ]

			function fncallback() {

				$('#loadmore').show().on('click', function() {

					++page;
					var newitems = items[page - 1]
					if (page <= 1) {

						Gamma.add($(newitems));

					}
					if (page === 1) {

						$(this).remove();

					}

				});

			}

		});
		
	
		function addEventPhotos(){
		location.href="addEventPhotos.do?eventId=${event.eventId}" 
			
		}
		
	</script>
</body>
</html>