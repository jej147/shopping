$(function(){
	$("#gnb_navi .menu").hover(function(){
		$(".group").css("overflow","visible");
		$(this).find(".depth2").css("top","45px");
		
		$("#gnb_navi .depth2 > li").hover(function(){
		$(this).find(".depth3").css("top","-1px");
		},function(){
			$(this).find(".depth3").removeAttr("style");
		});
	},function(){
		$(".group").removeAttr("style");
		$(this).find(".depth2").removeAttr("style");
	});
	
	$("#gnb_navi .menu").focusin(function(){
		$(".group").css("overflow","visible");
		$(this).find(".depth2").css("top","45px");
	});

	$("#gnb_navi .menu").focusout(function(){
		$(this).find(".depth2").removeAttr("style");
	});
	
	$("#gnb_navi .depth2 > li").focusin(function(){
		$(this).find(".depth3").css("top","-1px");
	});

	$("#gnb_navi .depth2 > li").focusout(function(){
		$(this).find(".depth3").removeAttr("style");
	});
	
	$("#top_layout .utile .n3").hover(function(){
		$(this).find("ul").css("top","26px");
	},function(){
		$(this).find("ul").removeAttr("style");
	});
	$("#top_layout .utile .n3").focusin(function(){
		$(this).css("background-color","#ee2e24");
		$(this).find("> a").css("color","#fff");
		$(this).find("ul").css("top","26px");
	});

	$("#top_layout .utile .n3").focusout(function(){
		$(this).removeAttr("style");
		$(this).find("> a").removeAttr("style");
		$(this).find("ul").removeAttr("style");
	});
});

// 스킵네비 포커스
$(function(){	
	$("#skipnavi").focusin(function(){
		$("#skipnavi").css("position","relative");
		$("#skipnavi").css("top","0px");
		$("#skipnavi").css("left","0px");
		$("#skipnavi").css("text-indent","0px");
	});
	$("#skipnavi").focusout(function(){
		$(this).removeAttr("style");
	});
});