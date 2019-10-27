<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.stage {
  position: relative;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  height: 460px;
  width: 100%;
  max-width : 100%;
}

.avatar {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  height: 100px;
  width: 100px;
  background-repeat: no-repeat;
  background-size: cover;
  border-radius: 50%;
	border : 5px red;
  -webkit-transform-origin: center;
      -ms-transform-origin: center;
          transform-origin: center;
            max-width : 100%;
}

.avatar:nth-of-type(1) {
  -webkit-animation: ani1 2s 0.1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani1 2s 0.1s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani1 {
  0%, 20% {
    -webkit-transform: rotate(45deg) translate(0) rotate(-45deg);
            transform: rotate(45deg) translate(0) rotate(-45deg);
  }
  34%, 100% {
    -webkit-transform: rotate(45deg) translate(208px) rotate(-45deg);
            transform: rotate(45deg) translate(208px) rotate(-45deg);
  }
}
@keyframes ani1 {
  0%, 20% {
    -webkit-transform: rotate(45deg) translate(0) rotate(-45deg);
            transform: rotate(45deg) translate(0) rotate(-45deg);
  }
  34%, 100% {
    -webkit-transform: rotate(45deg) translate(208px) rotate(-45deg);
            transform: rotate(45deg) translate(208px) rotate(-45deg);
  }
}
.avatar:nth-of-type(2) {
  -webkit-animation: ani2 2s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani2 2s 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani2 {
  0%, 20% {
    -webkit-transform: rotate(90deg) translate(0) rotate(-90deg);
            transform: rotate(90deg) translate(0) rotate(-90deg);
  }
  34%, 100% {
    -webkit-transform: rotate(90deg) translate(208px) rotate(-90deg);
            transform: rotate(90deg) translate(208px) rotate(-90deg);
  }
}
@keyframes ani2 {
  0%, 20% {
    -webkit-transform: rotate(90deg) translate(0) rotate(-90deg);
            transform: rotate(90deg) translate(0) rotate(-90deg);
  }
  34%, 100% {
    -webkit-transform: rotate(90deg) translate(208px) rotate(-90deg);
            transform: rotate(90deg) translate(208px) rotate(-90deg);
  }
}
.avatar:nth-of-type(3) {
  -webkit-animation: ani3 2s 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani3 2s 0.3s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani3 {
  0%, 20% {
    -webkit-transform: rotate(135deg) translate(0) rotate(-135deg);
            transform: rotate(135deg) translate(0) rotate(-135deg);
  }
  34%, 100% {
    -webkit-transform: rotate(135deg) translate(208px) rotate(-135deg);
            transform: rotate(135deg) translate(208px) rotate(-135deg);
  }
}
@keyframes ani3 {
  0%, 20% {
    -webkit-transform: rotate(135deg) translate(0) rotate(-135deg);
            transform: rotate(135deg) translate(0) rotate(-135deg);
  }
  34%, 100% {
    -webkit-transform: rotate(135deg) translate(208px) rotate(-135deg);
            transform: rotate(135deg) translate(208px) rotate(-135deg);
  }
}
.avatar:nth-of-type(4) {
  -webkit-animation: ani4 2s 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani4 2s 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani4 {
  0%, 20% {
    -webkit-transform: rotate(180deg) translate(0) rotate(-180deg);
            transform: rotate(180deg) translate(0) rotate(-180deg);
  }
  34%, 100% {
    -webkit-transform: rotate(180deg) translate(208px) rotate(-180deg);
            transform: rotate(180deg) translate(208px) rotate(-180deg);
  }
}
@keyframes ani4 {
  0%, 20% {
    -webkit-transform: rotate(180deg) translate(0) rotate(-180deg);
            transform: rotate(180deg) translate(0) rotate(-180deg);
  }
  34%, 100% {
    -webkit-transform: rotate(180deg) translate(208px) rotate(-180deg);
            transform: rotate(180deg) translate(208px) rotate(-180deg);
  }
}
.avatar:nth-of-type(5) {
  -webkit-animation: ani5 2s 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani5 2s 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani5 {
  0%, 20% {
    -webkit-transform: rotate(225deg) translate(0) rotate(-225deg);
            transform: rotate(225deg) translate(0) rotate(-225deg);
  }
  34%, 100% {
    -webkit-transform: rotate(225deg) translate(208px) rotate(-225deg);
            transform: rotate(225deg) translate(208px) rotate(-225deg);
  }
}
@keyframes ani5 {
  0%, 20% {
    -webkit-transform: rotate(225deg) translate(0) rotate(-225deg);
            transform: rotate(225deg) translate(0) rotate(-225deg);
  }
  34%, 100% {
    -webkit-transform: rotate(225deg) translate(208px) rotate(-225deg);
            transform: rotate(225deg) translate(208px) rotate(-225deg);
  }
}
.avatar:nth-of-type(6) {
  -webkit-animation: ani6 2s 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani6 2s 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani6 {
  0%, 20% {
    -webkit-transform: rotate(270deg) translate(0) rotate(-270deg);
            transform: rotate(270deg) translate(0) rotate(-270deg);
  }
  34%, 100% {
    -webkit-transform: rotate(270deg) translate(208px) rotate(-270deg);
            transform: rotate(270deg) translate(208px) rotate(-270deg);
  }
}
@keyframes ani6 {
  0%, 20% {
    -webkit-transform: rotate(270deg) translate(0) rotate(-270deg);
            transform: rotate(270deg) translate(0) rotate(-270deg);
  }
  34%, 100% {
    -webkit-transform: rotate(270deg) translate(208px) rotate(-270deg);
            transform: rotate(270deg) translate(208px) rotate(-270deg);
  }
}
.avatar:nth-of-type(7) {
  -webkit-animation: ani7 2s 0.7s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani7 2s 0.7s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani7 {
  0%, 20% {
    -webkit-transform: rotate(315deg) translate(0) rotate(-315deg);
            transform: rotate(315deg) translate(0) rotate(-315deg);
  }
  34%, 100% {
    -webkit-transform: rotate(315deg) translate(208px) rotate(-315deg);
            transform: rotate(315deg) translate(208px) rotate(-315deg);
  }
}
@keyframes ani7 {
  0%, 20% {
    -webkit-transform: rotate(315deg) translate(0) rotate(-315deg);
            transform: rotate(315deg) translate(0) rotate(-315deg);
  }
  34%, 100% {
    -webkit-transform: rotate(315deg) translate(208px) rotate(-315deg);
            transform: rotate(315deg) translate(208px) rotate(-315deg);
  }
}
.avatar:nth-of-type(8) {
  -webkit-animation: ani8 2s 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: ani8 2s 0.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
@-webkit-keyframes ani8 {
  0%, 20% {
    -webkit-transform: rotate(360deg) translate(0) rotate(-360deg);
            transform: rotate(360deg) translate(0) rotate(-360deg);
  }
  34%, 100% {
    -webkit-transform: rotate(360deg) translate(208px) rotate(-360deg);
            transform: rotate(360deg) translate(208px) rotate(-360deg);
  }
}
@keyframes ani8 {
  0%, 20% {
    -webkit-transform: rotate(360deg) translate(0) rotate(-360deg);
            transform: rotate(360deg) translate(0) rotate(-360deg);
  }
  34%, 100% {
    -webkit-transform: rotate(360deg) translate(208px) rotate(-360deg);
            transform: rotate(360deg) translate(208px) rotate(-360deg);
  }
}
.avatar:nth-of-type(4):before, .avatar:nth-of-type(2):before {
  -webkit-animation: bounce 3s 1.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 1.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 1.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 1.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.avatar:nth-of-type(7):before {
  -webkit-animation: bounce 3s 2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.avatar:nth-of-type(3):before {
  -webkit-animation: bounce 3s 2.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 2.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 2.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 2.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.avatar:nth-of-type(1):before {
  -webkit-animation: bounce 3s 3s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 3s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 3s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 3s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.avatar:nth-of-type(6):before {
  -webkit-animation: bounce 3s 3.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 3.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 3.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 3.2s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.avatar:nth-of-type(5):before {
  -webkit-animation: bounce 3s 3.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 3.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 3.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 3.8s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}
.avatar:nth-of-type(8):before {
  -webkit-animation: bounce 3s 4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 3s 4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards, colorchange 1s 4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}

.image {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  height: 220px;
  width: 220px;
   max-width : 100%;
}
.image img {
  position: relative;
  height: 220px;
  width: 220px;
  border-radius: 50%;
  z-index: 1;
  max-width : 100%;
}
.image:before {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  content: '';
  height: 100%;
  width: 100%;
  background: #f9fff7;
  border: 3px solid #e7f5d1;
  border-radius: 50%;
  -webkit-animation: pulse 1s 1.4s ease-out;
          animation: pulse 1s 1.4s ease-out;
  -webkit-animation-iteration-count: 3;
          animation-iteration-count: 3;
}

.image .smiley svg {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
    max-width : 100%;
  -webkit-animation: bounce 5s 0.075s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
          animation: bounce 5s 0.075s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}

@-webkit-keyframes bounce {
  0% {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  5% {
    -webkit-transform: scale(1.5);
            transform: scale(1.5);
  }
  10%, 100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

@keyframes bounce {
  0% {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  5% {
    -webkit-transform: scale(1.5);
            transform: scale(1.5);
  }
  10%, 100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@-webkit-keyframes pulse {
  0% {
    -webkit-transform: scale(0.1, 0.1);
            transform: scale(0.1, 0.1);
    opacity: 0.0;
  }
  50% {
    opacity: 1.0;
  }
  100% {
    -webkit-transform: scale(3);
            transform: scale(3);
    opacity: 0.0;
  }
}
@keyframes pulse {
  0% {
    -webkit-transform: scale(0.1, 0.1);
            transform: scale(0.1, 0.1);
    opacity: 0.0;
  }
  50% {
    opacity: 1.0;
  }
  100% {
    -webkit-transform: scale(3);
            transform: scale(3);
    opacity: 0.0;
  }
}
@-webkit-keyframes colorchange {
  0% {
    background: #bec4bc;
  }
  100% {
    background: #b5e763;
  }
}
@keyframes colorchange {
  0% {
    background: #bec4bc;
  }
  100% {
    background: #b5e763;
  }
}
.avatar:nth-of-type(1) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/nandini_m/128.jpg");
}

.avatar:nth-of-type(2) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/rasagy/128.jpg");
}

.avatar:nth-of-type(3) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/geeftvorm/128.jpg");
}

.avatar:nth-of-type(4) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/VinThomas/128.jpg");
}

.avatar:nth-of-type(5) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/ladylexy/128.jpg");
}

.avatar:nth-of-type(6) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/claudioguglieri/128.jpg");
}

.avatar:nth-of-type(7) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/jina/128.jpg");
}

.avatar:nth-of-type(8) {
  background-image: url("https://s3.amazonaws.com/uifaces/faces/twitter/peterme/128.jpg");
}
body{
background: url('images/bgnoise.jpg') 50% 0 repeat fixed;
}

@media screen and (max-width:480px) {

body{
width : 100%;
}

.wordsDiv{
width : 100%;
max-width :100%
}

.stage{
width : 100%;
max-width :100%
}

}
      
</style>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href='http://fonts.googleapis.com/css?family=Kelly+Slab' rel='stylesheet' type='text/css'>
<link href="css/reset.css" rel="stylesheet"> 
<link href="css/parallax_style_1.1.3.css" rel="stylesheet" />
<link href="css/style.css" rel="stylesheet" />
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">

<title></title>
<body>
<center>
<div id="wordsDiv" style="margin-bottom: 20%;">
	<h1 style="margin-top: 5%; margin-bottom: 5%; font-family: 'tommasoregular'">
			About People <small style="color:">// AND WHO MAKE YOU
				BRILLIANT</small></h1>
	<div class='stage' style="margin-top: 7%">
		<div class='image'>
			<img
				src="https://pbs.twimg.com/profile_images/529224080751202304/UNLt5nUZ_400x400.jpeg">
			<div class='smiley'>
				<svg width="30px" height="30px">
				<path fill="#effedd"
					d="M15,0C6.7,0,0,6.7,0,15c0,8.3,6.7,15,15,15s15-6.7,15-15C30,6.7,23.3,0,15,0z M20.5,8c1.4,0,2.5,1.1,2.5,2.5c0,1.4-1.1,2.5-2.5,2.5S18,11.9,18,10.5C18,9.1,19.1,8,20.5,8z M10.5,8c1.4,0,2.5,1.1,2.5,2.5c0,1.4-1.1,2.5-2.5,2.5S8,11.9,8,10.5C8,9.1,9.1,8,10.5,8z M15,26c-5,0-9-4-9-9h3c0,3.3,2.7,6,6,6s6-2.7,6-6h3C24,22,20,26,15,26z" /></svg>
			</div>
		</div>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
		<figure class='avatar'></figure>
	</div>
</div>
</center>
</body>
</html>