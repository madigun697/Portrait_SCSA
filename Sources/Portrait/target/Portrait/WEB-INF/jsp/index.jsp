<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.iptime.madigun697.util.AuthHelper"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
	font-family: '맑은 고딕';
}

a.no-uline {
	text-decoration: none
}

.itxOverlay {
	position: fixed;
	top: 0;
	left: 0;
	z-index: -900;
	background-color: rgb(60, 60, 60);
	width: 100%
}

.modalPortrait {
	position: fixed;
	_position: absolute;
	z-index: 1000;
	padding: 23px 22px;
	_width: 1%;
	-moz-box-shadow: 2px 3px 20px 1px rgba(0, 0, 0, 0.5);
	-webkit-box-shadow: 2px 3px 20px 1px rgba(0, 0, 0, 0.5);
	box-shadow: 2px 3px 20px 1px rgba(0, 0, 0, 0.5);
	padding: 0
}

.modalContent {
	position: relative;
	padding: 20px;
	background-color: rgba(235, 237, 255, 1);
	z-index: 1002;
	opacity: 0;
	font-color:white;
}

.modalClose {
	position: absolute;
	top: 0px;
	right: 10px;
	z-index: 100000
}

.modalClose a {
	display: block;
	overflow: hidden;
	width: 34px;
	
	padding-top: 34px;
	/* background-image: url(../img/button_close_2.png); */
	outline: 0
}

.modalClose a:hover {
	background-position: left 68px
}

.modalClose a:active {
	background-position: left 34px
}

.modalTitle {
	white-space: nowrap;
	background-color: #FFFFFF;
	background: url(../img/dotted_line.png) repeat-x left bottom;
	margin-bottom: 0;
	position: fixed;
	width: 100%;
	max-width: 650px;
}

.modalTitle h2 {
	font-size: 20px;
	padding-bottom: 10px
}

.modalInfo {
	margin-top: 70px;
	font-size: 12px;
	overflow-Y: auto;
	overflow-X: hidden;
	font-color:white;
}


body {
	font-family: "nanumgothic";
	font-size: 9pt;
	scrollbar-face-color: #CCCCCC;
	scrollbar-shadow-color: #000000;
	border: 1px;
	border-color: #151515;
	scrollbar-highlight-color: #ffffff;
	scrollbar-3dlight-color: #000000;
	scrollbar-darkshadow-color: #777777;
	scrollbar-track-color: #999999;
	scrollbar-arrow-color: #151515;
}

.modalPanel {
	width: 650px;
	font-color:white;
}

.infoSubtitle {
	font-size: 12px;
	background: url(../img/dotted_line.png) repeat-x left bottom;
	margin-bottom: 20px;
	padding-bottom: 10px;
	font-color:white;
}



.lastUnit {
	display: table-cell;
	width: auto;
	*display: block;
	*zoom: 1;
	_left: -3px
}


.btn2 {
  -webkit-border-radius: 7;
  -moz-border-radius: 7;
  border-color: rgb(206, 206, 216);
  border-radius: 7px;
  font-family: Arial;
  color: #5E5B6F;
  font-size: 15px;
  background: #DCE3FD;
  padding: 4px 12px 4px 12px;
  text-decoration: none;
}

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
</style>

<script type="text/javascript">
window.onload = window.onresize = resize; 

/**
 * 전체 화면의 크기(window.innerHeight) 변화를 감지하여,
 * modal팝업으로 표시되는 div의 크기를 자동으로 조절하는 기능
 */
function resize() {
	var container = document.getElementById("modalC");
	var info = document.getElementById("modalI");
	var panel = document.getElementById("modalP");
	var _panelH = panel.style.height;
	var panelH = _panelH.substring(0,_panelH.length-2);
	panelH = Number(panelH);
	var height = window.innerHeight;
	if (panelH > (height-300)) {
		container.style.height = height - 230 + "px";
		info.style.height = height - 300 + "px";
	} else {
		container.style.height = panelH + 70 + "px";
		info.style.height = panelH + "px";
	}
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="./js/modalpopup.js"></script>
<script src="./js/modalSize.js"></script>

<!-- 구글 폰트 불러오기 -->
<link href='http://fonts.googleapis.com/css?family=Kelly+Slab'
	rel='stylesheet' type='text/css'>
<!-- 부트스트랩, style, grid CSS 불러오기 -->
<link href="./css/bootstrap.css" rel="stylesheet">
<link href="./css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="./css/grid.css" />
<link rel="stylesheet" href="./css/jquery-ui.css">


<title>Portrait</title>
<link rel="shortcut icon" href="./img/portraitfavicon.ico">

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
}

body {
	font-family: '맑은 고딕';
}

<%--input.img_button1 {
        background: url(./images/shareButton.JPG) no-repeat;
        border: none;
        height: 30px;
        cursor: pointer;
        margin-left: 20px;
      }--%>
 
</style>

<c:if test="${requestScope.content != 'peopleView.jsp'}">
	<script src="//code.jquery.com/jquery-1.11.0.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</c:if>


<%-- <c:if test="${requestScope.content == 'photoList.jsp' }">
	<link href="./dist/css/tokenfield-typeahead.css" type="text/css" rel="stylesheet">

    <link href="./dist/css/bootstrap-tokenfield.css" type="text/css" rel="stylesheet">
    <link href="./docs-assets/css/pygments-manni.css" type="text/css" rel="stylesheet">
    <link href="./docs-assets/css/docs.css" type="text/css" rel="stylesheet">
    
    <script type="text/javascript" src="./dist/bootstrap-tokenfield.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./docs-assets/js/scrollspy.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./docs-assets/js/affix.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./docs-assets/js/typeahead.bundle.min.js" charset="UTF-8"></script>
    <script type="text/javascript" src="./docs-assets/js/docs.js" charset="UTF-8"></script>
</c:if> --%>
</head>
<body>
	<div>

		<c:choose>
			<c:when test="${empty albumList}">


				<div id="navbar" class="navbar navbar-static-top">
					<div class="navbar-inner">
						<div class="container">
							<a class="btn btn-navbar" data-toggle="collapse"
								data-target=".nav-collapse"> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</a> <a class="brand" href="index.do">Portrait<span>memories</span>
							</a>
							<div class="nav-collapse collapse pull-right" style="font-family: 'SourceSansProRegular'">
								<ul class="nav">
									<li><a href="about.do">About</a></li>
									<li><a href="services.do">Services</a></li>
									<li class="" style="color: red;">
										<%
											final AuthHelper helper = new AuthHelper();
										out.println("<a href='" + helper.buildLoginUrl() + "&access_type=offline"
												+ "'>LOGIN</a>");
													session.setAttribute("state", helper.getStateToken());
										%>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>

				<div id="navbar" class="navbar navbar-static-top">
					<div class="navbar-inner">
						<div class="container">
							<a class="btn btn-navbar" data-toggle="collapse"
								data-target=".nav-collapse"> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</a><a class="brand" href="home.do">Portrait<span>memories</span>
							</a>
							<div class="nav-collapse collapse pull-right" style="font-family: 'SourceSansProRegular'">
								<ul class="nav">
									<%--<c:if test="${not empty sessionScope.alertList}">
										<li><a href="" data-target="#id" type="button"  data-toggle="modal">
											<input type="button" value="알림!!!" onclick="checkAlram()"></a>
										</li>
									</c:if>
									 --%>
									
									<c:if test="${not empty sessionScope.alertList}">
										<li>
										<a href="javascript:showhide('signpage', 'itxOverlay')">
										<span class="icn_new"><font style="color: rgb(255, 155, 0)">New!!</font></span>	
										</a> 
										</li>
									</c:if>
								
									<li><a href="home.do">Home</a></li>
									<li><a href="hello.do">Album</a></li>
									<li><a href="timeLinePage.do">TimeLine</a></li>
									<li><a href="peopleView.do">People</a></li>
									<li><a href="locationView.do">Location</a></li>
									<li>
										<a href="javascript:showhide2('signpage1', 'itxOverlay')">
										Upload	
										</a> 
										</li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown"> Share <b class="caret"></b></a>
										<ul class="dropdown-menu" style="width: 250px; height: 180px;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Send to Facebook:
											<li><a href=# style="height: 30px;"><fb:login-button
														scope="public_profile,email,user_photos,publish_actions,read_stream,manage_pages"
														onlogin="checkLoginState();">Facebook
											</fb:login-button>
											</a></li>
											<li>
											
										<hr>
											<form class="form_shareFriends" id="form_shareFriends" name="form_shareFriends" 
												method="post" action="albumView.do" >
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share with Friends
											<input type="text" class="form-control2" width="15px" 
											 style="width: 100px; margin-left: 20px; float: left;" name="receivedUserName" id="receivedUserName"
										value="${photo.peopleText }" placeholder="insert Name"/>
											<div style="float: left;"><input type="button" class="shareFBut" onclick="shareFriends()" value="send" style=" margin-bottom: 10px;">
											</div>
											</form>
											</li>
										</ul></li>
									<li><a href="searchView.do">Search</a></li>
									<li><a href="logout.do">Logout</a></li>
								</ul>
							</div>
							<!--/.nav-collapse -->
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>


	<div>
		<jsp:include page="${content}" />
	</div>

	<%-- 		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
					type="text/javascript"></script> --%>
					
	<script src="js/my_script.js"></script> 
	<script src="${pageContext.request.contextPath}/js/jquery-ui.js"
		type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		/* function search() {
			alert("Location:" + $("#searchByLocation").val());
			alert("Date:" + ($("#from").val()) + "~" + ($("#to").val()));
			alert("People:" + $("#searchByPeole").val());
			alert("Tags:" + $("#searchByTags").val());

		}*/

		
		var icn_blink = setInterval(function(){
			$('span.icn_new').fadeOut('slow').fadeIn('slow');
		}, 1000);
		
		
		
		$("#from, #to ").datepicker({
			changeMonth : true,
			changeYear : true,
			yearRange : '1950:2014'
		}).val(); 

		/////////////////////////////   facebook   ////////////////////////////////////

		function statusChangeCallback(response) {

			if (response.status === 'connected') {
				arrayYo();
			} else if (response.status === 'not_authorized') {
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			} else {
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into Facebook.';
			}
		}

		function checkLoginState() {

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '781081908626486',
				cookie : true,
				xfbml : true,
				version : 'v2.1'
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		function sendPic(a) {

			FB.api("/me/photos", "POST", {
				url : a
			}, function(response) {
				if (response && !response.error) {
					alert('업로드 완료');
				} else {
					alert('error');
				}
			});

		}

		/*   
		  function facebookUploadIt(){
				
				FB.login(function(){},{scope:"public_profile,email,user_photos,publish_actions,read_stream,manage_pages"
					});
				
				checkLoginState();
			} */

		////////////////////////////////////////////////////
		function arrayYo() {

			var ff = document.getElementsByName('photode');
			var gg = document.getElementsByName('urlol');

			var a = [];
			for (i = 0; i < ff.length; i++) {
				if (ff[i].checked) {
					a.push(gg[i].value);
				}
			}
			if (a.length != null) {
				for (i = 0; i < a.length; i++) {
					sendPic(a[i]);
				}
			}
		}


		function shareFriends(){
			
			var chkFirList3 = document.getElementsByName('photode');
			var arrFir3 = new Array();
		
			
			for (i = 0; i < chkFirList3.length; i++) {
				if (chkFirList3[i].checked) {
					arrFir3.push(chkFirList3[i].value);
				}
			};
			
			/* var receivedUserName = document.getElementById('receivedUserName'); */
			
			
			
			if((arrFir3.length)==0){
				
				alert("사진을 선택해주세요.");
				 document.form_shareFriends.action="albumView.do?albumId=${sessionScope.userId}_all"
				$(".form_shareFriends").submit();
				
				
			}
			/*  else if(receivedUserName.val()==null||receivedUserName.val().trim().length()==0){

				alert("수신자명을 선택해주세요.");
				 document.form_shareFriends.action="albumView.do?albumId=${sessionScope.userId}_all"
				$(".form_shareFriends").submit();
				
			}  */
			else{
			
			document.form_shareFriends.action="shareFriends.do?arrFir3=" + arrFir3;
			$(".form_shareFriends").submit();
			}			
		}
		
	</script>

				<div style="margin:auto; width :50%">
<div id="signpage" class="modalPortrait" 
	style="visibility: hidden; zoom: 1; margin:auto; width:50%; opacity: 0; top: 50px; border-radius:20px; z-index: -1000;">
	
	<div class="modalClose">
		<a href="javascript:close()" title="창문 닫기">X</a>
	</div>

	<div class="modalContent" id="modalC" style="margin:auto; opacity:60;border-radius:20px; ">
		<div class="modalTitle">
			<h2 id="signinTitle"><font face="nanum gothic">앨범이 도착했습니다!</font></h2>
		</div>
		<div class="modalInfo" id="modalI">
			<div id="modalP" class="modalPanel" style="height: 100px;">
				 <div id="signinPage">
					
						<c:forEach var="alertList" items="${sessionScope.alertList}">
							<form class="publishForm" id="publishForm" name="publishForm" method="post">
								<font color="white">
									<h3><a name="publishAlbumTitle"><font color="gray" face="nanum gothic">${alertList.publishAlbumTitle}</font></a>
									<input type="hidden" name="publishAlbumId" value="${alertList.publishAlbumId}">
									<input type="button" class="btn2" id="acceptBut" name="acceptBut" value="accept" onclick="acceptPublish()">
									<input type="button" class="btn2" id="denyBut" name="denyBut" value="deny" onclick="denyPublish()"></h3>
									<br>
								</font>
							</form>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
<div id="itxOverlay" class="itxOverlay"
	style="visibility: hidden; zoom: 1; opacity: 0; height: 100vh; z-index: -900; display: none;">
	</div>
	
	<div style="margin:auto; width :50%">
<div id="signpage1" class="modalPortrait" 
	style="visibility: hidden; zoom: 1; margin:auto; width:50%; opacity: 100; top: 50px; border-radius:20px; z-index: -1000;">
	
	<div class="modalClose">
		<a href="javascript:close1()" title="창문 닫기" style="margin-left: 200%; font-size: 3em" >X</a>
	</div>

		<div class="oauthDemo" style="  width : 60vw; hight:70vh; background: url(images/bgnoise.jpg) 50% 0 repeat fixed; border-radius: 50px; margin-left: -7%;">
			<div id="dragandrophandler" style="text-align: center; padding-top: 33vh; padding-bottom: 33vh;color: #333333; font-size: 4em;
			width:60vw; hight:70vh;">
				<h1 id="dragandrophandlerh1">Drag & Drop<br>Photo Files Here</h1><img src="images/drag-icon.png"
					style="margin-right: 0%;" id="dragImg">
			
			</div>
			<br> <br>
			<div id="status1"></div>
		</div>

<%-- 
		<input type="hidden" id="tagList" value="${requestScope.tagList }">
		<input type="hidden" id="peopleList"
			value="${requestScope.peopleList }">
		 --%>
	
	</div>	
</div>

	
	
<script type="text/javascript">
	function acceptPublish(){
		alert("내 앨범에 해당 앨범을 추가합니다.");
		$('.publishForm').attr("action","acceptPublish.do")  
		$(".publishForm").submit();
		
	}
	function denyPublish(){
		alert("앨범 공유를 거절합니다");
		$('.publishForm').attr("action","denyPublish.do")  
		$(".publishForm").submit();
		
		
	}

</script>
	<script>
			//파일을 실제 업로드 하는 함수
			function sendFileToServer(formData, status) {
				var albumId = "${requestScope.albumId }";
				// 여기 업로드할 url을 적어줘야함!!! 접속자의 피카사 url쪽으로 바꿔줘야함!!!
				var uploadURL = "upload.do?albumId=" + albumId;
				/* var uploadURL ="upload.do";  */
				var extraData = {}; //Extra Data.

				var jqXHR = $.ajax({
					xhr : function() {
						var xhrobj = $.ajaxSettings.xhr();
						if (xhrobj.upload) {
							xhrobj.upload.addEventListener('progress',
									function(event) {
										var percent = 0;
										var position = event.loaded
												|| event.position;
										var total = event.total;
										if (event.lengthComputable) {
											percent = Math.ceil(position
													/ total * 100);
										}
										//Set progress
										status.setProgress(percent);
									}, false);
						}
						return xhrobj;
					},
					url : uploadURL,
					type : "POST",
					contentType : false,
					processData : false,
					cache : false,
					data : formData,

					success : function(data) {
						status.setProgress(100);

						$("#status1").append("");

						location.reload(true);

					}
				});

				status.setAbort(jqXHR);
			}

			var rowCount = 0;

			//하단 진행바를 생성하는 함수.
			function createStatusbar(obj) {
				$("#loadingDiv").css('display', 'block');
				$("#loadingImage").css('display', 'block');
				$("#loadingMessage").css('display', 'block');
				$("#dragandrophandlerh1").css('display', 'none');		
				$("#dragImg").css('display', 'none');		
				
				
				rowCount++;
				var row = "odd";
				if (rowCount % 2 == 0)
					row = "even";
				this.statusbar = $("<div class='statusbar1 "+row+"'></div>");
				this.filename = $("<div class='filename1'></div>").appendTo(
						this.statusbar);
				this.size = $("<div class='filesize1'></div>").appendTo(
						this.statusbar);
				this.progressBar = $(
						"<div class='progressBar1'><div></div></div>").appendTo(
						this.statusbar);
				this.abort = $("<div class='abort1'>Abort</div>").appendTo(
						this.statusbar);
				obj.after(this.statusbar);

				//파일 이름은 name 넘어온 값을 넣고 size에는 사이즈 크기를 확인해서 적어준다
				this.setFileNameSize = function(name, size) {
					var sizeStr = "";
					var sizeKB = size / 1024;
					if (parseInt(sizeKB) > 1024) {
						var sizeMB = sizeKB / 1024;
						sizeStr = sizeMB.toFixed(2) + " MB";
					} else {
						sizeStr = sizeKB.toFixed(2) + " KB";
					}

					//this.filename.html(name);
					//this.size.html(sizeStr);
				}

				//진행상태를 100으로 나눠 해당부분만큼 바가 올라가게 하여 100%를 표시하는 함수
				this.setProgress = function(progress) {
					var progressBarWidth = progress * this.progressBar.width()
							/ 100;
					this.progressBar.find('div').animate({
						width : progressBarWidth
					}, 10).html("");

					// 100%가 되면 즉, 완료된다면 abort 버튼을 hide해라
					if (parseInt(progress) >= 100) {
						this.abort.hide();
					}
				}

				//abort 버튼 실행 함수(취소버튼)
				this.setAbort = function(jqxhr) {
					var sb = this.statusbar;
					this.abort.click(function() {
						jqxhr.abort();
						sb.hide();
					});
				}
			}

			//드롭된 파일을 읽어서 formdata타입으로 보내려고 준비해주는 함수
			function handleFileUpload(files, obj) {
				//다수의 파일을 업로드 하기 위해서 files를 for로 돌린다.
				for (var i = 0; i < files.length; i++) {
					//formdata를 생성하고
					var fd = new FormData();
					//file이라는 키값에 실제 file을 담는다
					fd.append('file', files[i]);

					//진행상태창을 만들고
					var status = new createStatusbar(obj); //Using this we can set progress.\
					//진행상태창의 파일이름과 사이즈를 실제 파일이름과 사이즈로 넣고
					status.setFileNameSize(files[i].name, files[i].size);

					//위에서 formdata에 실제 파일을 담은 fd변수를 서버로 전송
					sendFileToServer(fd, status);

				}
			}

			$(document).ready(function() {
				var obj = $("#dragandrophandler");
				obj.on('dragenter', function(e) {
					e.stopPropagation();
					e.preventDefault();
				});

				obj.on('dragover', function(e) {
					e.stopPropagation();
					e.preventDefault();
				});
				obj.on('drop', function(e) {
					e.preventDefault();
					var files = e.originalEvent.dataTransfer.files;

					//파일을 formdata타입으로 만들고 그것을 서버로 전송하고자 시작함수를 쓴것
					handleFileUpload(files, obj);
				});

				$(document).on('dragenter', function(e) {
					e.stopPropagation();
					e.preventDefault();
				});
				$(document).on('dragover', function(e) {
					e.stopPropagation();
					e.preventDefault();
					
				});
				$(document).on('drop', function(e) {
					e.stopPropagation();
					e.preventDefault();
				});

			});
		</script>

	<script type="text/javascript" src="js/jquery.elastislide.min.js"></script>
	<!-- Gallery Section-->
	<script type="text/javascript" src="js/jquery.kinetic.min.js"></script>
	<script src="js/lean-slider.min.js"></script>
	<script src="js/jquery.parallax-1.1.3.min.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script type="text/javascript" src="js/jquery-hover-effect.min.js"></script>
	<script>
		//Element.hide('ajaxBox');
	</script>
</body>
</html>