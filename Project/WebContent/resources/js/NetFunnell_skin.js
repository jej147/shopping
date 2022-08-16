function addComma(str){
		var input = str;
		var output="";
		
		for(var i=input.length; i>=0; i--){
			if((input.length-i)%3==1 && output.length!=0&&input.charAt(i)!="-"){
				output=","+output;
			}
			output=input.charAt(i)+output;
		}
		return output;
	}

if(typeof NetFunnel == "object"){
	//skin1_index접속자
	NetFunnel.SkinUtil.add('skin1',{
		prepareCallback:function(){
			var netfunnel_loading_popup_count = document.getElementById("NetFunnel_Loading_Popup_Count");
			var netfunnel_loading_popup_timeleft = document.getElementById("NetFunnel_Loading_Popup_TimeLeft");
			
			netfunnel_loading_popup_count.innerHTML="0";
			netfunnel_loading_popup_timeleft.innerHTML="0";
		},
		updateCallback:function(percent,nwait,totwait,timeleft){
			var netfunnel_loading_popup_count = document.getElementById("NetFunnel_Loading_Popup_Count");
			var netfunnel_loading_popup_timeleft = document.getElementById("NetFunnel_Loading_Popup_TimeLeft");
			
			var comNwait = addComma(nwait);
			var timeleft = addComma(timeleft);
			netfunnel_loading_popup_count.innerHTML = comNwait;
			netfunnel_loading_popup_timeleft.innerHTML = timeleft;
		},
		htmlStr:'<div style="margin:50px auto;font-family:Malgun Gothic, Dotum, Gulim, serif; width:1024px;text-align:center;overflow:hidden;"id="NetFunnel_Skin_Top">'
					+ '<h1 style="font-size:36px; border:5px solid #ccc; padding:50px 0;"><span style="color:#f00;">인터넷우체국</span>에 접속 중입니다</h1>'
						+ '<div> <span style="font-weight:bold; font-size:18px;">보건용마스크는 우체국쇼핑(mall.epost.go.kr)에서 판매</span>합니다.<br /> '
						+ ' 순서에 따라 인터넷 우체국 대기화면으로 자동 접속 됩니다. '
							+ '<p style="font-size:18px;font-weight:bold;">현재 대기인원<span id="NetFunnel_Loading_Popup_Count" style="color:#F00;">1908</span>명</p> '
							+ '<p style="font-size:18px;font-weight:bold;">예상대기시간<span id="NetFunnel_Loading_Popup_TimeLeft" style="color:#F00;">150</span>초</p>'
							+ '<p>※ 새로 고침하시면 대기시간이 더 길어집니다.</p>'
						+ '</div> '
				+ '</div> '
	},'normal');

	//skin2_로그인접속자
    NetFunnel.SkinUtil.add('skin2',{ 
        prepareCallback:function(){
        	var netfunnel_loading_popup_count = document.getElementById("NetFunnel_Loading_Popup_Count");
			var netfunnel_loading_popup_timeleft = document.getElementById("NetFunnel_Loading_Popup_TimeLeft");
			
			netfunnel_loading_popup_count.innerHTML="0";
			netfunnel_loading_popup_timeleft.innerHTML="0";
        },
        updateCallback:function(percent,nwait,totwait,timeleft){
        	var netfunnel_loading_popup_count = document.getElementById("NetFunnel_Loading_Popup_Count");
			var netfunnel_loading_popup_timeleft = document.getElementById("NetFunnel_Loading_Popup_TimeLeft");
			
			var comNwait = addComma(nwait);
			var timeleft = addComma(timeleft);
			netfunnel_loading_popup_count.innerHTML = comNwait;
			netfunnel_loading_popup_timeleft.innerHTML = timeleft;
        },
        htmlStr:
			'<div style="margin:50px auto;font-family:Malgun Gothic, Dotum, Gulim, serif; width:1024px;text-align:center;overflow:hidden;"id="NetFunnel_Skin_Top">'
        	 + '<h1 style="font-size:36px; border:5px solid #ccc; padding:50px 0;"><span style="color:#1a5cd4;">로그인</span> 대기중입니다</h1>'
        	 + '<p style="font-size:18px;font-weight:bold;">현재 대기인원<span id="NetFunnel_Loading_Popup_Count" style="color:#F00;">1908</span>명</p>'
        	 + '<p style="font-size:18px;font-weight:bold;">예상대기시간<span id="NetFunnel_Loading_Popup_TimeLeft" style="color:#F00;">150</span>초</p>'
        	 + '<p>※ 새로 고침하시면 대기시간이 더 길어집니다.</p>'
        	+'</div>'
    },'normal'); 
    
  //skin3_회원가입접속자
    NetFunnel.SkinUtil.add('skin3',{ 
    	prepareCallback:function(){
        	var netfunnel_loading_popup_count = document.getElementById("NetFunnel_Loading_Popup_Count");
			var netfunnel_loading_popup_timeleft = document.getElementById("NetFunnel_Loading_Popup_TimeLeft");
			
			netfunnel_loading_popup_count.innerHTML="0";
			netfunnel_loading_popup_timeleft.innerHTML="0";
        },
        updateCallback:function(percent,nwait,totwait,timeleft){
        	var netfunnel_loading_popup_count = document.getElementById("NetFunnel_Loading_Popup_Count");
			var netfunnel_loading_popup_timeleft = document.getElementById("NetFunnel_Loading_Popup_TimeLeft");
			
			var comNwait = addComma(nwait);
			var timeleft = addComma(timeleft);
			netfunnel_loading_popup_count.innerHTML = comNwait;
			netfunnel_loading_popup_timeleft.innerHTML = timeleft;
        },
        htmlStr:
        	'<div style="margin:50px auto;font-family:Malgun Gothic, Dotum, Gulim, serif; width:1024px;text-align:center;overflow:hidden;"id="NetFunnel_Skin_Top">'
	       	 + '<h1 style="font-size:36px; border:5px solid #ccc; padding:50px 0;"><span style="color:#1a5cd4;">회원가입</span> 대기중입니다</h1>'
	       	 + '<p style="font-size:18px;font-weight:bold;">현재 대기인원<span id="NetFunnel_Loading_Popup_Count" style="color:#F00;">1908</span>명</p>'
	       	 + '<p style="font-size:18px;font-weight:bold;">예상대기시간<span id="NetFunnel_Loading_Popup_TimeLeft" style="color:#F00;">150</span>초</p>'
	       	 + '<p>※ 새로 고침하시면 대기시간이 더 길어집니다.</p>'
	       	+'</div>'
    },'normal'); 
}


