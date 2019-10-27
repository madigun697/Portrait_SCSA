<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		body {
			background-image: url(./images/error.png);
			background-size: cover;
			}
			
		.homeBut{
			margin-top: 500px;
			margin-right: 80px;
			-webkit-border-radius: 8;
		  -moz-border-radius: 8;
		  border-radius: 8px;
		  font-family: Arial;
		  color: #637039;
		  font-size: 13px;
		  background: #e4e8f0;
		  padding: 8px 10px 7px 10px;
		  text-decoration: none;
		  font-weight: bold;
		}
	</style>


</head>
<body>

	<button class="homeBut" onclick="gohome()" style="float: right;"> 홈으로 가기</button>

<script type="text/javascript">
	function gohome(){
		location.href="home.do";		
	}
</script>

</body>
</html>