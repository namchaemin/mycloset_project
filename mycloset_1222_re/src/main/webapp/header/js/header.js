$(function() {
	headerInit();
	headerLogo();
	headerSearchIcon();
	headerGnb();
	headerAccount();
});

function headerInit() {
	$(".hd-gnb-sub").css("opacity",0).hide();
}

function headerLogo() {

	$("#hd-logo-svg").hover(function() {
		$(this).attr("src", "../header/css/images/logo_gr.svg");
	}, function() {
		$(this).attr("src", "../header/css/images/logo_pk.svg");
	});

}

function headerSearchIcon() {
	$(".hd-searchBox").focus(function() {
		 $(this).prev("#hd-icon-search").css("color","#333");
	});
	
	$(".hd-searchBox").blur(function() {
		 $(this).prev("#hd-icon-search").css("color","#ccc");
	});
}


// navigation show & hide
function headerGnb() {

	var $list = $(".hd-gnb-sub")
	var th = $list.height()
	var isPlay = false
	
    /*$("#hd-gnb>li>a").click(function () {*/
    	$(document).on("click","#hd-gnb>li>a",function () {
    	
        if (!isPlay) {
            $(this).next().slideDown().show().animate({opacity:1, top:85}, 300);
        } else {
            $list.hide("slow").animate({opacity:0, top:120}, 300);
        }

        isPlay = !isPlay
    });
	
/*	
	$( "#hd-gnb>li>a" ).click(function() {
		  $(this).next().animate({
		    opacity: 1,
		    top: 85,
		    height: $(this).next().height()
		  }, 500);
	});
*/

}

function headerAccount() {
	$(".hd-account").colorbox({href:"../account/account.jsp", scrolling:"false"});
	$(".hd-account-set").colorbox({height:"115%", scrolling:"false"});

}


