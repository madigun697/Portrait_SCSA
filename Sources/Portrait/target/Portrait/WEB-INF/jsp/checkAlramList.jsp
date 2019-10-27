<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
	<c:forEach var="alertList" items="${sessionScope.alertList}">
		<form class="publishForm" id="publishForm" name="publishForm" method="post">
			<font color="white">
				<a name="publishAlbumTitle">${alertList.publishAlbumTitle}</a>
				<input type="hidden" name="publishAlbumId" value="${alertList.publishAlbumId}">
				<input type="button" id="acceptBut" name="acceptBut" value="accept" onclick="acceptPublish()">
				<input type="button" id="denyBut" name="denyBut" value="deny" onclick="denyPublish()">
				<br>
			</font>
		</form>
	</c:forEach>
</center>

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

</body>
</html>