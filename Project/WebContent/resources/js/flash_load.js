var flashDate = new Date();
var home = "http://www.epost.go.kr";
if(window.location.protocol == "https:"){
	home = home.replace("http","https");
}
function flash() 
{
 var object = new String;
 var params = new String;
 var embedParams = new String;
 var wX = new String;
 var wY = new String;
 
this.init = function(objectID, flashURL, W, H) 
 {
	if(navigator.appName == 'Microsoft Internet Explorer'){
		object = "<object id='" +objectID+ "' width='" +W+ "' height='" +H+ "' classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='https://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,0,0'>";
	}else{
		object = "<object data='" +flashURL+ "' width='" +W+ "' height='" +H+ "' type='application/x-shockwave-flash'>";
	}
  
  object += "<param name='movie' value='" +flashURL+ "'>";
  embedParams = "src='" +flashURL+ "' ";
  embedParams = "width='" + W + "' height='" + H + "' ";
 }
 
 this.param = function(param, value)
 {
  params += "<param name='" +param+ "' value='" +value+ "'>";
  embedParams += param + "='" +value+ "' ";
 }
 
 this.load = function() 
 {
  var embedTag = "<embed " + embedParams + "pluginspage='https://www.macromedia.com/go/getflashplayer' type='application/x-shockwave-flash' ></embed>";
  var objTag = object + params + embedTag + "</object>";
  
  wX = 0;
  wY = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + 30;
  
  var flashbodystart = '<div style="font-size:12px;position:absolute;top:'+wY+'px;left:'+wX+'px;width:100%;z-index:9999999;overflow:hidden;">';
  flashbodystart += '<div style="width:720px;margin:0 auto;padding:0;border:2px solid #dbdbdb;text-align:center;background:#dbdbdb;">';
  flashbodystart += '<div style="height:25px;margin:0;padding:1px 10px 0 10px;background:#ee2e24 url('+home+'/images/comm/2012/popup/layer_title_bg.gif) left top repeat-y;color:#fff;font-weight:bold;vertical-align:middle;">';
  flashbodystart += '<span style="float:left;padding:5px 0 0 10px;">인터넷우체국 이용 중 '+disptime/60000+'분 동안 사용자 조작이 없으면 우체국 홍보영상이 보여집니다.</span>';
  flashbodystart += '<span style="float:right;padding:2px 0 0 0;"><a href="#" onclick="videoOnOff();return false;"><img src="'+home+'/images/comm/2012/popup/btn_setting.gif" alt="설정" /></a> <a href="#" onclick="prPlayClose();return false;"><img src="'+home+'/images/comm/2012/popup/btn_layerclose.gif" alt="닫기" /></a></span>';
  flashbodystart += '</div>';
  flashbodystart += '<div>';
  
  var flashbodyend = '</div>';
  flashbodyend += '<div style="clear:both;height:20px;padding:4px 10px 0 0;border-top:1px solid #dbdbdb;10px;background:#fff;font-weight:bold;color:#000;"><span style="float:right;padding:0 0 0 0;"><a href="#" onclick="SetExpPlay(7);return false;"><img src="'+home+'/images/comm/2012/popup/7day_close.gif" alt="7일간 홍보영상 보지 않기" /></a></span></div>';
  flashbodyend += '</div>';
  flashbodyend += '</div>';
  
  var flashbodyall = flashbodystart + objTag + flashbodyend;
  document.getElementById("flashbody").innerHTML = flashbodyall;
  document.getElementById("flashbody").style.display = "block";
 }
 
 this.debug=function()
 {
  var objTag = object + params + embedTag + "</object>";
  alert(objTag);
 }
}

function videoOnOff(){
	if(confirm("홍보영상을 계속해서 보고 싶지 않은 고객님은\n\n아래의 [확인]을 클릭해 주세요.")){
		SetExpPlay(365);
	}else{
		return false;
	}
}

function getPlayYn() {
	var name = "prplayyn";
	var search = name + "=";

	if(flashDate.getHours() == 12){
		return false;
	}else if(dispyn == 'N'){
		return false;
	}else if ( document.cookie.length > 0 ) {
		offset = document.cookie.indexOf( search );
		if ( offset != -1 ) {
			offset += search.length;
			end = document.cookie.indexOf( ";", offset );

			if ( end == -1 )
				end = document.cookie.length;

			return false;
		}
		else return true;
	}
	else return true;
}

function flashTimer(){
	 if(getPlayYn()){
	   myFlash = new flash(); //플래시오브젝트 선언
	 	 //myFlash.init("myFlash", "http://image.epost.go.kr/www/files/video/"+flashname, "720", "480"); //초기화 ('아이디', '플래시URL', '넓이', '높이')                    
	 	 myFlash.init("myFlash", "http://www.youtube-loop.com/v/"+videocode+"?hl=ko_KR&autoplay=1&loop=1&autohide=1&rel=0", "720", "480"); //초기화 ('아이디', '플래시URL', '넓이', '높이')
	 	 myFlash.param("quality", "high"); //매개변수 설정 ('매개변수명', '값')
	 	 myFlash.param("wmode", "transparent");
	 	 myFlash.param("menu", "false");
		 myFlash.param("allowScriptAccess", "always");
		 myFlash.param("allowFullScreen", "true");
		 myFlash.load(); //플래시 로드 
		 
		 clearInterval(t1);  //타이머중지
		 flashpopupyn = "Y";
	 }
}

function prPlayClose(){
	flashpopupyn = "N";
	//<--플래시 중지기능 추가
	if(getPlayYn()) t1 = setInterval(flashTimer,disptime);
	document.getElementById("flashbody").style.display = "none";
}

function SetExpPlay(expiredays)
{
  var name = "prplayyn";
  var value = "N";
  var todayDate = new Date();
  todayDate.setDate( todayDate.getDate() + expiredays );
  document.cookie = name + "=" + escape( value ) + "; path=/; domain=epost.go.kr; expires=" + todayDate.toGMTString() + ";";
  flashpopupyn = "Y";
  clearInterval(t1);  //타이머중지
  //<--플래시 중지기능 추가
  document.getElementById("flashbody").style.display = "none";
}

var flashpopupyn = "N";

if(getPlayYn()){
	document.body.onclick = function reset1(){if(flashpopupyn == 'N'){clearInterval(t1);t1 = setInterval(flashTimer,disptime);}};
	document.body.onmouseover = function reset2(){if(flashpopupyn == 'N'){clearInterval(t1);t1 = setInterval(flashTimer,disptime);}};
	document.body.onkeydown = function reset3(){if(flashpopupyn == 'N'){clearInterval(t1);t1 = setInterval(flashTimer,disptime);}};
	var t1 = setInterval(flashTimer,disptime);
}

