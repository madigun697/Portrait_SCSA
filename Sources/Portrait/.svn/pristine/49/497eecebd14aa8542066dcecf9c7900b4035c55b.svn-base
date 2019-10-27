<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
		<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Portrait</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href='http://fonts.googleapis.com/css?family=Kelly+Slab' rel='stylesheet' type='text/css'>
		<link href="css/reset.css" rel="stylesheet">
		<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet" />
		
		<link rel="stylesheet" type="text/css" href="css/portfolio_gallery.css">
		<!--Portfolio Gallery -->
		<link href="css/font-awesome.css" rel="stylesheet">
		<!--font-awesome for Icons -->
		<link href="css/layer_slider/app.css" rel="stylesheet" >
		<!--Layer Slider-->
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
		
		<!-- 이거 추가하기 css쪽에 -->
		<link rel="stylesheet" href="./css/jquery-ui.css">
		
		</head>

		<body class="clearfix" data-spy="scroll" data-target="#navbar" data-offset="10">
			<div class="container-fluid clearfix welcome">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui.js" type="text/javascript"></script>
		

       <div class="row-fluid">
        <div id="welcome">
                    <div class="container-fluid clearfix" style="padding:0; overflow:hidden">
                <div id="layer_slider">
                  <div class="container-fluid">
                    <div class="row">
                       <div class="span12">
                           <div style="position: relative; overflow: hidden;" id="slideShow"> 
                              
                              
                              <c:forEach var="list" items="${requestScope.eventPhotoList}">
                              <div class="SlideNo" data-out="top:1000; opacity:0;" data-in="left:-100;opacity:.2;duration:500" align="center">
                              <img src="${list.photoUrl}">
	                            <div class="span12">
	                                  <div data-in="top:-100;delay:1550;duration:550">
	                                </div>
                                </div>
                              </div>
                   			  </c:forEach>
                   			
                       
                    	  </div>
                                
                                
                                
                                <div class="slideControlBTN">
                                            <ul class="slideControl">
                                       <c:forEach var="control" items="${requestScope.eventPhotoList}">
                                        <li class=""></li>
                                       </c:forEach>
                                    </ul>
                                </div>
                            </div>
                                </div>
                    </div>
                            <div class="_ayaSlider_timer" style="position: absolute; z-index: 4; width: 947.454px; height: 5px; background: none repeat scroll 0% 0% rgb(0, 0, 0); left: 0px; margin: 0px; padding: 0px; opacity: 0.5; top: 550px; overflow: hidden;"></div>
                </div>
           	 </div>
           </div>
        </div>
   	 </div>
<!-- /container -->
<div id="toTop">To Top</div>
<!-- Le javascript==================================================--> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="js/jquery-1.8.2.min.js"></script> 
<script src="js/lean-slider.min.js"></script><!-- Services Slider--> 
<script src="js/jquery.sticky.min.js"></script><!-- sticky Nav--> 
<script src="js/my_script.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.easing.1.3.min.js"></script><!-- parallax--> 
<script src="js/modernizr-2.6.1.min.js"></script><!--blur slidShow --> 
<script src="js/jquery.validate.min.js"></script> 
<script src="js/jquery.parallax-1.1.3.min.js"></script><!--  parallax--> 
<script src="js/jquery.localscroll-1.2.7-min.js"></script><!--  parallax--> 
<script type="text/javascript" src="js/jquery.tmpl.min.js"></script><!--grid slidShow --><!-- &Services Gallery--> 
<script type="text/javascript" src="js/jquery.kinetic.min.js"></script><!--grid slidShow --> 
<script type="text/javascript" src="js/jquery.iconmenu.min.js"></script><!--Services  Blocks--> 
<script type="text/javascript" src="js/jquery-hover-effect.min.js"></script><!--PortfolioGallery--> 
<script src="js/lightbox/jquery.classybox.min.js"></script><!--jquery-classybox LightBox--> 
<script src="js/lightbox/jwplayer.js"></script><!--jquery-classybox LightBox--> 
<script src="js/lightbox/jwplayer.html5.js"></script><!--jquery-classybox LightBox--> 
<script type="text/javascript" src="js/jquery.elastislide.min.js"></script><!-- Gallery Section--> 
<script type="text/javascript" src="js/gallery.min.js"></script><!-- Gallery Section--> 
<script type="text/javascript" src="js/jquery.tweet.min.js"></script><!--Tweet ticker--> 
<script src="js/layer_slider/layer_slider.min.js" type="text/javascript"></script><!--Layer Slider--> 

<!--jquery-classybox LightBox--> 

<script>
	$(document).ready(function(){
	    $('#slideShow').ayaSlider({
	       easeIn : 'easeOutBack',
	       easeOut : 'linear',
	       delay : 5000,
	       timer : $('#layer_slider'),
	       previous : $('.prev'),
	       next : $('.next'),
	       list : $('.slideControl')
	    });
	});	
	</script>
</body>
</html>