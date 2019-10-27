<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Portrait</title>

<link rel="shortcut icon" href="./img/portraitfavicon.ico">
<link href="css/reset.css" rel="stylesheet">
<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	background: url(images/bgnoise.jpg) 50% 0 repeat fixed;
}

.oauthDemo a {
	display: block;
	border-style: solid;
	border-color: #bbb #888 #666 #aaa;
	border-width: 1px 2px 2px 1px;
	background: #ccc;
	color: #333;
	line-height: 2;
	text-align: center;
	text-decoration: none;
	font-weight: 900;
}

.oauthDemo pre {
	background: #ccc;
}

.oauthDemo a:active {
	border-color: #666 #aaa #bbb #888;
	border-width: 2px 1px 1px 2px;
	color: #000;
}

.readme {
	padding: .5em;
	background-color: #F9AD81;
	color: #333;
}

#loadingDiv {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 9999;
	text-align: center;
}

#loadingImage {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100000;
}

#loadingMessage{
	font-size: 25spx;
}

#dragandrophandler {
	border: 2px dotted #717171;
	border-radius: 75px;
	width: 80%;
	height: 400px;
	color: #575757;
	text-align: middle;
	vertical-align: middle;
	padding: 10px 10px 10px 10px;
	margin-bottom: 10px;
	padding-top: 15%;
	margin-top: 5%;
	font-size: 500%;
	line-height: normal;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	border-top: 1px solid #A9CCD1;
	min-height: 25px;
	width: 700px;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 250px;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}

#ajaxBox {
	border: 3px solid #000000;
	width: 300px;
	height: 50px;
	position: absolute;
	background-color: #ffffff;
	text-align: center;
	font-weight: bold;
	padding: 20px 0px 0px 0px;
	color: #FF6600;
}
</style>

<link href="./dist/css/tokenfield-typeahead.css" type="text/css"
	rel="stylesheet">
<link href="./dist/css/bootstrap-tokenfield.css" type="text/css"
	rel="stylesheet">
<link href="./docs-assets/css/pygments-manni.css" type="text/css"
	rel="stylesheet">
<link href="./docs-assets/css/docs.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="./docs-assets/js/docs.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="./dist/bootstrap-tokenfield.js"
	charset="UTF-8"></script>
<!-- <script type="text/javascript" src="./docs-assets/js/scrollspy.js" charset="UTF-8"></script> -->
<!-- <script type="text/javascript" src="./docs-assets/js/affix.js" charset="UTF-8"></script> -->
<!-- <script type="text/javascript" src="./docs-assets/js/typeahead.bundle.min.js" charset="UTF-8"></script> -->
</head>
<body>
	<script type="text/javascript">
		function loading_st() {
			var loadingDiv = document.getElementById('loadingDiv');
			 var loadingImage = document.getElementById('loadingImage');
			 loadingDiv.style.display = 'block';
			 loadingImage.style.display = 'block'; 
		}
		function loading_ed() {
			var loadingDiv = document.getElementById('loadingDiv');
			 var loadingImage = document.getElementById('loadingImage');
			 loadingDiv.style.display = 'none';
			 loadingImage.style.display = 'none';
		}
		loading_st();
		window.onload = loading_ed;
	</script>
	<center>
		<div id="loadingDiv" style="display: none;">
			<img src="./images/ajax-loader.gif" id="loadingImage"
				style="margin-right: 0%; display: none;"  >
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<h2><a id="loadingMessage" style="font-family: 'nanum gothic'; letter-spacing: -1px; background-color: black;">사진을 업로드 하고 있습니다. 잠시만 기다려주세요.</a></h2>
		</div>
		<div class="oauthDemo">
			<div id="dragandrophandler" style="width: 600px;">
				Drag & Drop<br>Photo Files Here <img src="images/drag-icon.png"
					style="margin-right: 0%;">
			</div>
			<br> <br>
			<div id="status1"></div>
		</div>

		<input type="hidden" id="tagList" value="${requestScope.tagList }">
		<input type="hidden" id="peopleList"
			value="${requestScope.peopleList }">
		
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

						$("#status1").append("File upload Done<br>");

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
				rowCount++;
				var row = "odd";
				if (rowCount % 2 == 0)
					row = "even";
				this.statusbar = $("<div class='statusbar "+row+"'></div>");
				this.filename = $("<div class='filename'></div>").appendTo(
						this.statusbar);
				this.size = $("<div class='filesize'></div>").appendTo(
						this.statusbar);
				this.progressBar = $(
						"<div class='progressBar'><div></div></div>").appendTo(
						this.statusbar);
				this.abort = $("<div class='abort'>Abort</div>").appendTo(
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

					this.filename.html(name);
					this.size.html(sizeStr);
				}

				//진행상태를 100으로 나눠 해당부분만큼 바가 올라가게 하여 100%를 표시하는 함수
				this.setProgress = function(progress) {
					var progressBarWidth = progress * this.progressBar.width()
							/ 100;
					this.progressBar.find('div').animate({
						width : progressBarWidth
					}, 10).html(progress + "% ");

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
					$(this).css('border', '2px solid #0B85A1');
				});

				obj.on('dragover', function(e) {
					e.stopPropagation();
					e.preventDefault();
				});
				obj.on('drop', function(e) {
					$(this).css('border', '2px dotted #0B85A1');
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
					obj.css('border', '2px dotted #0B85A1');
				});
				$(document).on('drop', function(e) {
					e.stopPropagation();
					e.preventDefault();
				});

			});
		</script>
	</center>
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