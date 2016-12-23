$(function() {
	headerInit();
	headerLogo();
	headerSearchIcon();
	headerIcon()
	headerGnb();
});

function headerInit() {
	$(".hd-gnb-sub").hide().css("opacity",0);
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

// header gnb icon hover event
function headerIcon() {
	
	$(".hd-icon-upload").hover(function() {
		$(this).attr("src", "../header/css/images/icon-upload_hover.svg");
	}, function() {
		$(this).attr("src", "../header/css/images/icon-upload.svg");
	});

	$(".hd-icon-chat").on("mouseover",function() {
		$(this).attr("src", "../header/css/images/icon-chat_hover.svg");
	}/*, function() {
		$(this).attr("src", "../header/css/images/icon-chat.svg");
	}*/);
	
}


// navigation show & hide
function headerGnb() {

//	var $list = $(".hd-gnb-sub")
//	var th = $list.height()
	var isPlay = false
	
	$(".hd-icon-chat").on("click", function () {
    	
        if (!isPlay) {
//            $(this).parent().next("ul.hd-msg").show().animate({opacity:1, top:85}, 300);
            $("ul.hd-msg").show().animate({opacity:1, top:85}, 300);
            $(".hd-icon-chat").attr("src", "../header/css/images/icon-chat_hover.svg");
        } else {
        	$("ul.hd-msg").hide("slow");
        	$(".hd-icon-chat").attr("src", "../header/css/images/icon-chat.svg");
        }

        isPlay = !isPlay
    });
}




