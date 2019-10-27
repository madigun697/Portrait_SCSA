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