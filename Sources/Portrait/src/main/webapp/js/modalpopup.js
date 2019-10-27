/**
 * @param obj1 : modal팝업으로 표시되어야 할 부분
 * @param obj2 : modal팝업 표시 시 배경을 반투명처리해주기 위한 영역
 * 숨겨져 있던 내용이 마치 팝업처럼 표시(modal팝업)되고, 다시 숨겨지도록 하는 기능
 */
function showhide(obj1, obj2) {
	var seogd = document.getElementById(obj1);
	var seogd2 = document.getElementById(obj2);
		
	if (seogd.style.visibility != 'hidden') {
		seogd.style.visibility = 'hidden';
		seogd.style.opacity == '0';
		seogd.style.zIndex = '-1000';
		seogd2.style.visibility = 'hidden';
		seogd2.style.opacity == '0';
		seogd2.style.zIndex = '-900';
		seogd2.style.display = 'none';
	} else {
		seogd.style.visibility = '';
		seogd.style.opacity = '1';
		seogd.style.zIndex = '10000';
		seogd2.style.visibility = '';
		seogd2.style.opacity = '0.7';
		seogd2.style.zIndex = '9000';
		seogd2.style.display = '';
	}
}

function close(){

	showhide('signpage', 'itxOverlay');
}
function close1(){
	
	showhide('signpage1', 'itxOverlay');
}

/**
 * @param obj1 : modal팝업으로 표시되어야 할 부분
 * @param obj2 : modal팝업 표시 시 배경을 반투명처리해주기 위한 영역
 * 숨겨져 있던 내용이 마치 팝업처럼 표시(modal팝업)되도록 하는 기능
 * showhide(obj1, obj2)와는 달리 현재 session에 저장된 main, category, item 값을 통해 mainservlet을 거쳐서 창이 꺼지도록 구현
 */
function showhide2(obj1, obj2) {
	var seogd = document.getElementById(obj1);
	var seogd2 = document.getElementById(obj2);
	
	
	if (seogd.style.visibility != 'hidden') {
		seogd.style.visibility = 'hidden';
		seogd.style.opacity == '0';
		seogd.style.zIndex = '-1000';
		seogd2.style.visibility = 'hidden';
		seogd2.style.opacity == '0';
		seogd2.style.zIndex = '-900';
		seogd2.style.display = 'none';
		
	} else {
		seogd.style.visibility = '';
		seogd.style.opacity = '1';
		seogd.style.zIndex = '1000';
		seogd2.style.visibility = '';
		seogd2.style.opacity = '0.7';
		seogd2.style.zIndex = '900';
		seogd2.style.display = '';
	}
}
