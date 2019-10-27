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
</style>

</head>
<body>
	<div class="container">

		<div class="main">
			<header class="clearfix">

			<h1 style="font-family:'nanum gothic'; letter-spacing: -1px;">
				Search Result <small style="color: #F96E5B">from Portrait</small><span>KEYWORDS : 
				<c:forEach items="${requestScope.keyword }" var="keyword" varStatus="status">
					#${keyword}
					<c:if test="${!status.last }">
					,
					</c:if> 
				</c:forEach>
				</span>
			</h1>

			</header>

			<div class="gamma-container gamma-loading" id="gamma-container">

				<ul class="gamma-gallery">
					<c:forEach items="${requestScope.result }" var="result">
					<li>
						<div data-alt="${result.photoTitle }" data-description="<h3>${result.photoTitle }</h3>"
							data-max-width="1800" data-max-height="1350">
							<div data-src="${result.photoUrl }" data-min-width="1300"></div>
							<div data-src="${result.photoUrl }" data-min-width="1000"></div>
							<div data-src="${result.photoUrl }" data-min-width="700"></div>
							<div data-src="${result.photoUrl }" data-min-width="300"></div>
							<div data-src="${result.photoUrl }" data-min-width="200"></div>
							<div data-src="${result.photoUrl }" data-min-width="140"></div>
							<div data-src="${result.photoUrl }"></div>
							<noscript>
								<img src="${result.photoUrl }" alt="${result.photoTitle }" />
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
	</script>
</body>
</html>