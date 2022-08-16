$(document).ready(function() {		
	//게시판 리스트형태
	//$('.listJQ ul > li > div').css('display','none');
	$('.listJQ ul > li > a').on('click keypress', function(){
		if(  $(this).next('div').css('display') == "none"  ){
			$('.listJQ ul > li > div').slideUp();			
			$('.listJQ ul > li').removeClass('active');
			$(this).next('div').slideDown(200);
			$(this).parent().addClass('active');
		}			
		else{
			$(this).next('div').slideUp();
			$(this).parent().removeClass('active');
		}
		return false;
	})	
	
	//게시판 테이블형태
	$('.listTJQ .view').css('display','none');	
	$('.listTJQ  .title2 a').on('click keypress', function(){
		if(  $(this).parent().parent().next('.view').css('display') == "none"  ){		
			$('.listTJQ .view').slideUp();
			$('.listTJQ .title2').removeClass('active');
			$('.listTJQ .title2 .btn').find('span').text('자세히보기');
			$(this).parent().parent().addClass('active');
			$(this).parent().parent().next('.view').slideDown(200);
			$(this).find('span').text('닫기');
		}			
		else{
			$(this).parent().parent().removeClass('active');
			$(this).parent().parent().next('.view').slideUp();
			$(this).find('span').text('자세히보기');
		}
		return false;
	})	
	$('.listTJQ  .title a').on('click keypress', function(){
		if(  $(this).parent().parent().next('.view').css('display') == "none"  ){		
			$('.listTJQ .view').slideUp();
			$('.listTJQ .title').removeClass('active');
			$('.listTJQ .title .btn').find('span').text('자세히보기');
			$(this).parent().parent().addClass('active');
			$(this).parent().parent().next('.view').slideDown(200);
			$(this).find('span').text('닫기');
		}			
		else{
			$(this).parent().parent().removeClass('active');
			$(this).parent().parent().next('.view').slideUp();
			$(this).find('span').text('자세히보기');
		}
		return false;
	})	
	$('.listTJQ  .title').on('click keypress', function(){
		if(  $(this).next('.view').css('display') == "none"  ){		
			$('.listTJQ .view').slideUp();
			$('.listTJQ .title').removeClass('active');
			$('.listTJQ .title .btn').find('span').text('자세히보기');
			$(this).addClass('active');
			$(this).next('.view').slideDown(200);
			$(this).find('.btn > span').text('닫기');
		}			
		else{
			$(this).removeClass('active');
			$(this).next('.view').slideUp();
			$(this).find('.btn > span').text('자세히보기');
		}
		return false;
	})	
	
	//드롭다운
	$('.dropdownJQ > ul').css('display','none');
	$('.dropdownJQ > a').on('click keypress',function(){
		if($(this).parent().find('ul').css('display') == 'none'){
			$(this).next('ul').slideDown(200);
		} else {
			$(this).next('ul').slideUp(200);
		}
		return false;
	})
	
	//검색어 input
	$('.word').val('검색어를 입력하세요.');
	$('.word').on('click focusin', function(){
		$(this).val('');
	})
	$('.word').on('focusout', function(){
		if( $(this).val() == "" ){
			$(this).val('검색어를 입력하세요.');
		} 
	})
	
	//head 나의 검색어
	$('.hoverJQ > .goods').css('display','none');
	$('.hoverJQ').eq(0).find('.goods').css('display','');
	$('.hoverJQ > a').on('mouseenter focusin',function(){
		$('.goods').css('display','none');
		$(this).next().css('display','');
		return false;
	})
	
	//검색내 재검색
	$('.reword').val('결과내 재검색');
	$('.reword').on('click focusin', function(){
		$(this).val('');
	})
	/*$('.txtinput').on('focusout', function(){
		if( $(this).val() == "" ){
			$(this).val('검색어를 입력하세요.');
		} 
	})*/
	
	//검색조건 : 더보기
	$('.moreJQ > ul').animate({height:'177px'},500);	
	$('.moreJQ .open').on('click keypress',function(){
		if( $(this).parent().find('ul').css('height') == "177px"  ){	
			$(this).removeClass('open').addClass('close').text('닫기');
			$(this).parent().find('ul').animate({height:'354px'},500);
			return false;
		} else {
			$(this).removeClass('close').addClass('open').text('더보기');
			$(this).parent().find('ul').animate({height:'177px'},500);
			return false;
		}
	})
		
	//리스트 over
	$('.list_box > ul > li').on('mouseenter focusin',function(){
		$('.search_result_box > ul > li').removeClass('active');
		$(this).addClass('active');
			return false;
	});
	$('.list_box > ul > li').on('mouseleave focusout',function(){
		$(this).removeClass('active');
			return false;
	});
	
	$('.imglist .goods_btn').css({'top':'70%','opacity':'0'});
	$('.imglist > ul > li').on('mouseenter focusin',function(){
		$(this).find('.goods_btn').animate({'top':'50%','opacity':'100'},500);
			return false;
	});
	$('.imglist > ul > li').on('mouseleave focusout',function(){
		$(this).find('.goods_btn').animate({'top':'70%','opacity':'0'},200);
			return false;
	});
	
	//topmenu 외국어영역
	$('.langJQ > a').eq(0).addClass('active');
	$('.langJQ > a').on('mouseenter focusin',function(){
		$('.langJQ > a').removeClass('active');
		$(this).addClass('active');
			return false;
	});
	$('.langJQ').on('mouseleave focusout',function(){
		$('.langJQ > a').removeClass('active');
		$('.langJQ > a').eq(0).addClass('active');
		return false;
	});
	
	//전체메뉴보기
	$('.allmenuJQ > ul').css('display','none');
	$('.allmenuJQ > a').on('click keypress',function(){
		if($(this).parent().find('ul').css('display') == 'none'){
			$(this).text('닫기').addClass('active');
			$(this).next('ul').slideDown(200);
		} else {
			$(this).text('전체메뉴보기').removeClass('active');
			$(this).next('ul').slideUp(200);
		}
		return false;
	})
	
	$('.quick.quick_left .banner ul li').eq(0).css('display','block');
	$('.quick.quick_left .banner ul li').eq(1).css('display','none');
	$('.quick.quick_left .banner ul li').eq(2).css('display','none');
	
	/*
	//탭
	$('.tabBox .tabCon').css('display','none');
	$('.tabBox > .tabCon.c_tab1').css('display','block');
	$('.tabBox > .btnBox > a').eq(0).addClass('active');
	$('.tabBox > .btnBox > a').click(function(){
		$('.tabBox > .btnBox > a').removeClass('active');
		$(this).addClass('active');
		$('.tabBox > .tabCon').hide();
		var aLnb=$(this).attr('id');
		$('.tabCon.c_'+aLnb).show();
	})
	*/

	/* radio button check change event */
	var $radio = $(".radioChange input[type=radio]");
	var $radioCon = $(".radioCon");
	$radio.click(function(){	
		$radioCon.removeClass("on");
		$radioCon.eq($(this).parent().index()).addClass("on");
	});
	
	var $radio2 = $(".radioChange2 input[type=radio]");
	var $radioCon2 = $(".radioCon2");
	$radio2.click(function(){	
		$radioCon2.removeClass("on");
		$radioCon2.eq($(this).parent().index()).addClass("on");
	});
	
	var $radio3 = $(".radioChange3 input[type=radio]");
	var $radioCon3 = $(".radioCon3");
	$radio3.click(function(){	
		$radioCon3.removeClass("on");
		$radioCon3.eq().addClass("on");
	});
	
	/* table hover event */
	$(".hoverCol tbody tr").hover(function(){
		$(this).find("td").css("background-color","#dbeef4");
	},function(){
		$(".hoverCol tbody tr td").removeAttr("style");
	});

	/* lnb */
	var $lnb = $(".lnb.hide");
	var $lnbList = $(".lnb.hide .lnbList > li > a");
	var $lnbTog = $(".lnb_toggle a");
	var _memory = $(".lnbList .current").index();
	$lnbTog.bind('click focusin',function(){
		$lnb.animate({left: 0},400,'swing');
		$lnbTog.parent().animate({opacity: 0, left:"-30px"},500);
		$lnb.find("a").removeAttr("tabindex");
	});
	$lnbList.click(function(e){
		if ($(this).attr("href") == "#" || $(this).attr("href") == "") e.preventDefault();
		$lnbList.parent().removeClass("current");
		if (!$(this).parent().is(".current")) $(this).parent().addClass("current");
	});
	$lnb.mouseleave(function(){
		$lnb.animate({left: "-190px"},400,'swing',function(){
			$lnbList.parent().not(":eq("+_memory+")").removeClass("current");
			$lnbList.parent().eq(_memory).addClass("current");
			$lnbTog.parent().animate({opacity: 1, left:"0px"},200);
			$lnb.find("a").attr("tabindex","-1");
		});
	});
	$lnb.find("a").last().focusout(function(){
		$lnb.animate({left: "-190px"},400,'swing',function(){
			$lnbList.parent().not(":eq("+_memory+")").removeClass("current");
			$lnbList.parent().eq(_memory).addClass("current");
			$lnbTog.parent().animate({opacity: 1, left:"0px"},200);
			$lnb.find("a").attr("tabindex","-1");
		});
	});

	// 임시 스크립트
	if ($("#sbody_layout").outerHeight() <= 800)
	{
		$("#sbody_layout").css("min-height","900");
	}

	// 결제 스크립트
	var $payment = $(".paymentList");
	$payment.find("input[type=radio]:eq(0)").attr("checked","checked");
	$payment.find(".h5_wrap:eq(0)").addClass("on");
	$payment.find("input[type=radio]").click(function(e){
		$payment.find(".h5_wrap").removeClass("on");
		$payment.find(".h5_wrap").eq($(this).parent().index()).addClass("on");
	});

	// 우표 선택사항 마우스 오버 썸네일 이벤트
	for (i=0; i <= $(".thumbsList tbody th").length; i++)
	{
		var it = $(".thumbsList tbody th").eq(i).text();
		if (it == "전지" || it == "낱장" || it == "소형시트" || it == "우표책" || it == "우표첩" || it == "엽서")
		{
			var a = $(".thumbsList tbody th").eq(i).text();
			$(".thumbsList tbody th").eq(i).text("");
			$(".thumbsList tbody th").eq(i).append("<a href='#'>"+a+"</a>");
		}
	}
	$(".thumbsList").find("a").hover(function(){
		var _css = { "position" : "absolute", "border" : "2px solid #000", "left" : "-60px", "padding" : "10px", "text-align" : "center", "background-color" : "#fff", "min-width" : "250px" },
			indexNum = $(this).parent().index(),
			be = $(this).text();
		$(this).closest("th").css("position","relative");
		if ($(this).parent().attr("scope") == "col")
		{
			$(this).parent().append('<div class="stampOverLay"><img src="../np2assets/images/dd/n_img_stamp'+indexNum+'.gif" /> <hr /> <p>'+indexNum+'개의 우표로 구성된 전지</p></div>');
		}else{
			var t;
			switch (be)
			{
				case "전지": t = "우표를 한장 한장 떼기 전의 상태로 사방에 변지가 붙어 있는 것입니다."; break;
				case "낱장": t = "우표를 한장 한장 떼어낸 상태입니다.<br>발송예시 : 4종 1매 선택시 4종우표 1세트가 발송됩니다.(낱장4매)"; break;
				case "소형시트": t = "수집용으로 만든 것으로 우표의 한 장 또는 여러장을 넣고 그 주위에 기념의 문자 등을 넣은 것입니다. 전지와 같은의미입니다."; break;
				case "우표책": t = "그 해에 발행된 우표, 시트 전체를 수록하여 우표에 관한 상세한 설명과 우표에서 보여주지 못한 그림자료들이 함께 수록되어 선물용, 소장용, 교육용으로 그 활용 가치가 높습니다."; break;
				case "우표첩": t = "각종 시리즈 우표 및 기념우표를 주제별로 묶어 놓은 것으로 관련 우표를 한눈에 볼 수 있도록 구성해 놓았습니다. 따라서 시리즈 우표들을 일시에 구입하고자 하는 분들에게는 물론 우표책과 마찬가지로 선물용, 소장용, 교육용으로도 좋은 제품입니다."; break;
				case "엽서": t = "간단한 소식이나 모임의 통지서, 퀴즈 응답 등을 보낼 때 간편하게 사용할 수 잇으며, 별도로 편지지나 봉투가 필요 없어 최저 우편요금으로 이용할 수가 있습니다."; break;
			}
			$(this).parent().append('<div class="stampOverLay">'+t+'</div>');
		}
		$(".stampOverLay").css(_css);
	},function(){
		$(this).closest("th").removeAttr("style");
		$(".stampOverLay").remove();
	});
});

// 테이블 row 추가 삭제
function fn_tableRow(obj, behavior){
	var $o = $("."+obj+" tbody");
	var $ro;
	if (behavior == "add")
	{
		if ($o.find("tr").length == 1){
			$ro = $o.html();
			$o.append($ro);
		}else{
			$ro = $o.find("tr:last").prev().html();
			$o.append("<tr>"+$ro+"</tr>");
		}
	}else if (behavior == "del")
	{
		if ($o.find("tr").length > 1) $o.find("tr:last").remove();
	}
}



function cm(a1){
	var $sub = a1;
	var $btnCon = $(".btnCon");
	var $divCon = $(".divCon");
	//alert(sub);
	$btnCon.find("li").removeClass("on");
	$btnCon.find("li").eq($sub-1).addClass("on");
	$divCon.removeClass("on");
	$divCon.eq($sub-1).addClass("on");
}

// 탭 show/hide 기능
$.fn.tab = function(options){
	var defaults = {
		show : 0,
		contents : ''
	};
	
	var options = $.extend({},defaults,options);
	var $this = $(this);
	var $elm = $this.find("a");

	$(options.contents).eq(options.show).addClass("on");

	$elm.click(function(e){
		if ($(this).attr("href") == "#") e.preventDefault();
		$elm.parent().removeClass("on");
		$(this).parent().addClass("on");
		$(options.contents).removeClass("on");
		$(options.contents).eq($(this).parent().index()).addClass("on");
		
	});
}

// textarea 라인수 제한
function fn_TextLineLimit(elm){
	var t = $(elm).val();
	var lineSp = t.split("\n");
	console.log(lineSp.length);
	if (lineSp.length >= 29 && event.keyCode == 13){
		alert("30줄까지만 입력 가능합니다.");
		event.returnValue = false;
	}
}