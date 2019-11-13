/**
 * 
 */
var cnt = 0;
var attfileAppend = function() { // 파일추가 Ver 2.0
	var att = document.getElementById('attfile');

	// 하나의 첨부 파일 묶음 영역
	var div = document.createElement("div");

	// file tag
	var file = document.createElement("input");
	file.setAttribute('type', 'file');
	file.setAttribute("class", "file");
	file.setAttribute("style", "display:none;");
	file.setAttribute('name', 'attfile' + cnt);
	file.setAttribute("modify", 'no');

	// 삭제버튼
	var btnDel = document.createElement("input");
	btnDel.setAttribute('type', 'button');
	btnDel.setAttribute('value', 'X');
	btnDel.onclick = function(ev) {// 삭제
		if (att.childNodes.length <= 1)
			return;
		var ele = ev.srcElement;
		var p = ele.parentNode;

		var k = p.getElementsByClassName('file')[0];

		if (k.getAttribute('modify') == 'yes') {
			att.removeChild(p);
		}
	}

	// 이미지 상자
	var img = document.createElement("img");
	img.setAttribute("name", "img" + cnt);
	img.setAttribute("width", "60px");
	img.setAttribute("height", "60px");
	img.src = "./mem_images/nullImage.png";
	img.addEventListener("click", function(e) {
		imagePreView_s(e);
	});

	div.appendChild(img);
	div.appendChild(btnDel);
	div.appendChild(file);

	att.appendChild(div);

	cnt++;
}

var imagePreView_s = function(ev) {
	var tag = ev.srcElement;
	var parent = tag.parentNode;
	var file = parent.getElementsByClassName("file").item(0);
	file.click();

	file.onchange = function(ev2) {
		if (file.getAttribute("modify") == 'no') {
			attfileAppend();
		}

		var url = file.files[0]; // 파일 태그에 선택된 파일 오브젝트
		var reader = new FileReader();// 파일을 로딩하기 위한 자바스크립트 객체
		reader.readAsDataURL(url);
		reader.onload = function(ev3) {
			tag.src = ev3.target.result;
			file.setAttribute("modify", "yes");
		}
	}
}
