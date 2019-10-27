<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<form class="form-updatePhotos" name="form-updatePhotos"
					method="post">
					<ul class="sidebar-nav">
					<li class="sidebar-brand"><a href="#"> Photo Recovery </a></li>
					
					<li style="margin-top:-15%;">
						<form class="form_recoveryPhoto" name="form_recoveryPhoto"
							method="post" action="recoveryPhotos.do">
							<button type="submit" class="btn"
								onclick="javascript:recoveryPhotos()" style="background: #47B56C; width: 85%">recovery</button>
						</form>
					</li>

					<li class="sidebar-brand"><a href="#"> Photo Delete </a></li>
					
					</li>
					<li style="margin-top:-15%;">
						<form class="form_deletePhoto" name="form_deletePhoto"
							method="post" action="deletePhotos.do">
							<button type="submit" class="btn"
								onclick="javascript:deletePhotos()" style="background: #CA3232; width: 85%">delete</button>
						</form>
					</li>

				</ul>
				</form>
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
												data-photoId="${photo.photoId}" data-userId="${userId}"
												data-albumId="${photo.albumId}" data-token="${token}"
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
					<li class="sidebar-brand"><a href="#"> Photo Recovery </a></li>
					
					<li style="margin-top:-15%;">
						<form class="form_recoveryPhoto" name="form_recoveryPhoto"
							method="post" action="recoveryPhotos.do">
							<button type="submit" class="btn"
								onclick="javascript:recoveryPhotos()" style="background: #47B56C; width: 85%">recovery</button>
						</form>
					</li>

					<li class="sidebar-brand"><a href="#"> Photo Delete </a></li>
					
					</li>
					<li style="margin-top:-15%;">
						<form class="form_deletePhoto" name="form_deletePhoto"
							method="post" action="deletePhotos.do">
							<button type="submit" class="btn"
								onclick="javascript:deletePhotos()" style="background: #CA3232; width: 85%">delete</button>
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

		function recoveryPhotos() {

			var chkFirList2 = document.getElementsByName('photode');
			var arrFir2 = new Array();

			if (confirm("선택한 사진을 미분류 앨범으로 복구하시겠습니까?")) {

				for (i = 0; i < chkFirList2.length; i++) {
					if (chkFirList2[i].checked) {
						arrFir2.push(chkFirList2[i].value);
					}
				}
				;
				document.form_recoveryPhoto.action = "recoveryPhotos.do?arrFir2="
						+ arrFir2;
			
			}
		}
		
		function deletePhotos() {

			var chkFirList2 = document.getElementsByName('photode');
			var arrFir2 = new Array();

			if (confirm("선택한 사진을 삭제하시겠습니까?")) {

				for (i = 0; i < chkFirList2.length; i++) {
					if (chkFirList2[i].checked) {
						arrFir2.push(chkFirList2[i].value);
					}
				}
				;
				document.form_deletePhoto.action = "deletePhotos.do?arrFir2="
						+ arrFir2;
			
			}
		}
	</script>

</body>
</html>