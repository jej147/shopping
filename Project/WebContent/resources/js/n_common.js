//<![CDATA[
/*----------------------------------------

discription : n_common.js

author : 최경호
data: 2008. 2. 21
-----------------------------------------*/


/*------------------------------------------------
				브라우져별 키 값 식별
------------------------------------------------*/
function isAccess(e) {

	var keynum;
	var ismouseClick = 1;
	if (e.which) { // Netscape/Firefox/Opera/IE9
		keynum = e.which;
		if (keynum == 1) {
			ismouseClick = 0;
		}
	} else if (window.event) { // IE8 earlier & Safari
		keynum = e.keyCode;
		// Safari의 경우 마우스클릭은 keynum 0 이 넘어옴
		if (keynum == 0) {
			ismouseClick = 0;
		}
	}
	
	
	//마우스 클릭이거나 엔터키를 누른경우 true값 반환
	if ( ismouseClick == 0 || keynum == 13 ) {		
		return true;
	}
	else{
		return false;
	}
}

/*------------------------------------------------
			topmenu image swap
------------------------------------------------*/
function Pswap(n, g){
					
	if(g=="p"){
		var imgPath = "/imgnew/global/eportal0";
		var objImg = document.getElementById("portal-img0"+n);
		objImg.src = imgPath+n+"_on.gif";
	}
	else if(g=="g"){
		var imgPath = "/images/comm/2009/gnb0";
		var objImg = document.getElementById("gnb-Img0"+n);
		objImg.src = imgPath+n+"_on.gif";
	}
}

function Prestore(n, g){
	
	if(g=="p"){
		var imgPath = "/imgnew/global/eportal0";
		var objImg = document.getElementById("portal-img0"+n);
		objImg.src = imgPath+n+".gif";
	}
	else if(g=="g"){
		var imgPath = "/images/comm/2009/gnb0";
		var objImg = document.getElementById("gnb-Img0"+n);
		objImg.src = imgPath+n+".gif";
	}
}
/*------------------------------------------------
			leftmenu image swap
------------------------------------------------*/
function newToggleImgLF(idx,e){
	var swapImg = document.getElementById("mlink"+idx);

	if(e.type=="mouseover"||e.type=="focus"){
		swapImg.src = swapImg.src.replace("off","on");
	}
	else if(e.type=="mouseout"||e.type=="blur"){
		swapImg.src = swapImg.src.replace("on","off");
	}
}

function Lswap(n1, n2){
					
	var imgPath = "/imgnew/leftmenu/m0";
	var objImg = document.getElementById("left-img"+n1+"0"+n2);
	objImg.src = imgPath+n1+"_0"+n2+"_on.gif";					
}

function Lrestore(n1, n2){
	
	var imgPath = "/imgnew/leftmenu/m0";
	var objImg = document.getElementById("left-img"+n1+"0"+n2);
	objImg.src = imgPath+n1+"_0"+n2+".gif";	
}

/*------------------------------------------------
			조회서비스, 검색서비스 토글
------------------------------------------------*/
function toggle_search(num, e){					
	var imgPath = "/imgnew/unisearch/tb_sch0";
	if(isAccess(e)){

			for(var i=1; i<3; i++){
				var obj_tog = document.getElementById("unionSearch"+i);
				var tg_img = document.getElementById("tg-img0"+i);

				if(num==i){
						obj_tog.style.display = "block";
						tg_img.src = imgPath+ i + "_on.gif";
				}
				else{
						obj_tog.style.display = "none";
						tg_img.src = imgPath+ i + ".gif";
				}
			}
		return false;
	}			
}

/*------------------------------------------------
		우표문화센터, 페이지 네비 이미지 스왑
------------------------------------------------*/
		function swapPageNimg(n,e){
			var imgPath = "/imgnew/content/estamp/cultcenter/cult_navi0";
			var swapImg = document.getElementById("pnImg0"+n);

			if(e.type=="mouseover" || e.type=="focus"){
				swapImg.src = imgPath + n + "_on.gif";
			}
			else if(e.type=="mouseout" || e.type=="blur"){
				swapImg.src = imgPath + n + ".gif";
			}
		}	


/*------------------------------------------------
			우표류 주문 우표,기념엽서 발행계획 토글
------------------------------------------------*/
function jsTogstampPlan(num, nowyear, e){					
	var imgPath = "/imgnew/front/stamp/menu";
	if(isAccess(e)){

			for(var i=1; i<3; i++){
				var obj_tog = document.getElementById("stampPlan2008-"+i);
				var tg_img = document.getElementById("tmg-Plan2008-"+i);

				if(num==i){
						obj_tog.style.display = "block";
						tg_img.src = imgPath+ i + "_" + nowyear + "_on.gif";
				}
				else{
						obj_tog.style.display = "none";
						tg_img.src = imgPath+ i + "_" + nowyear + "_off.gif";
				}
			}
		return true;
	}			
}

/*-----------------------------------------------------
		고객맞춤형서비스, 나만의우표 신청 및 종류 토글
-----------------------------------------------------*/
		function togMystamp(n,e){
			
			if(isAccess(e)){			
				var imgPath = "/imgnew/front/mystamp/svfr08_titMystamp010";
				var togImg = document.getElementById("togMySt0"+n);
	
				if(e.type=="mouseover" || e.type=="focus"){
					togImg.src = imgPath + n + "_on.gif";
				}
				else if(e.type=="mouseout" || e.type=="blur"){
					togImg.src = imgPath + n + ".gif";
				}
				return false;
		  }
		}	

/*-----------------------------------------------------
		팝업창 닫기 버튼
-----------------------------------------------------*/
		function popupClose(e){
			if(isAccess(e)){
				window.close();

				return false;
			}
		}
		
/*-----------------------------------------------------
		Content 영역 프린트  버튼
-----------------------------------------------------*/		
        function inner_print(e){

            if(isAccess(e)){
                var initBody = document.body.innerHTML;
                window.onbeforeprint = function(){
                    document.body.innerHTML = document.getElementById('printarea').innerHTML;
                }
                
                window.onafterprint = function(){
                    document.body.innerHTML = initBody;
                }
                window.print(); 
                return false;
            }
        }

/*-----------------------------------------------------
		IE6 flicker 제거 
-----------------------------------------------------*/	        
(function(){
 /*Use Object Detection to detect IE6*/
 var  m = document.uniqueID /*IE*/
 && document.compatMode  /*>=IE6*/
 && !window.XMLHttpRequest /*<=IE6*/
 && document.execCommand ;
 
 try{
  if(!!m){
   m("BackgroundImageCache", false, true) /* = IE6 only */
  }
 }catch(oh){};
})(); 


function jsimgToggle(idx,e){
	var jsTogImg = document.getElementById("togImg0"+idx);
	if(e.type=="mouseover"||e.type=="focus"){
		jsTogImg.src = jsTogImg.src.replace("off.gif","on.gif");
	}
	else if(e.type=="mouseout"||e.type=="blur"){
		jsTogImg.src = jsTogImg.src.replace("on.gif","off.gif");
	}
}

function jsGnbImgTog(idx,e){
	var jsTogImg = document.getElementById("gnbTogimg0"+idx);
	if(e.type=="mouseover"||e.type=="focus"){
		jsTogImg.src = jsTogImg.src.replace("off.gif","on.gif");
	}
	else if(e.type=="mouseout"||e.type=="blur"){
		jsTogImg.src = jsTogImg.src.replace("on.gif","off.gif");
	}
}



var tmout;  //time 전역변수로 사용

function jsVlayer(idx){
	jsTimestop();
	for(var i=1;i<=6;i++){
		var vlayer = document.getElementById("gnb0"+i);

		if(i==idx){
			vlayer.style.display = "block";
		}
		else{
			vlayer.style.display = "none";
		}
	}
}

function jsHdlayer(idx){
	document.getElementById("gnb0"+idx).style.display = "none";
}

function jsTimeout(idx){
	tmout = setTimeout("jsHdlayer("+idx+")",1000);
}

function jsTimestop(){
	clearTimeout(tmout);
}

/**
 * @desc   : 쿠키값을 읽어온다.
 * @param  : 쿠키 name
 * @return : 쿠키 value
 */
function getCookie( name ) {
	var search = name + "=";
	if ( document.cookie.length > 0 ) {
		offset = document.cookie.indexOf( search );
		if ( offset != -1 ) {
			offset += search.length;
			end = document.cookie.indexOf( ";", offset );

			if ( end == -1 )
				end = document.cookie.length;

			return unescape(document.cookie.substring(offset,end));
		}
		else return "";
	}
	else return "";
}

function OpenZipcode(z1,z2,a,f,frm,e) {
	if(isAccess(e)) {
	var v_frm = frm;
	if (frm==null)	v_frm = "";
	window.open("/util.RetrievePostalCodeList.mall?fname="+v_frm+"&zip1="+z1+"&zip2="+z2+"&address="+a+"&focus="+f,"ZipWin","width=460,height=530,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes");
	return false;
  }
}

function OpenZipcode2(z1,z2,a,f,frm,e) {
	if(isAccess(e)) {
	var v_frm = frm;
	if (frm==null)	v_frm = "";
	window.open("/util.RetrievePostalCodeList.mall?fname="+v_frm+"&zip1="+z1+"&zip2="+z2+"&address="+a+"&focus="+f,"ZipWin","width=460,height=530,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes");
	return false;
  }
}

function NewZipcodeSearch(z1,z2,a,f,frm,e) {
	if(isAccess(e)) {
		 var v_frm = frm;

		 if (frm==null)	v_frm = "";
			if((document.forms[frm].elements[z1].value== '') || (document.forms[frm].elements[z2].value == '')){
					zip1=document.forms[frm].elements[a].value= "";
			}
			
			if ((document.forms[frm].elements[z1+"1"].value=='') || (document.forms[frm].elements[z2+"2"].value=='') || (document.forms[frm].elements[z1].value != document.forms[frm].elements[z1+"1"].value) || (document.forms[frm].elements[z2].value != document.forms[frm].elements[z2+"2"].value)){
					document.getElementById("newZipcodeSearch").src = "/util.NewZipcodeSearch.mall?paramfname="+v_frm+"&paramzip1="+z1+"&paramzip2="+z2+"&paramaddress="+a+"&paramfocus="+f+"&vz1="+document.forms[frm].elements[z1].value+"&vz2="+document.forms[frm].elements[z2].value;
			}else{
				 document.forms[frm].elements[a].value = "";
					NewZipcodeSearch2(z1,z2,a,f,frm,document.forms[frm].elements[z1].value+"-"+document.forms[frm].elements[z2].value);
			}
			
			return false;
 }
}

function NewZipcodeSearch1(z1,z2,a,f,frm) {
	var v_frm = frm;
	if (frm==null)	v_frm = "";
	window.open("/util.RetrievePostalCodeList.mall?fname="+v_frm+"&zip1="+z1+"&zip2="+z2+"&address="+a+"&focus="+f,"ZipWin","width=460,height=530,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes");
}

function NewZipcodeSearch2(z1,z2,a,f,frm,code) {
	var v_frm = frm;
	if (frm==null)	v_frm = "";
	window.open("/util.RetrievePostalCodeList.mall?fname="+v_frm+"&zip1="+z1+"&zip2="+z2+"&address="+a+"&focus="+f+"&findName="+code+"&type=1","ZipWin","width=460,height=530,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes");
}

function isAllowChar(nm,str){
	var notAllow = "\"'<>";
	var cha = "";
	
	for(var i=0; i<str.length; i++) {
	    cha = str.charAt(i);
	
	    if (notAllow.indexOf(cha) >= 0) {
	        alert(nm + "에 \", ', <, > 문자는 입력하실 수 없습니다.");
	        return true;
	    }
	}
	return false;
}

function nZipSearch(form,zip1,zip2,addr1,addr2,addrtype,e) {
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
        
        frm.form_name.value = form;
        frm.zip1_name.value = zip1;
        frm.zip2_name.value = zip2;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr_type_name.value = addrtype;
                
        if(zip2 == ""){
            frm.keyword.value = document.getElementById(zip1).value.replace("-","");
        }else{
            frm.keyword.value = document.getElementById(zip1).value + document.getElementById(zip2).value;
        }
        var old_keyword = "";
        if(zip2 == ""){
            old_keyword = document.forms[form].elements[zip1+'1'].value.replace("-","");
        }else{
            old_keyword = document.forms[form].elements[zip1+'1'].value + document.forms[form].elements[zip2+'2'].value;
        }
        if(frm.keyword.value != "" && (frm.keyword.value != old_keyword) && (document.getElementById(addrtype).value.substring(0,1) != "S")){
            frm.action = "/comm/zipcode/jibun_zipcode_auto.jsp";
            frm.target = "newZipcodeSearch";
        }else{
		    if(zip2 == ""){
		        document.getElementById(zip1).value = document.getElementById(zip1+'1').value;
		    }else{
		        document.getElementById(zip1).value = document.getElementById(zip1+'1').value;
		        document.getElementById(zip2).value = document.getElementById(zip2+'2').value;
		    }
            var v_top = (screen.height - 480)/2;
            var v_left = (screen.width - 878)/2;
    
            var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
            frm.target = "nZipWin";

            if(document.getElementById(addrtype).value.substring(0,1) == "S"){
                frm.keyword.value = "";
                frm.action = "/comm/zipcode/street_zipcode.jsp";
            }else if(document.getElementById(addrtype).value.substring(0,1) == "J" || ((document.getElementById(addrtype).value == "") && (document.getElementById(zip1).value != ""))){
                frm.keyword_type.value = "1";
                frm.action = "/comm/zipcode/jibun_zipcode.jsp";
            }else{
                frm.keyword.value = "";
                frm.action = "/comm/zipcode/street_zipcode.jsp";               
            }
        }
        frm.submit();
        return false;
    }
}


function nZipSearch_auto(form,zip1,zip2,addr1,addr2,addrtype) {
    var frm = document.getElementById("nZipSearchFrm");
    frm.form_name.value = form;
    frm.zip1_name.value = zip1;
    frm.zip2_name.value = zip2;
    frm.addr1_name.value = addr1;
    frm.addr2_name.value = addr2;
    frm.addr_type_name.value = addrtype;
    if(zip2 == ""){
        frm.keyword.value = document.getElementById(zip1).value.replace("-","");
        document.getElementById(zip1).value = document.getElementById(zip1+'1').value;
    }else{
        frm.keyword.value = document.getElementById(zip1).value + document.getElementById(zip2).value;
        document.getElementById(zip1).value = document.getElementById(zip1+'1').value;
        document.getElementById(zip2).value = document.getElementById(zip2+'2').value;
    }
    
    var v_top = (screen.height - 480)/2;
    var v_left = (screen.width - 878)/2;

    var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
    frm.target = "nZipWin";
    frm.action = "/comm/zipcode/jibun_zipcode.jsp";
    frm.submit();
}

function streetAddrSearch(form,zip1,zip2,addr1,addr2,addrtype,e) {
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip1_name.value = zip1;
        frm.zip2_name.value = zip2;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        frm.target = "nZipWin";

        frm.keyword.value = "";
        frm.action = "/comm/zipcode/street_zipcode_newjoin.jsp";    
        
        frm.submit();
        return false;
    }
}

function transAddrSearch(form,zip1,zip2,addr1,addr2,addr3,addrtype,e) {
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip1_name.value = zip1;
        frm.zip2_name.value = zip2;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr3_name.value = addr3;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        frm.target = "nZipWin";

        frm.keyword.value = "";
        frm.action = "/comm/zipcode/street_zipcode_newjoin.jsp";    
        
        frm.submit();
        return false;
    }
}

function transAddrSearch_ab(form,zip1,zip2,addr1,addr2,addr3,addrtype,curIdx,e) {
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip1_name.value = zip1;
        frm.zip2_name.value = zip2;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr3_name.value = addr3;
        frm.curIdx_name.value = curIdx;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        frm.target = "nZipWin";

        frm.keyword.value = "";
        frm.action = "/comm/zipcode/street_zipcode_newjoin.jsp";    
        
        frm.submit();
        return false;
    }
}

function cfGetNewZipCd_ab(form,hzip,addr1,addr2,addr3,addrtype,curIdx,e) {
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip_name.value = hzip;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr3_name.value = addr3;
        frm.curIdx_name.value = curIdx;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        frm.target = "nZipWin";

        frm.keyword.value = "";
        frm.action = "/comm/zipcode/comm_street_zipcd_newjoin.jsp";    
        
        frm.submit();
        return false;
    }
}

//새우편번호 주소록 - 2015.06.19 - ref => nZipSearch()
function cfGetNewZipCd_address(form,hzip,addr1,addr2,addr3,addrtype,curIdx,e) {
	if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip_name.value = hzip;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr3_name.value = addr3;
        frm.curIdx_name.value = curIdx;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        frm.target = "nZipWin";
        frm.keyword.value = "";
        frm.action = "/comm/zipcode/comm_newzipcd_list.jsp";
        frm.submit();
	return false;
	}
}

function zipCdPopupClose(){
	objBpopup.close();
}
var objBpopup;

//새우편번호 겸용 - 2014.07.17 - ref => nZipSearch()
function cfGetNewZipCd(form,zip,addr1,addr2,addrtype,e,url) {
	if(!isAccess(e)){
		return;
	}

	var frm = document.getElementById("nZipSearchFrm");
	
	frm.form_name.value = form;
	frm.zip_name.value   = zip;
	frm.addr1_name.value = addr1;
	frm.addr2_name.value = addr2;
	frm.addr_type_name.value = addrtype;
	
	if(zip != ""){
		frm.keyword.value = document.getElementById(zip).value;
	}
	var old_keyword = "";
	if(zip != ""){
		old_keyword = document.forms[form].elements[zip+'00'].value;
	}


	
	if(newZipCdUtil.getZipMode() != "OLD"){
		if(url == "" || url == null || typeof(url) == "undefined"){
			// 새우편번호 통합검색창 이용 2015-01-05 박혼석
			var v_top = (screen.height - 480)/2;
			var v_left = (screen.width - 878)/2;
			
	//		var nZipWin = window.open("","nZipWin","width=878,height=480,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
			//2016.02 인터넷우체국고도화 주소록 우편번호 검색 팝업 사이즈 조절 
			var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
			frm.target = "nZipWin";
	
			try {
				if(e.type == "keypress"){
					frm.keyword.value = document.getElementById(zip).value;
				}else{
					frm.keyword.value = "";
				}
			} catch (e) {
				frm.keyword.value = "";
			}
	
	
			frm.action = "/comm/zipcode/comm_newzipcd_list.jsp";
		} else {
			objBpopup = $("#ifZipCdPopup").bPopup({
				modalClose:false,
				positionStyle:'fixed'
			});
			frm.target = "ifZipCdPopup";
	
			try {
				if(e.type == "keypress"){
					frm.keyword.value = document.getElementById(zip).value;
				}else{
					frm.keyword.value = "";
				}
			} catch (e) {
				frm.keyword.value = "";
			}
	
			frm.action = "/comm/zipcode/comm_newzipcd_list_layerpop.jsp";
		}
	}else if(frm.keyword.value != "" && (frm.keyword.value != old_keyword) && (document.getElementById(addrtype).value.substring(0,1) != "S")){
		var newZipcodeSearch = window.open("","newZipcodeSearch","width=878,height=480,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
		frm.target = "newZipcodeSearch";
		frm.action = "/comm/zipcode/comm_jibun_zipcd_auto.jsp";
	}else{
		var v_top = (screen.height - 480)/2;
		var v_left = (screen.width - 878)/2;
		
		var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
		frm.target = "nZipWin";
		
		if(document.getElementById(addrtype).value.substring(0,1) == "S"){
			frm.keyword.value = "";
			frm.action = "/comm/zipcode/comm_street_zipcd.jsp";
		}else if(document.getElementById(addrtype).value.substring(0,1) == "J" || ((document.getElementById(addrtype).value == "") && (document.getElementById(zip).value != ""))){
			frm.keyword_type.value = "1";
			frm.action = "/comm/zipcode/comm_jibun_zipcd.jsp";
		}else{
			frm.keyword.value = "";
			frm.action = "/comm/zipcode/comm_street_zipcd.jsp";               
		}
	}
	frm.submit();
	return false;
}

//새우편번호 exeMode용
function cfGetNewZipCdExeMode(form,zip,areacd,addr1,addr2,addrtype,e) {
	if(isAccess(e)){
		var frm = document.getElementById("nZipSearchFrm");
		
		frm.form_name.value = form;
		frm.zip_name.value   = zip;
		frm.areacd_name.value   = areacd;
		frm.addr1_name.value = addr1;
		frm.addr2_name.value = addr2;
		frm.addr_type_name.value = addrtype;
		
		if(zip != ""){
			frm.keyword.value = document.getElementById(zip).value;
		}
		var old_keyword = "";
		if(zip != ""){
			old_keyword = document.forms[form].elements[zip+'00'].value;
		}
		
		if(frm.keyword.value != "" && (frm.keyword.value != old_keyword) && (document.getElementById(addrtype).value.substring(0,1) != "S")){
			var newZipcodeSearch = window.open("","newZipcodeSearch","width=878,height=480,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
			frm.keyword.value = "";
			frm.target = "newZipcodeSearch";
			frm.action = "/comm/zipcode/comm_street_zipcd.jsp";
		}else{
			var v_top = (screen.height - 480)/2;
			var v_left = (screen.width - 878)/2;
			
			var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
			frm.target = "nZipWin";
			
			if(document.getElementById(addrtype).value.substring(0,1) == "S"){
				frm.keyword.value = "";
				frm.action = "/comm/zipcode/comm_street_zipcd.jsp";
			}else if(document.getElementById(addrtype).value.substring(0,1) == "J" || ((document.getElementById(addrtype).value == "") && (document.getElementById(zip).value != ""))){
				frm.keyword.value = "";
				frm.action = "/comm/zipcode/comm_street_zipcd.jsp";
			}else{
				frm.keyword.value = "";
				frm.action = "/comm/zipcode/comm_street_zipcd.jsp";               
			}
		}
		frm.submit();
		return false;
	}
}

//새우편번호 겸용 - 2014.07.17. - ref => transAddrSearch()
function cfGetNewZipCdTransAddr(form,zip,addr1,addr2,addr3,addrtype,e) {
	if(isAccess(e)){
		var frm = document.getElementById("nZipSearchFrm");
		
		frm.form_name.value = form;
		frm.zip_name.value = zip;
		frm.addr1_name.value = addr1;
		frm.addr2_name.value = addr2;
		frm.addr3_name.value = addr3;
		frm.addr_type_name.value = addrtype;
		
		var v_top = (screen.height - 480)/2;
		var v_left = (screen.width - 878)/2;
		
		var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
		frm.target = "nZipWin";
		
		frm.keyword.value = "";

    if(newZipCdUtil.getZipMode() != "OLD"){
			frm.action = "/comm/zipcode/comm_newzipcd_list.jsp?srchType=ST&amp;srchTpChangeble=false";
		}else {
			frm.action = "/comm/zipcode/comm_street_zipcd_newjoin.jsp";
		}
		
		frm.submit();
		return false;
	}
}

//새우편번호 길이 Validation 
function checkZipCd(zipcode){
	var result = false;
	zipcode = zipcode.value.replace("-", "");
	
	// js_zip_mode 에 따라 우편번호 길에 Validation
	if(ZIP_MODE == "OLD"){
		result = /^[0-9]{6}$/.test(zipcode);	
	}else if(ZIP_MODE == "NEW"){
		result = /^[0-9]{5}$/.test(zipcode);    
	}else{
		result = /^[0-9]{5,6}$/.test(zipcode);
	}
	return result

}

//새우편번호 겸용 - cf - nZipSearch_auto
function cfGetNewZipCd_auto(form,zip,addr1,addr2,addrtype) {
    var frm = document.getElementById("nZipSearchFrm");
    
    frm.form_name.value = form;
    frm.zip_name.value = zip;    
    frm.addr1_name.value = addr1;
    frm.addr2_name.value = addr2;
    frm.addr_type_name.value = addrtype;

    frm.keyword.value = document.getElementById(zip).value.replace("-","");
    document.getElementById(zip).value = document.getElementById(zip+'00').value;
    
    var v_top = (screen.height - 480)/2;
    var v_left = (screen.width - 878)/2;

    var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
    frm.target = "nZipWin";
    frm.action = "/comm/zipcode/comm_jibun_zipcd.jsp";
    frm.submit();
}

//새우편번호 겸용 - cf - streetAddrSearch(가입전용)
function cfGetNewZipCdStreetAddrSearch(form,zip,addr1,addr2,addrtype,e) {
	// 회원가입
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip_name.value = zip;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        //var nZipWin = window.open("","nZipWin","width=878,height=480,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        //2016.01 인터넷우체국고도화  우편번호 검색 팝업 사이즈 조절
        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        frm.target = "nZipWin";
		try {
			if(e.type == "keypress"){
				frm.keyword.value = document.getElementById(zip).value;
			}else{
				frm.keyword.value = "";
			}
		} catch (e) {
			frm.keyword.value = "";
		}
		
    if(newZipCdUtil.getZipMode() != "OLD"){
			frm.action = "/comm/zipcode/comm_newzipcd_list.jsp";
		}else {
			frm.action = "/comm/zipcode/comm_street_zipcd_newjoin.jsp";
		}
        frm.submit();
        return false;
    }
}

//새우편번호 겸용 - cf - cfGetNewZipCdStreetAddrSearch_temp(회원팝업 전용)
function cfGetNewZipCdStreetAddrSearch_temp(form,zip,addr1,addr2,addrtype,e) {
	
    if(isAccess(e)){
        var frm = document.getElementById("nZipSearchFrm");
     
        frm.form_name.value = form;
        frm.zip_name.value = zip;
        frm.addr1_name.value = addr1;
        frm.addr2_name.value = addr2;
        frm.addr_type_name.value = addrtype;
         
        var v_top = (screen.height - 480)/2;
        var v_left = (screen.width - 878)/2;

        //var nZipWin = window.open("","nZipWin","width=878,height=480,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
      //2016.01 인터넷우체국고도화  우편번호 검색 팝업 사이즈 조절
        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
        
        frm.target = "nZipWin";

        frm.keyword.value = "";
    	  frm.action = "/comm/zipcode/comm_newzipcd_list.jsp";
		    frm.submit();
        return false;
    }
}

//새우편번호 겸용(exeMode 처리) - cf - cfGetNewZipCdStreetAddrSearch(가입전용)
function cfGetNewZipCdStreetAddrSearchExeMode(form,zip,areacd,addr1,addr2,addrtype,e) {
	
	if(isAccess(e)){
		var frm = document.getElementById("nZipSearchFrm");
		
		frm.form_name.value = form;
		frm.zip_name.value = zip;
		frm.areacd_name.value   = areacd;
		frm.addr1_name.value = addr1;
		frm.addr2_name.value = addr2;
		frm.addr_type_name.value = addrtype;
		
		var v_top = (screen.height - 480)/2;
		var v_left = (screen.width - 878)/2;
		
		//var nZipWin = window.open("","nZipWin","width=878,height=480,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
		//2016.01 인터넷우체국고도화  우편번호 검색 팝업 사이즈 조절
        var nZipWin = window.open("","nZipWin","width=590,height=750,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,top=" + v_top + ",left=" + v_left);
		frm.target = "nZipWin";
		
		frm.keyword.value = "";
		frm.action = "/comm/zipcode/comm_street_zipcd_newjoin.jsp";    
		
		frm.submit();
		return false;
	}
}


function isValidFormat(input,format) {
	if (input.value.search(format) != -1) {
		return true; //올바른 포맷 형식
	}
	return false;
}

function isValidEmail(input) {
	// var format = /^(\S+)@(\S+)\.([A-Za-z]+)$/;
	var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
	return isValidFormat(input,format);
}

/*--------------------------------------------------
 기능 : Check Null RETURN T/F
INPUT : check data
RETURN : true -> NULL
false -> NOT NULL
----------------------------------------------------*/
function jsCheckNull( toCheck )
{
	var chkstr = toCheck + "";
	var is_Space = true ;

	if ( ( chkstr == "") || ( chkstr == null ) )
 return( true );

 for ( j = 0 ; is_Space && ( j < chkstr.length ) ; j++)
 {
 if( chkstr.substring( j , j+1 ) != " " )
 {
 is_Space = false ;
 }
 }
 return ( is_Space );
}

var newZipCdUtil = {
    getZipMode : function() {
        try {
            var vZipMode = ZIP_MODE;
            return ZIP_MODE;
        } catch (e) {
			alert("constant.js not included ZIP_MODE set OLD and continue");
			return "OLD";
        }
    },
    getExeMode : function() {
		return EXE_MODE;
    }
		
};

try {
	var vZipMode = ZIP_MODE;
} catch (e) {
	document.write("<script type=\"text/javascript\" language=\"javascript\" src=\"/jscripts/comm/constant.js\"></script>");
}

//]]>

