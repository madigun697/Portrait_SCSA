<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Portrait</title>

<link href='http://fonts.googleapis.com/css?family=Kelly+Slab'
	rel='stylesheet' type='text/css'>
<link href="css/reset.css" rel="stylesheet">
<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet" />
<link href="css/font-awesome.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/search/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/search/demo.css" />
<link rel="stylesheet" type="text/css" href="css/search/component.css" />

<link href="./dist/css/tokenfield-typeahead.css" type="text/css"
	rel="stylesheet">
<link href="./dist/css/bootstrap-tokenfield.css" type="text/css"
	rel="stylesheet">
<link href="./docs-assets/css/pygments-manni.css" type="text/css"
	rel="stylesheet">
<link href="./docs-assets/css/docs.css" type="text/css" rel="stylesheet">

<script type="text/javascript" src="./dist/bootstrap-tokenfield.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="./docs-assets/js/scrollspy.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="./docs-assets/js/affix.js"
	charset="UTF-8"></script>
<script type="text/javascript"
	src="./docs-assets/js/typeahead.bundle.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="./docs-assets/js/docs.js"
	charset="UTF-8"></script>

</head>

<script type="text/javascript">
	function setSearch(box, sid, name) {
		var searchInput = document.getElementById("morphsearch-div");
		var searchWord = document.getElementById("searchWord");
		var selected = sid;
		var name = name;

		if (box.checked) {
			searchWord.setAttribute("style", "visibility:hidden");
			var addedButton = document.createElement("input");
			addedButton.setAttribute("id", "keyWord_Frm" + sid);
			if (sid.substring(1, 2) == "p") {
				addedButton.setAttribute("name", "people");
			} else if (sid.substring(1, 2) == "t") {
				addedButton.setAttribute("name", "tag");
			} else if (sid.substring(1, 2) == "g") {
				addedButton.setAttribute("name", "geo");
			}
			addedButton.setAttribute("class", "btn btn-nephritis");
			addedButton.setAttribute("value", name);
			addedButton.setAttribute("type", "text");
			addedButton.setAttribute("style",
					"margin-bottom:3px; margin-right:3px");
			addedButton.setAttribute("onclick", "buttonRemove('" + sid + "')");
			searchInput.appendChild(addedButton);
		} else {
			var thisDiv = document.getElementById("keyWord_Frm" + sid);
			searchInput.removeChild(thisDiv);
		}
	}
	function buttonRemove(sid) {
		var sid = sid;
		var searchInput = document.getElementById("morphsearch-div");
		var thisDiv = document.getElementById("keyWord_Frm" + sid);
		var checkBox = document.getElementById(sid);
		checkBox.checked = false;
		searchInput.removeChild(thisDiv);

	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function searchPeopleList() {
						$("#tokenfield2")
								.keyup(
										function() {
											$("#allPeopleList").hide();
											var peopleInput = $("#tokenfield2")
													.val();
											if (peopleInput != '') {
												$
														.ajax({
															type : "post",
															url : "searchPeopleList.do",
															data : {
																peopleName : peopleInput
															},
															dataType : "json",
															error : function(
																	xhr,
																	status,
																	message) {
																alert("status : "
																		+ status
																		+ "/ error : "
																		+ message);
															},
															success : function(
																	data) {
																//리스트 형식의 데이터를 받아온다.
																$(
																		"#resultPeople")
																		.empty();
																$
																		.each(
																				data,
																				function(
																						index,
																						element) {
																					var itemHtml = [

																					"<a class=\"dummy-media-object\"" 
										+" name='element'><input type='checkbox' value='"
																							+ element.peopleName
																							+ "' id="
																							+ index
																							+ "people"
																							+ " onclick=\"setSearch(this,'"
																							+ index
																							+ "people"
																							+ "' , '"
																							+ element.peopleName
																							+ "')\">"
																							+ "<img class ='round' src='"+element.photoUrl+"' alt='"+  element.peopleName+
										"'> <span style='color:black;'>"
																							+ element.peopleName
																							+ "</span></a>" ]
																							.join();

																					$(
																							"#resultPeople")
																							.append(
																									itemHtml);
																				});
															}
														});
											} else {
												$('#resultPeople').html("");
												$("#allPeopleList").show();
											}
										});
					});
</script>
<script type="text/javascript">
	$(document)
			.ready(

					function searchTagList() {
						$("#tokenfield3")
								.keyup(
										function() {
											$("#allTagList").hide();
											var tagInput = $("#tokenfield3")
													.val();
											if (tagInput != '') {
												$
														.ajax({
															type : "post",
															url : "searchTagList.do",
															data : {
																tagName : tagInput
															},
															dataType : "json",
															error : function(
																	xhr,
																	status,
																	message) {
																alert("status : "
																		+ status
																		+ " / error : "
																		+ message);
															},
															success : function(
																	data) {

																$("#resultTag")
																		.empty();
																$
																		.each(
																				data,
																				function(
																						index,
																						element) {

																					var itemHtml = [ "<a class=\"dummy-media-object\"" 
										+" name='element.tagName'><input type='checkbox' value='"
																							+ element.tagName
																							+ "' id="
																							+ index
																							+ "tag"
																							+ " onclick=\"setSearch(this,'"
																							+ index
																							+ "tag"
																							+ "' , '"
																							+ element.tagName
																							+ "')\">"
																							+ "<img src='images/tag_icon.png' alt='"+ element.tagName+
										"'> <span style='color:black;'>"
																							+ element.tagName
																							+ "</span></a>" ]
																							.join();

																					$(
																							"#resultTag")
																							.append(
																									itemHtml);
																				});
															}
														});
											} else {
												$('#resultTag').html("");
												$("#allTagList").show();
											}

										});
					});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function searchLocationList() {
						$("#tokenfield4")
								.keyup(
										function() {
											$("#allLocationList").hide();
											var locationInput = $(
													"#tokenfield4").val();
											if (locationInput != '') {
												$
														.ajax({
															type : "post",
															url : "searchLocationList.do",
															data : {
																locationName : locationInput
															},
															dataType : "json",
															error : function(
																	xhr,
																	status,
																	message) {
																
															},
															success : function(
																	data) {
																$(
																		"#resultLocation")
																		.empty();
																$
																		.each(
																				data,
																				function(
																						index,
																						element) {
																					var itemHtml = [ "<a class=\"dummy-media-object\"" 
									+" name='element'><input type='checkbox' value='"
																							+ element
																							+ "' id="
																							+ index
																							+ "location"
																							+ " onclick=\"setSearch(this,'"
																							+ index
																							+ "location"
																							+ "' , '"
																							+ element
																							+ "')\">"
																							+ "<img src='images/location_icon.png' alt='"+ element+
									"'> <span style='color:black;'>"
																							+ element
																							+ "</span></a>" ]
																							.join();
																					$(
																							"#resultLocation")
																							.append(
																									itemHtml);
																				});
															}
														});
											} else {
												$('#resultLocation').html("");
												$("#allLocationList").show();
											}
										});
					});
</script>
<style>
@import
	url( http://ts.daumcdn.net/custom/blog/0/606/skin/images/nanumgothic.css)
	;

.container2 {
	font-family: 'Nanum Gothic', Sans-serif;
	letter-spacing: -2px;
}
</style>

<body>

	<div class="container2">

		<div id="morphsearch" class="morphsearch open" style="height: 500px">
			<center>

					<!-- 	<input class="morphsearch-input" type="search" placeholder="Search"
						id="morphsearch-input" name="morphsearch-input" /> -->
				<form id="searchKeyword" class="morphsearch-form" action="searchResultView.do" method="post" style="padding-right:10%; margin-top: -17%; padding-top: 5%; margin-bottom: 2%; margin-left: 10%; width:70%; background-color: rgba(255,255,255,0.7) 
				; border-radius: 20px;" >
				<div id="morphsearch-div"><a id="searchWord" style="color: lightgray; font-size: 2em; margin-left: 15%;">검색할 단어를 하단에서 체크해주세요</a></div>
					<input class="morphsearch-submit" type="submit" value="Search" onclick="javascript:searchKeyword()"
					style="margin-top: 0%; width: 80px;  margin-left: 75%; margin-right: -15%">
				
				</form>
			</center>

			<div class="morphsearch-content">
				<div
					style="margin-top: -120px; margin-left: 0px; margin-bottom: 20px;">
					<h1
						style="margin-left: -500px; margin-top: -20px; margin-bottom: 40px;">Date</h1>
					<table>
						<tr align="center">
							<td><h1>Date</h1></td>
							<td width="auto;">&nbsp&nbsp <input type="text" id="from"
								class="span2 search-query" style="height: 30px;"> ~ <input
								type="text" id="to" class="span2 search-query"
								style="height: 30px;" /><br></td>
							<td><input type="checkbox"
								onclick="search(this, 'dataCheck')" value="확인" id="dataCheck"
								style="margin-left: 10px;"></td>
						</tr>
					</table>
				</div>

				<div class="dummy-column" style="margin-left: 0;">
					<input type="hidden" id="tagList" value="${requestScope.tagList}">
					<input type="hidden" id="peopleList"
						value="${requestScope.peopleList}">

					<h1>People</h1>

					<%-- <input type="text" class="form-control2" name="peopleCnt"
						value="${photo.peopleText}" id="tokenfield2-${status.index}"
						placeholder="이름을 입력하세요" style="width: 299px" /> --%>
					<form>
						<input type="text" name="peopleCnt2" id="tokenfield2"
							placeholder="이름을 입력하세요" style="width: 299px" />
					</form>
					<div id="resultPeople"></div>

					<div id="allPeopleList">
						<c:forEach items="${requestScope.peopleCntList}" var="peopleCnt"
							varStatus="status">
							<a class="dummy-media-object" name="element"> <input
								type="checkbox" id="${status.index}people"
								value="${peopleCnt.peopleName}"
								onclick="setSearch(this, '${status.index}people', '${peopleCnt.peopleName}')">
								<img class="round" src="${peopleCnt.photoUrl}"
								alt="${peopleCnt.peopleName}" /> <span style="color: gray;">${peopleCnt.peopleName}</span>
							</a>
						</c:forEach>
					</div>

				</div>
				<div class="dummy-column" style="margin-right: 5%;">
					<h1>Tags</h1>
					<%-- <input type="text" class="form-control"
						id="tokenfield-${status.index}" name="tagsSearch"
						placeholder="태그를 입력하세요" style="width: 299px"> --%>
					<form>
						<input type="text" name="tokenfield3" id="tokenfield3"
							placeholder="태그를 입력하세요" style="width: 299px" />
					</form>
					<div id="resultTag"></div>

					<div id="allTagList">
						<c:forEach items="${requestScope.tagListArr}" var="tag"
							varStatus="status">
							<a class="dummy-media-object"> <input type="checkbox"
								value="${tag.tagName}" id="${status.index}tag"
								onclick="setSearch(this, '${status.index}tag', '${tag.tagName}')">
								<img src="images/tag_icon.png" alt="${tag.tagName}" /> <span
								style="color: gray;">${tag.tagName}</span>
							</a>
						</c:forEach>
					</div>

				</div>
				<div class="dummy-column">
					<h1>Location</h1>
					<form>
						<input type="text" name="tokenfield4" id="tokenfield4"
							placeholder="장소를 입력하세요" style="width: 299px" />
					</form>
					<div id="resultLocation"></div>
					<div id="allLocationList">
						<c:forEach items="${requestScope.keySet}" var="geo"
							varStatus="status">
							<a class="dummy-media-object"> <input type="checkbox"
								value="${geo}" id="${status.index}geo"
								onclick="setSearch(this, '${status.index}geo', '${geo}')">
								<img src="images/location_icon.png" alt="${geo}" /> <span
								style="color: gray;">${geo}</span>
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /morphsearch-content -->
			<span class="morphsearch-close"></span>
		</div>
	</div>

	<script src="js/classie.js"></script>
	<script>
		(function() {
			var morphSearch = document.getElementById('morphsearch'), input = morphSearch
					.querySelector('input.morphsearch-input'), ctrlClose = morphSearch
					.querySelector('span.morphsearch-close'), isOpen = isAnimating = false,
			// show/hide search area
			toggleSearch = function(evt) {
				// return if open and the input gets focused
				if (evt.type.toLowerCase() === 'focus' && isOpen)
					return false;

				var offsets = morphsearch.getBoundingClientRect();
				if (isOpen) {
					classie.remove(morphSearch, 'open');

					// trick to hide input text once the search overlay closes 
					// todo: hardcoded times, should be done after transition ends
					if (input.value !== '') {
						setTimeout(function() {
							classie.add(morphSearch, 'hideInput');
							setTimeout(function() {
								classie.remove(morphSearch, 'hideInput');
								input.value = '';
							}, 300);
						}, 500);
					}

					input.blur();
				} else {
					classie.add(morphSearch, 'open');
				}
				isOpen = !isOpen;
			};

			// events
			//input.addEventListener('focus', toggleSearch);
			ctrlClose.addEventListener('click', toggleSearch);
			// esc key closes search overlay
			// keyboard navigation events
			document.addEventListener('keydown', function(ev) {
				var keyCode = ev.keyCode || ev.which;
				if (keyCode === 27 && isOpen) {
					toggleSearch(ev);
				}
			});

			/***** for demo purposes only: don't allow to submit the form *****/
			morphSearch.querySelector('button[type="submit"]')
					.addEventListener('click', function(ev) {
						ev.preventDefault();
					});
		})();
	</script>
	<script type="text/javascript">
		function search(box, dateId) {
			var searchInput = document.getElementById("morphsearch-div");
			var date = ($("#from").val()) + "~" + ($("#to").val());

			if (box.checked) {
				if ($("#from").val() != '' || $("#to").val() != '') {
					if ($("#from").val() <= $("#to").val()) {
						var addedButton = document.createElement("input");
						var dataId = "keyWord_frm" + dateId;
						addedButton.setAttribute("id", dataId);
						addedButton.setAttribute("name", "date");
						addedButton.setAttribute("class", "btn btn-nephritis");
						addedButton.setAttribute("value", date);
						addedButton.setAttribute("type", "text");
						addedButton.setAttribute("style",
								"margin-bottom:3px; margin-right:3px");
						addedButton.setAttribute("onclick", "buttonRemove1('"
								+ dateId + "')");
						searchInput.appendChild(addedButton);
					} else {
						alert("기간 설정이 올바르지 않습니다");
						/* 	$("#from").empty();
							$("#to").empty(); 
							var checkBox = document.getElementById(dataId);
							checkBox.checked = false;*/
						return;
					}
				} else {
					alert("정확한 날짜를 입력해주세요.");
					return;
				}
			} else {
				var thisDiv = document.getElementById(dateId);
				searchInput.removeChild(thisDiv);
			}
		}

		function buttonRemove1(id) {
			var searchInput = document.getElementById("morphsearch-div");
			var thisDiv = document.getElementById("keyWord_frm" + id);
			var checkBox = document.getElementById(id);
			checkBox.checked = false;
			searchInput.removeChild(thisDiv);
		}

		function searchKeyword() {

			var tagkeywordList = document.getElementsByName('tag');
			var peopleKeywordList = document.getElementsByName('people');
			var geoKeywordList = document.getElementsByName('geo');
			var dateKeywordList = document.getElementsByName('date');

			var tagArr = new Array();
			var peopleArr = new Array();
			var geoArr = new Array();
			var dateArr = new Array();

			for (i = 0; i < tagkeywordList.length; i++) {
				tagArr.push(tagkeywordList[i].value);
			}
			for (i = 0; i < peopleKeywordList.length; i++) {
				peopleArr.push(peopleKeywordList[i].value);
			}
			for (i = 0; i < geoKeywordList.length; i++) {
				geoArr.push(geoKeywordList[i].value);
			}
			for (i = 0; i < dateKeywordList.length; i++) {
				dateArr.push(dateKeywordList[i].value);
			}

			document.getElementById("searchKeyword").action = "searchResultView.do?tagArr="
					+ tagArr
					+ "&peopleArr="
					+ peopleArr
					+ "&geoArr="
					+ geoArr
					+ "&dateArr=" + dateArr;
		}
	</script>
</body>
</html>