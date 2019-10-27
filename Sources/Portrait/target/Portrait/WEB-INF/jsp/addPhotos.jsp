<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Portrait</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 구글 폰트 불러오기 -->
<link href='http://fonts.googleapis.com/css?family=Kelly+Slab'
	rel='stylesheet' type='text/css'>

<!-- 부트스트랩, style, grid CSS 불러오기 -->
<%-- <link href="css/bootstrap.css" rel="stylesheet"> --%>
<link href="css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="css/grid.css" />
<!--grid slidShow -->

<!--font-awesome for Icons 불러오기 -->
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/simple-sidebar.css" rel="stylesheet">

<style type="text/css">
		
		.checkMan:checked + label > img {
			display: inline;
			border: 18px solid #F96E5B;
			z-index: 100;
			
		}
	
		input[class="checkMan"] {
        display: none;
      }
		
		.btn1 {
		  -webkit-border-radius: 8;
		  -moz-border-radius: 8;
		  border-radius: 8px;
		  font-family: Arial;
		  color: #ffffff;
		  font-size: 12px;
		  background: #F96E5B;
		  padding: 3px 12px 5px 12px;
		  border: solid #F96E5B 2px;
		  text-decoration: none;
			}

</style>


<!-- 미리보기 작은 화면 210*210 -->
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
		 $(document).ready(function(){ 
			 $("#wrapper").toggleClass("toggled");
		}); 
</script>

<!--grid slidShow / 크게 보는 화면-->
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
<link rel="stylesheet" href="./css/jquery-ui.css">

</head>

<body class="clearfix" data-spy="scroll" data-target="#navbar"
	data-offset="10">
	
	
	<div id="wrapper" >


<!-- ----------------------------select mode----------------------------- -->


		<!-- Sidebar -->
		<div id="selectModeYo">
		<div id="sidebar-wrapper" style="top: auto;">
			<ul class="sidebar-nav">
				<li class="sidebar-brand">
				<a href="#"> Photo Informations </a></li>
				<!-- <form class="form-updatePhotos" name="form-updatePhotos" method="post">
				<label for="tags"><li><a id='hhh'>Tags </br><input name='tags' class="span2 search-query" style="margin-left: 30px"></a></label></li>
				<label for="shortcuts"><li><a href="#">Shortcuts<input name='shortcuts' class="span2 search-query" style="margin-left: 30px"></a></li></label>
				<label for="overview"><li><a href="#">Overview<input name='overview'class="span2 search-query" style="margin-left: 30px"></a></li></label>
				<label for="events"><li><a href="#">Events</br><input name='events'class="span2 search-query" style="margin-left: 30px"></a></li></label>
				<label for="about"><li><a href="#">About</br><input name='about'class="span2 search-query" style="margin-left: 30px"></a></li></label>
				<label for="services"><li><a href="#">Services<input name='services'class="span2 search-query" style="margin-left: 30px"></a></li></label>
				<label for="contact"><li><a href="#">Contact<input name='contact'class="span2 search-query" style="margin-left: 30px"></a></li></label>
						<div align="right" style="margin-right: 35px"><button type="submit" class="btn" onclick="updatePhotos()" >update</button></div>
										<label><input type='checkbox' id='check_all' class='input_check' /> <b>전체선택</b></label>
				
				</form> -->
				
				<li>
					<form class="form_updateEvent" name="form_updateEvent" method="post" action="updateEvent.do">
						<a href="#">Event Name</br><input name='eventName' value="${event.eventName}" disabled="disabled" class="span2 search-query" style="margin-left: 30px"></a>
						<a href="#">Event Date</br><input name='eventDate' value="${event.eventDate}" disabled="disabled" class="span2 search-query" style="margin-left: 30px"></a>	
						<a href="#">Event Description</br><input name='eventDesc' value="${event.eventDesc}" disabled="disabled" class="span2 search-query" style="margin-left: 30px"></a>	
							<div align="right" style="margin-right: 35px"><br>
							<input type="hidden" value="${event.eventId}" name="eventId">
						
							<button type="submit" class="btn1" onclick="javascript:updateEvent()">update Event</button>
							
						</div>
					</form>
				</li>
				<li>
					<form class="form_deleteEvent" name="form_deleteEvent" method="post" action="deleteEvent.do">
						<div align="right" style="margin-right: 35px">
						<input type="hidden" value="${event.eventId}" name="eventId">
						<button type="submit" class="btn1" onclick="javascript:deleteEvent()">delete Event</button>
						</div>
					</form>
				</li>
				
				
			</ul>
		
		</div>
		
		<div class="container-fluid clearfix" >
			<div class="row-fluid">
				<div id="welcome">
					<div class="container-fluid clearfix"
						style="padding: 0; overflow: hidden">
						<div>
							<div class="ib-main">
							<!-- 
							<div id='ib-select'class="ib-teaser" style="position: relative; float: left; width: 210px; height: 210px; z-index: 1000px; background-color: #47476B" >
								
										<h2>Portrait Select Mode</h2>
										
							</div> -->
						
						<c:forEach items="${requestScope.eventPhotoList }" var="photo" varStatus="status">
                        
                        <a href="#">
                        
                        <input type="checkbox" class="checkMan" id='${photo.photoId}' name ="photode" style="float: left; position: absolute;"
							 value="${photo.photoId}"  checked="checked"
								 />
								 <!-- onclick="javascript:addEvent()" -->
                        <label for="${photo.photoId}">
                        <img
                           src="${photo.photoUrl }?width='210px'"
                           data-largesrc="${photo.photoUrl }?imgmax=2048"
                           alt="image01" /><span>Sheep</span></label></a> 
                        
                        </c:forEach>
						
						<c:forEach items="${requestScope.addiblePhotoList}" var="photo" varStatus="status">
                        
                        <a href="#">
                        
                        <input type="checkbox" class="checkMan" id='${photo.photoId}' name ="photode" style="float: left; position: absolute;"
							 value="${photo.photoId}" />
								 <!-- onclick="javascript:addEvent()" -->
                        <label for="${photo.photoId}">
                        <img
                           src="${photo.photoUrl }?width='210px'"
                           data-largesrc="${photo.photoUrl }?imgmax=2048"
                           alt="image01" /><span>Sheep</span></label></a> 
                        </c:forEach>
                        
                        
                        
								<div class="clr"></div>
							</div>
						</div>
					</div>
					<!-- ib-main -->
				</div>
				<!-- ib-main-wrapper -->
			</div>
		</div>
</div>
<!-- ----------------------------------------------------------------- -->


	</div>
	<!-- /container -->
	<div id="toTop">To Top</div>
	<!-- Le javascript==================================================-->
	<!-- Placed at the end of the document so the pages load faster -->
	<%--<script src="js/jquery-1.8.2.min.js"></script> --%>
	<script src="js/lean-slider.min.js"></script>
	<!-- Services Slider-->


	<%--<script src="js/bootstrap.min.js"></script> --%>
	<script src="js/jquery.easing.1.3.min.js"></script>


	<script type="text/javascript" src="js/jquery.tmpl.min.js"></script>
	<!--grid slidShow -->
	<!-- &Services Gallery-->
	<script type="text/javascript" src="js/jquery.kinetic.min.js"></script>
	<!--grid slidShow -->
	
	<script type="text/javascript" src="js/jquery.iconmenu.min.js"></script>

	<!--Services  Blocks-->
	<script type="text/javascript" src="js/jquery-hover-effect.min.js"></script>
	<script type="text/javascript" src="js/jquery.elastislide.min.js"></script>
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/gallery.min.js"></script>
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/jquery.tweet.min.js"></script>
	<!--Tweet ticker-->

	<script src="js/my_script.js"></script>




	<!--jquery-classybox LightBox-->
	<script>
	
 	$(".lightbox span.zoom a").ClassyBox({
			widthWindow : 900
		}); 

		function searchWord() {
			alert($("#formSearch").val());
		}
		
	
		function updateEvent() {
			   var chkFirList = document.getElementsByName('photode');
			  var arrFir = new Array();
			  
			  for(i=0; i<chkFirList.length; i++){
				  if(chkFirList[i].checked){
					  arrFir.push(chkFirList[i].value); 
				  }
			  };
			  document.form_updateEvent.action="updateEvent.do?arrFir="+arrFir;
		}
		
		function deleteEvent(){
			alert("삭제하시겠습니까?");
			   var chkFirList = document.getElementsByName('photode');
			  var arrFir = new Array();
			  
			  for(i=0; i<chkFirList.length; i++){
				  if(chkFirList[i].checked){
					  arrFir.push(chkFirList[i].value); 
				  }
			  };
			  document.form_deleteEvent.action="deleteEvent.do?arrFir="+arrFir;
		}
	</script>

</body>
</html>