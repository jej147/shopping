/*----------------------------------------
@source      : MemAutoLogout.js
@discription :  회원 자동 로그아웃, 중복가입 방지 
@author      : 서형희
@data         : 2014. 10. 28
-----------------------------------------*/

// 주의 


var http_str   ="https://www.epost.go.kr"; //운영용


//회원 접속 정보 조회
var chkMemXmlUrl  = http_str + "/usr.member.RetrieveMemInfoListXml.comm";

//회원 상태 로그인으로 변경 처리
var loginXmlUrl       =  http_str + "/usr.member.UpdateMemLoginStatusLogin.comm";

//회원 상태 로그아웃으로 변경 처리
var logoutXmlUrl    =  http_str + "/usr.member.UpdateMemLoginStatusLogout.comm";

function updateMemLoginStatusLogin(hostUrl){
	var fm = document.getElementById("frmpeautoup");
	fm.action = hostUrl+"/usr.member.UpdateMemLoginStatusLogin.comm";	
	fm.submit();
}

function updateMemLoginStatusLogout(userId, hostUrl){
	var fm = document.getElementById("frmpeautoup");
		if(userId != '' && typeof userId != 'undefined'){
			userId = "?userId="+userId		
		}else{			
			userId = '';
		}
	fm.action = hostUrl+ "/usr.member.UpdateMemLoginStatusLogout.comm"+userId;
	fm.submit();
}