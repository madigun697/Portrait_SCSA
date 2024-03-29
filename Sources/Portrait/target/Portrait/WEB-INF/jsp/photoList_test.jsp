<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Portrait</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="./dist/css/tokenfield-typeahead.css" type="text/css" rel="stylesheet">
    <link href="./dist/css/bootstrap-tokenfield.css" type="text/css" rel="stylesheet">
    <link href="./docs-assets/css/pygments-manni.css" type="text/css" rel="stylesheet">
    <link href="./docs-assets/css/docs.css" type="text/css" rel="stylesheet">
    
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
#selectModeYo {
	display: none;
}

.checkMan:checked+.urlol+label>img {
	display: inline;
	border: 18px solid #F96E5B;
	z-index: 100;
}

input[class="checkMan"] {
	display: none;
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
				
				<span class="ib-delete" id="ib-delete">delete</span></a>				
				<span class="ib-modify" id="ib-modify">modify</button>
 				
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


	<div id="wrapper">

		<!-- -----------------------view mode--------------------------------- -->
		<!-- Sidebar -->
		<div id='viewModeYo'>
			<div id="sidebar-wrapper" style="position: fixed; top: 0;">
				<!-- <form class="form-updatePhotos" name="form-updatePhotos"
					method="post"> -->
					<ul class="sidebar-nav">

						<li class="sidebar-brand"><a href="#"> Photo Informations
						</a></li>
						<hr style="border: 1px dotted gray;">
						<li><a id="photoTitle">File-Name</a></li>
						<li><a id="photoTime">Time</a></li>
						<li><a id="photoFstop">Fstop</a></li>
						<li><a id="photoExposure">Exposure</a></li>
						<li><a id="photoISO">ISO</a></li>
						<hr style="border: 1px dotted gray;">


						<li><a href="#"><label for="albumTitle">Album
									Title</label> <input type='text' id='pAlbumTitle' name='albumTitle'
								class="span2 search-query" style="margin-left: 30px"> </a></label></li>

						<li><a href="#"><label for="time">Time</label> <input
								type='text' id='pTime' name='time' class="span2 search-query"
								style="margin-left: 30px"> </a></li>

						<li><a href="#"><label for="geoTag">GeoTag</label> <input
								type='text' id='pGeoTag' name='geoTag'
								class="span2 search-query" disabled="disabled" style="margin-left: 30px"> </a></li>

						<li><a href="#"><label for="model">Model<br><input
									type='text' id='pModel' name='model' class="span2 search-query" disabled="disabled"
									style="margin-left: 30px">
							</label></a></li>

						<li id='tagLi0' style="display: "><a href="#"><label for="tags">Tags<br><input
									type="text" id='pTags0' class="form-control" name="tags" value=""
							placeholder="Type something and hit enter" style="margin-left: 30px;" /></label></a></li>

						<li id='peopleLi0' style="display: "><a href="#"><label for="people">People<br><input
									type="text" id='pPeople0' class="form-control2" name="people" value=""
							placeholder="Type people name and hit enter" style="margin-left: 30px;" /></label></a></li>

						<li><label for="description"> <a href="#">Description
									<input type='text' id='pDescription' name='description'
									class="span2 search-query" style="margin-left: 30px">
							</a></label></li>
						<div align="right" style="margin-right: 35px">
							<button type="button" class="btn" onclick="updatePhotos()">update</button>
							<input type="hidden" id="listSize" value="${fn:length(photoList)}">
						</div>
					</ul>
				<!-- </form> -->
			</div>




			<div class="container-fluid clearfix">
				<div class="row-fluid">
					<div id="welcome">
						<div class="container-fluid clearfix"
							style="padding: 0; overflow: hidden">
							<div id="ib-main-wrapper" class="ib-main-wrapper">
								<div class="ib-main">


									<div id='ib-view' class="ib-teaser"
										style="position: relative; float: left; width: 210px; height: 210px; background-color: #171717;"
										onclick="aa()">

										<h2 style="padding-left: 15px">
											<text style="color: #F96E5B">View Mode</text>
											Click Here to Edit<img src="images/click_white.png"
												width="50px"
												style="padding-left: 5%; margin-left: 50%; margin-top: -10%;">
										</h2>

									</div>

									<c:forEach items="${requestScope.photoList }" var="photo"
										varStatus="status">
										<c:forEach items="${photo.album}" var="a" varStatus="astatus">
											<a href="#"><img src="${photo.photoUrl}?width='210px'"
												data-largesrc="${photo.photoUrl}?imgmax=2048"
												data-photoTitle="${photo.photoTitle}"
												data-photoTime="${photo.time}"
												data-photoFstop="${photo.fstop}"
												data-photoExposure="${photo.exposure}"
												data-photoISO="${photo.iso}" data-photoTime="${photo.time}"
												data-photoGeoTag="${photo.geoTag}"
												data-photoModel="${photo.model}"
												data-photoDescription="${photo.description}"
												data-photoAlbumTitle="${a.albumTitle}"
												data-photoTags="${photo.tagText}"
												data-photoPeople="${photo.peopleText }"
												data-photoId="${photo.photoId}" data-userId="${userId}"
												data-albumId="${photo.albumId}" data-token="${token}"
												data-index="${status.count }"
												alt="image01" /><span>${photo.photoTitle}</span></a>
										</c:forEach>
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
		<!-- ----------------------------select mode----------------------------- -->


		<!-- Sidebar -->

		<div id="selectModeYo">
			<div id="sidebar-wrapper" style="top: auto;">
				<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#"> Photo Informations
					</a>
					<input type="hidden" id="tagList" value="${requestScope.tagList }">
					<input type="hidden" id="peopleList" value="${requestScope.peopleList }">
					</li>
					<form class="form-updatePhotos" name="form-updatePhotos"
						method="post">
						<label for="AlbumTitle"><li><a href="#">AlbumTitle</br>
									<input name='AlbumTitle' class="span2 search-query"
									style="margin-left: 30px"></a></li></label> <label for="Time"><li><a
								href="#">Time<br><input name='Time' class="span2 search-query"
									style="margin-left: 30px"></a></li></label> <label for="GeoTag"><li><a
								href="#">GeoTag<input name='GeoTag'
									class="span2 search-query" style="margin-left: 30px"></a></li></label> <label
							for="services"><li><a href="#">Services<input
									name='services' class="span2 search-query"
									style="margin-left: 30px"></a></li></label> <label for="Tags"><li><a
								href="#">Tags</br> <input type="text" id='pTags' class="form-control" name="tags" 
							placeholder="Type something and hit enter" style="margin-left: 30px" /></a></li></label> <label for="Description"><li><a
								href="#">Description</br> <input name='Description'
									class="span2 search-query" style="margin-left: 30px"></a></li></label> <br>
						<label><input type='checkbox' id='check_all'
							class='input_check' style="margin-left: 30px; margin-top: 0;" />
							<a style="color: white; margin-top: 3%">Select All</a></label>
						<div align="right" style="margin-right: 35px; margin-top: -50px;">
							<button type="submit" class="btn" onclick="updatePhotos()">update</button>
						</div>
					</form>

					<li>
						<form class="form_addEvent" name="form_addEvent" method="post"
							action="addEvent.do">
							<a href="#">Event Name</br> <input name='eventName'
								class="span2 search-query" style="margin-left: 30px"></a> 
							<a href="#">Event Date</br> <input name='eventDate' id="datepicker"
								class="span2 search-query" style="margin-left: 30px"></a>
							<a href="#">Event Description</br><input name='eventDesc' 
							    class="span2 search-query" style="margin-left: 30px"></a>	
								
							<div align="right" style="margin-right: 35px">
								<button type="submit" class="btn"
									onclick="javascript:addEvent()">Add Event</button>
								<!-- <input type="submit" value="gogo"> -->
							</div>
						</form>
					</li>
					<li style="margin-top: -100px; margin-left: 12%">
						<form class="form_deletePhoto" name="form_deletePhoto"
							method="post" action="deletePhotos.do">
							<input type="hidden" value="${requestScope.albumId}" id="albumId" name="albumId">
							<button type="submit" class="btn"
								onclick="javascript:deletePhotos()" style="background: #CA3232;">delete</button>
						</form>
					</li>

				</ul>

				<!-- <ul class="sidebar-nav">
				
			</ul> -->

			</div>

			<div class="container-fluid clearfix">
				<div class="row-fluid">
					<div id="welcome">
						<div class="container-fluid clearfix"
							style="padding: 0; overflow: hidden">
							<div>
								<div class="ib-main">

									<div id='ib-select' class="ib-teaser"
										style="position: relative; float: left; width: 210px; height: 210px; z-index: 1000px; background-color: #47476B"
										onclick="aa()">

										<h2 style="padding-left: 10px">
											<text style="color: #F96E5B">Select Mode</text>
											Click Here to View<img src="images/eyes.png" width="70px"
												style="padding-left: 11%; margin-left: 50%; margin-top: -10%;">
										</h2>

									</div>

									<c:forEach items="${requestScope.photoList}" var="photo"
										varStatus="status">

										<a href="#"> <input type="checkbox" class="checkMan"
											id='${photo.photoId}' name="photode"
											style="float: left; position: absolute;"
											value="${photo.photoId}" /> <!-- onclick="javascript:addEvent()" -->
											<input type="hidden" name="urlol" class='urlol'
											value="${photo.photoUrl}"> <label
											for="${photo.photoId}"> <img
												src="${photo.photoUrl }?width='210px'"
												data-largesrc="${photo.photoUrl }?imgmax=2048" alt="image01" /><span>Sheep</span></label></a>

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
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/gallery.min.js"></script>
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/jquery.tweet.min.js"></script>
	<!--Tweet ticker-->




	<!--jquery-classybox LightBox-->
	<script>
	$(function() {
	    $("#datepicker").datepicker({changeMonth: true, changeYear: true, yearRange:'1950:2014'}).val();
	  });
	
	
	
		$(".lightbox span.zoom a").ClassyBox({
			widthWindow : 900
		});

		function searchWord() {
			alert($("#formSearch").val());
		}

		function addEvent() {

			var chkFirList = document.getElementsByName('photode');
			var arrFir = new Array();

			for (i = 0; i < chkFirList.length; i++) {
				if (chkFirList[i].checked) {
					arrFir.push(chkFirList[i].value);
				}
			}
			;
			document.form_addEvent.action = "addEvent.do?arrFir=" + arrFir;
		}

		function deletePhotos() {
			var chkFirList2 = document.getElementsByName('photode');
			var arrFir2 = new Array();
			var albumId = $("#albumId").val();

			if (confirm("선택한 사진을 삭제하시겠습니까?")) {

				for (i = 0; i < chkFirList2.length; i++) {
					if (chkFirList2[i].checked) {
						arrFir2.push(chkFirList2[i].value);
					}
				}
				;
				document.form_deletePhoto.action = "deletePhotos.do?arrFir2="
						+ arrFir2;
			
			} else {
				location.href="./albumView.do?albumId="+albumId; 
			}
		}
		
		
	</script>
	<script type="text/javascript" src="js/jquery.elastislide.min.js"></script><!-- Gallery Section-->
    
    <!-- 검색 자동완성 기능 js, css 불러오기 -->
	<link href="./dist/css/tokenfield-typeahead.css" type="text/css" rel="stylesheet">
	<link href="./dist/css/bootstrap-tokenfield.css" type="text/css" rel="stylesheet">
	<link href="./docs-assets/css/pygments-manni.css" type="text/css" rel="stylesheet">
	<link href="./docs-assets/css/docs.css" type="text/css" rel="stylesheet">
	
	<script type="text/javascript" src="./dist/bootstrap-tokenfield.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./docs-assets/js/docs.js" charset="UTF-8"></script>
    
</body>
</html>