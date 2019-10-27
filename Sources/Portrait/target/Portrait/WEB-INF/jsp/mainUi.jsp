<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Portrait</title>
<link rel="shortcut icon" href="./img/portraitfavicon.ico">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="css/reset.css" rel="stylesheet">
<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<link href="css/services_slider/lean-slider.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/portfolio_gallery.css">

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
html { 
    height:100%;
}
body { 
    min-height:100%;
}
</style>

<link href="css/slicebox.css" rel="stylesheet" />
<!--3D Slider-->

<!-- Gallery Section-->
<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
			<div class="rg-image-wrapper">
				{{if itemsCount > 1}}
					<div class="rg-image-nav">
						<a href="#" class="rg-image-nav-prev">Previous Image</a>
						<a href="#" class="rg-image-nav-next">Next Image</a>
					</div>
				{{/if}}
				<div class="rg-image"></div>
				<div class="rg-loading"></div>
				<div class="rg-caption-wrapper">
					<div class="rg-caption" style="display:none;">
						<p></p>
					</div>
				</div>
			</div>
		</script>


<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="icon/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="icon/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="icon/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="icon/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="icon/favicon.ico">
</head>

<body class="clearfix" data-spy="scroll" data-target="#navbar"
	data-offset="10" style="background: url(./images/bgnoise.jpg) 50% 0 repeat fixed;">

	<center>
		<div class="container-fluid clearfix welcome" style="height: 150px;">
			<div class="row-fluid">
				<div id="welcome">
					<div class="container clearfix">
						<div class="wrapper" >
							<h1 style="margin-top: 8%">~Welcome to Portrait~</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>

	<div class="container-fluid clearfix welcome" style="height: 100%;">
		<div class="row-fluid">
			<div id="welcome">
				<div class="container clearfix">
					<div class="wrapper">
						<ul id="sb-slider" class="sb-slider">
							<li><a href="#" target="_blank"><img src="images/Portrait01.png"
									alt="Portrait01" /></a>
								<!-- <div class="sb-description">
									<h3>Portrait에 방문하신 것을 환영합니다.</h3>
								</div> --></li>
							<li><a href="#" target="_blank"><img src="images/Portrait02.png"
									alt="Portrait02" /></a>
								<!-- <div class="sb-description">
									<h3>진심으로...</h3>
								</div> --></li>
							<li><a href="#" target="_blank"><img src="images/Portrait03.png"
									alt="Portrait03" /></a>
								<!-- <div class="sb-description">
									<h3>Portrait은 사랑입니다.</h3>
								</div> --></li>
							<li><a href="#" target="_blank"><img src="images/Portrait04.png"
									alt="Portrait04" /></a>
								<!-- <div class="sb-description">
									<h3>따뜻한 사랑으로 감싸주세요.</h3>
								</div> --></li>
							<li><a href="#" target="_blank"><img src="images/Portrait05.png"
									alt="Portrait05" /></a>
								<!-- <div class="sb-description">
									<h3>Portrait는 사랑입니다.</h3>
								</div> --></li>
						</ul>
						<div id="shadow" class="shadow"></div>
						<div id="nav-arrows" class="nav-arrows">
							<a href="#">Next</a> <a href="#">Previous</a>
						</div>
					</div>
					<!-- /wrapper -->

				</div>
			</div>
		</div>
		<center style="background-image : url(../images/bgnoise.jpg) 50% 0 repeat fixed #ffffff; height: 100%">
			<br> <span style="text-align: center; font-family: '맑은 고딕'"></span><br>
			<br>
		</center>
	</div>
<%-- 	<center>
		<div>
			<a class="brand" href="#"
				style="margin-left: 50%; margin-top: 1%"><br>ⓒ
				Portrait</a>
		</div>
	</center>
--%>



	<!-- Le javascript==================================================-->
	<!-- Placed at the end of the document so the pages load faster -->

	
	<!-- Le javascript==================================================-->
	<!-- Placed at the end of the document so the pages load faster -->

	<script src="js/lean-slider.min.js"></script>
	<!-- Services Slider-->
	
	<script src="js/jquery.sticky.min.js"></script>
	<!-- sticky Nav-->
	
	<script src="js/jquery.easing.1.3.min.js"></script>
	<!-- parallax-->
	<script src="js/modernizr-2.6.1.min.js"></script>
	<!--blur slidShow -->
	<script src="js/jquery.validate.js"></script>
	<script src="js/jquery.parallax-1.1.3.min.js"></script>
	<!--  parallax-->
	<script src="js/jquery.localscroll-1.2.7-min.js"></script>
	<!--  parallax-->
	<script type="text/javascript" src="js/jquery.tmpl.min.js"></script>
	<!--grid slidShow -->
	<!-- &Services Gallery-->
	<script type="text/javascript" src="js/jquery.kinetic.min.js"></script>
	<!--grid slidShow -->
	<script type="text/javascript" src="js/jquery.iconmenu.min.js"></script>
	<!--Services  Blocks-->
	<script type="text/javascript" src="js/jquery-hover-effect.min.js"></script>
	<!--PortfolioGallery-->
	<script src="js/lightbox/jquery.classybox.min.js"></script>
	<!--jquery-classybox LightBox-->
	<script src="js/lightbox/jwplayer.js"></script>
	<!--jquery-classybox LightBox-->
	<script src="js/lightbox/jwplayer.html5.js"></script>
	<!--jquery-classybox LightBox-->
	<script type="text/javascript" src="js/jquery.elastislide.min.js"></script>
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/gallery.min.js"></script>
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/jquery.tweet.min.js"></script>
	<!--Tweet ticker-->
	<script type="text/javascript" src="js/jquery.slicebox.min.js"></script>
	<!--3D Slider-->
	<script type="text/javascript" src="js/3d_slider/call_slicebox.min.js"></script>
	<!--3D Slider-->

	<!--jquery-classybox LightBox-->
	<script>
		$(".lightbox span.zoom a").ClassyBox({
			widthWindow : 900
		});
	</script>
</body>
</html>