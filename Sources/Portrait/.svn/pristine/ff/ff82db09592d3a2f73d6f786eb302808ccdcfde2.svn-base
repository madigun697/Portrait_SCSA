<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
		<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Parallax707</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<link href='http://fonts.googleapis.com/css?family=Kelly+Slab' rel='stylesheet' type='text/css'>
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet" />
		<link href="css/services_slider/lean-slider.css" rel="stylesheet" />
		<link href="css/font-awesome.css" rel="stylesheet">
		<!--font-awesome for Icons -->
		<link href="css/elastislide.css" rel="stylesheet"  />
		<!-- Gallery Section-->

		<!-- Gallery Section-->
		<script id="img-wrapper-tmpl" type="text/x-jquery-tmpl">	
			<div class="rg-image-wrapper">
			 
                 

                                            		
				{{if itemsCount > 1}}
					<div class="rg-image-nav">
						<a href="#" class="rg-image-nav-prev">Previous Image</a>
						<a href="#" class="rg-image-nav-next">Next Image</a>
					</div>
				{{/if}}
				<div class="rg-image"><img src="${list.photoUrl}" data-large="${list.photoUrl}" alt=" "/></div>
				<div class="rg-loading"></div>
				<div class="rg-caption-wrapper">
					<div class="rg-caption" style="display:none;">
						<p></p>
					</div>
				</div>
			</div>
		</script>

		<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
		<!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
		<!--[if IE 7]>
  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css">
  <![endif]-->
		<!-- Fav and touch icons -->
		<link rel="apple-touch-icon-precomposed" sizes="144x144" href="icon/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="icon/apple-touch-icon-114-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="icon/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="icon/apple-touch-icon-57-precomposed.png">
		<link rel="shortcut icon" href="icon/favicon.ico">
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
</style>
		</head>

		<body class="clearfix" data-spy="scroll" data-target="#navbar" data-offset="10">
<div class="container-fluid clearfix welcome">
            <div class="row-fluid">
        <div id="navbar" class="navbar navbar-static-top">
                  
                </div>
        <div id="LargeSlider">
                    <div class="container-fluid clearfix LargeSlider">
                <div class="container clearfix TitleSection">
                            <header class="page-head">
                        
                        <h1><font style="font-family: 'nanum gothic'; letter-spacing: -1;">${event.eventName}<small>//${event.eventDesc}</small>
                    
                        <button onclick="addEventPhotos()" class="btn">edit Photos</button>
                        <button onclick="slideShow()" class="btn">SlideShow</button>
                        
                         </font> </h1>  
                    </header>
                        </div>
                <div class="container clearfix">
                            <div class="row-fluid">
                        <div class="span12">
                                    <div id="rg-gallery" class="rg-gallery">
                                <div class="rg-thumbs"> 
                                            <!-- Elastislide Carousel Thumbnail Viewer -->
                                            <div class="es-carousel-wrapper">
                                        <div class="es-nav"> <span class="es-nav-prev">Previous</span> <span class="es-nav-next">Next</span> </div>
                                        <div class="es-carousel">
                                                    <ul>
                                            			 <c:forEach var="list" items="${requestScope.eventPhotoList}">
                                            			 <li><a href="#"><img src="${list.photoUrl}" data-large="${list.photoUrl}" alt=" "/></a></li>
                                            	</c:forEach>
                                            		</ul>
                                                </div>
                                    </div>
                                            <!-- End Elastislide Carousel Thumbnail Viewer --> 
                                        </div>
                                <!-- rg-thumbs --> 
                            </div>
                                </div>
                    </div>
                        </div>
            </div>
                </div>
        <!--#LargeSlider-->
    </div>
            <!-- /Row --> 
        </div>
<!-- /container -->
<div id="toTop">To Top</div>
<!-- Le javascript==================================================--> 
<!-- Placed at the end of the document so the pages load faster --> 

<script src="js/lean-slider.min.js"></script><!-- Services Slider--> 
<script src="js/jquery.sticky.min.js"></script><!-- sticky Nav--> 
<script src="js/jquery.easing.1.3.min.js"></script><!-- parallax--> 
<script src="js/modernizr-2.6.1.min.js"></script><!--blur slidShow --> 
<script src="js/jquery.validate.min.js"></script> 
<script src="js/jquery.parallax-1.1.3.min.js"></script><!--  parallax--> 
<script src="js/jquery.localscroll-1.2.7-min.js"></script><!--  parallax--> 
<script type="text/javascript" src="js/jquery.tmpl.min.js"></script><!--grid slidShow --><!-- &Services Gallery--> 
<script type="text/javascript" src="js/jquery.kinetic.min.js"></script><!--grid slidShow --> 
<script type="text/javascript" src="js/jquery.iconmenu.min.js"></script><!--Services  Blocks--> 
<script type="text/javascript" src="js/jquery.elastislide.min.js"></script><!-- Gallery Section--> 
<script type="text/javascript" src="js/gallery.min.js"></script><!-- Gallery Section--> 
<script type="text/javascript" src="js/jquery.tweet.min.js"></script><!--Tweet ticker-->

<script type="text/javascript">
	function addEventPhotos(){
	location.href="addEventPhotos.do?eventId=${event.eventId}" 
		
	}
	
	function slideShow(){
	location.href="showSlide.do?eventId=${event.eventId}" 
	}


</script>

</body>
</html>