function checkBrowser(){
	var nVer = navigator.appVersion;
	var nAgt = navigator.userAgent;
	var browserName = navigator.appName;
	var fullVersion = '' + parseFloat(navigator.appVersion);
	var majorVersion = parseInt(navigator.appVersion, 10);
	var nameOffset, verOffset, ix;
	var resultVersion = {};
	
	if((verOffset = nAgt.indexOf("MSIE")) != -1){
		browserName = "Microsoft Internet Explorer";
		fullVersion = nAgt.substring(verOffset + 5);
	}else if((verOffset = nAgt.indexOf("Trident")) > -1){
		browserName = "Microsoft Internet Explorer";
		var ver = nAgt.substring(verOffset + 8, verOffset + 9);
		fullVersion = parseInt(ver) + 4;
	}
	
	//풀버전 정보 확인하기
	if(typeof fullVersion == "string" && (ix = fullVersion.indexOf(";")) != -1){
		fullVersion = fullVersion.substring(0, ix);
	}
	
	if(typeof fullVersion == "string" && (ix = fullVersion.indexOf(" ")) != -1){
		fullVersion = fullVersion.substring(0, ix);
	}
	
	majorVersion = parseInt('' + fullVersion, 10);
	
	if(isNaN(majorVersion)){
		fullVersion = '' + parseFloat(navigator.appVersion);
		majorVersion = parseInt(navigator.appVersion, 10);
	}
	
	resultVersion.appVersion = nVer;
	resultVersion.userAgent = nAgt;
	resultVersion.browserName = browserName;
	resultVersion.fullVersion = fullVersion;
	resultVersion.majorVersion = majorVersion;
	
	return resultVersion;
}