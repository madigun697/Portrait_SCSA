<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Portrait</title>
<link rel="shortcut icon" href="./img/portraitfavicon.ico">
<style type="text/css">
@import url( http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css);
.search {
	font-family: 'Nanum Gothic';
	color: Black;
}
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href='http://fonts.googleapis.com/css?family=Kelly+Slab' rel='stylesheet' type='text/css'>
<link href="css/reset.css" rel="stylesheet">
<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<link href="css/font-awesome.css" rel="stylesheet">

<link href="css/services_slider/lean-slider.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/portfolio_gallery.css">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/jquery.classybox.css" rel="stylesheet" />
<link href="css/elastislide.css" rel="stylesheet" />
<link href="css/slicebox.css" rel="stylesheet" />

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
<!--grid slidShow -->
<script id="previewTmpl" type="text/x-jquery-tmpl">
			<div id="ib-img-preview" class="ib-preview">
                <img src="${src}" alt="" id='ib-preview-img' class="ib-preview-img"/>
                <span class="ib-preview-descr" style="display:none;">${description}</span>
                <div class="ib-nav" style="display:none;">
                    <span class="ib-nav-prev">Previous</span>
                    <span class="ib-nav-next">Next</span>
                </div>
                <span class="ib-close" style="display:none;">Close Preview</span>
 				<span class="ib-modify" id="ib-modify">up</button>
                <div class="ib-loading-large" style="display:none;">Loading...</div>	
		</script>

<script id="contentTmpl" type="text/x-jquery-tmpl">	
			<div id="ib-content-preview" class="ib-content-preview">
                <div class="ib-teaser" style="display:none;">{{html teaser}}</div>
                <div class="ib-content-full" style="display:none;">{{html content}}</div>
                <span class="ib-close" style="display:none;">Close Preview</span>
				<span class="ib-modify" id="ib-modify">up</button>
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

<!-- 이거 추가하기 css쪽에 -->
<link rel="stylesheet" href="./css/jquery-ui.css">
</head>
<body style="background: url(./images/bgnoise.jpg) 50% 0 repeat fixed;">
<div id="loadingDiv" style="display: none;">
			<img src="./images/wait.gif" id="loadingImage"
				style="margin:auto; margin-top:20%; display: none;">
		</div>
	<div id="Album">
		<div class="container-fluid clearfix Portfolio">
			<div class="container clearfix TitleSection">
				<header class="page-head">
					<h1>
						<font>Album List<small> //for your memories</small></font>
					</h1>
				</header>
			</div>
			<div class="container clearfix">
				<div class="row-fluid">
					<div class="span12"></div>
				</div>
			</div>
			<div class="container clearfix">
				<div class="row-fluid">
					<div class="span12">

						<!-- Portfolio 4 Column start -->
						<div class="image_grid portfolio_4col lightbox">
							<ul id="list" class="portfolio_list da-thumbs clearfix">
								<c:forEach items="${sessionScope.albumList}" var="album"
									varStatus="status">
									<c:choose>
										<c:when test='${(status.index)%4 eq 0}'>
											<li class="span3" style="margin-left: 0;">
												<div>
													<img src="${album.albumThumnailLink}?imgmax=300" style="object-fit: cover; width: 270px; height: 150px;">
													<article class="da-animate da-slideFromRight"
														style="display: block;">
														<h3 style="font-family: 'Nanum Gothic', Sans-serif; letter-spacing: -2px; font: none">${album.albumTitle}</h3>
														<a href="albumView.do?albumId=${album.albumId}" style="font-family: 'Nanum Gothic', Sans-serif; letter-spacing: -2px; font: none"><span
															class="zoom"></span></a>
														<c:set var="unsort" value="${sessionScope.userId }_unsort" />
														<c:set var="all" value="${sessionScope.userId }_all" />
														<c:set var="recycle" value="${sessionScope.userId }_recycle" />
														<c:if test="${album.albumId != unsort && album.albumId != all && album.albumId != recycle}">
															<a href="albumDel.do?albumId=${album.albumId }"><span
																class="recycle"></span></a>
														</c:if>
													</article>
													<h3 style="font-family: 'Nanum Gothic', Sans-serif; letter-spacing: -2px;">${album.albumTitle}</h3>
												</div>

											</li>
											
										</c:when>
										<c:otherwise>
											<li class="span3">
												<div>
													<img src="${album.albumThumnailLink}?imgmax=300" style="object-fit: cover; width: 270px; height: 150px;">
													<article class="da-animate da-slideFromRight"
														style="display: block;">
														<h3 style="font-family: 'Nanum Gothic', Sans-serif; letter-spacing: -2px;">${album.albumTitle}</h3>
														<a href="albumView.do?albumId=${album.albumId}"><span
															class="zoom"></span></a>
															<c:set var="unsort" value="${sessionScope.userId }_unsort" />
														<c:set var="all" value="${sessionScope.userId }_all" />
														<c:set var="recycle" value="${sessionScope.userId }_recycle" />
														<c:if test="${album.albumId != unsort && album.albumId != all && album.albumId != recycle}">
															<a href="albumDel.do?albumId=${album.albumId }"><span
																class="recycle"></span></a>
														</c:if>
													</article>
													<h3 style="font-family: 'Nanum Gothic', Sans-serif; letter-spacing: -2px;">${album.albumTitle}</h3>
												</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</ul>
						</div>
						<!-- Portfolio 4 Column End -->
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /container -->
	<div id="toTop">
		<font color="white">To Top</font>
	</div>

	<!--앨범 리스트 위에 커버 덮이는 기능-->
	<script src="js/lean-slider.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/jquery.parallax-1.1.3.min.js"></script>
	<script type="text/javascript" src="js/jquery.tmpl.min.js"></script>

	<!-- &Services Gallery-->
	<script type="text/javascript" src="js/jquery.kinetic.min.js"></script>
	<!--jquery-classybox LightBox-->
	<script type="text/javascript" src="js/jquery.elastislide.min.js"></script>

	<!-- Gallery Section-->
	<script type="text/javascript" src="js/jquery.tweet.min.js"></script>


	<!--Tweet ticker-->
	<script type="text/javascript" src="js/jquery.slicebox.min.js"></script>

	<!-- 메뉴에서 드롭 다운 등의 기능-->
	<%--<script src="js/my_script.js"></script> --%>

	<%--<script src="js/jquery.easing.1.3.min.js"></script> 
	<!-- parallax-->
	<script src="js/modernizr-2.6.1.min.js"></script>--%>
	<!--blur slidShow -->


	<%--<script src="js/jquery.localscroll-1.2.7-min.js"></script>--%>

	<!--grid slidShow -->
	<script type="text/javascript" src="js/jquery.iconmenu.min.js"></script>
	<!--Services  Blocks-->
	<script type="text/javascript" src="js/jquery-hover-effect.min.js"></script>
	<%--<!--PortfolioGallery-->
	<script src="js/lightbox/jquery.classybox.min.js"></script>
	<!--jquery-classybox LightBox-->
	<script src="js/lightbox/jwplayer.js"></script>
	<!--jquery-classybox LightBox-->
	<script src="js/lightbox/jwplayer.html5.js"></script>

	<!-- Gallery Section-->
	<script type="text/javascript" src="js/gallery.min.js"></script>

	<!--3D Slider-->
	<script type="text/javascript" src="js/3d_slider/call_slicebox.min.js"></script>
	<!--3D Slider-->
	--%>

	<!--jquery-classybox LightBox-->
	<script>
		/* $(".lightbox span.zoom a").ClassyBox({
			widthWindow : 900
		});
		 */
		/* $(".zoom").click(function() {
			alert("albumId랑 같이 넘어가용~");
			location.href = "albumView.do?albumId=${album.albumId}"
		}); */
	</script>


</body>
</html>