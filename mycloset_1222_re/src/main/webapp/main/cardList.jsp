<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

    
    <!-- 로그인 성공했을때 오는 화면  -->
<%-- <%@ include file ="../header/header.jsp"%> --%>

<!DOCTYPE html><html lang="ko"class=''>
<head>
<script src="front/js/facebooklogout.js"></script>
<script src='//production-assets.codepen.io/assets/editor/live/console_runner-5710c30fb566082d9fcb6e7d97ee7e3f2a326128c9f334a4231b6fd752b29965.js'></script><script src='//production-assets.codepen.io/assets/editor/live/events_runner-d5e4bf42585b8da8c18f7d963dbfc17cd66a79aa586c9448c4de8d6952ee9d97.js'></script><script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-25d1423d5d6fb975e7d61832d2c061422a94963ca446583b965dfc5569147311.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
<link rel="canonical" href="http://codepen.io/egjs/pen/ONWbGJ" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>InfiniteGrid(Masonry)</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootflat/2.0.4/css/bootflat.min.css">


 <style class="cp-pen-styles">body {background-color: #f1f2f6;}
.item,
.grid-item, .grid-sizer {
  width:50%;
  min-height: 1px;
    padding-right: 15px;
    padding-left: 15px;
}
 @media (min-width: 768px) {
  .item,
  .grid-item, .grid-sizer  {
    width : 33.33333333%;
  }
}
@media (min-width: 992px) {
  .item ,
  .grid-item, .grid-sizer {
    width : 25%;
  }
}
@media (min-width: 1200px) {
  .item,
  .grid-item, .grid-sizer  {
    width : 16.66666667%;
  }
} 

#stats {
    width: 80px;
    opacity: 0.9;
    cursor: pointer;
    position: fixed;
    left: 50%;
    margin-left: -112px;
    top: 0px;    z-index: 110;

}
#fpsText {
    font-size: 11px !important;
}
.loadCnt,
.timeStamp {
    height: 24px;;
    margin: 0 5px;
}
.benchContainer {
    height: 99px;width: 230px;
-webkit-transform:  translateX(-50%);

    position: fixed;
    top: 0px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 100;
    font-size: 16px;
    text-align: right;
    background: rgba(255, 255, 255, 0.8);
    background: rgb(0, 0, 34);
    font-family: Helvetica, Arial, sans-serif;
    font-weight: bold;
    line-height: 24px;
    font-size: 14px;
    color: rgb(0, 255, 255);
    padding: 6px;
    text-align: right;
}

.benchContainer button {
    background-color: rgba(255,255,255, .4);
    border-radius: 5px;
    border: none;
    margin: 5px;
    outline: none;
}</style>  </head><body>

   

    
<div class="container">

    
    <!-- navbar -->
          
    <!-- jumbotron -->
    
    <!-- infinite grid -->
   
   <div id="grid" class="row grid" style="visibility:hidden">
        <div class="grid-sizer">
        </div>
    </div> 
    
</div>
<script id="items-template" type="text/x-handlebars-template">
    {{~#each items~}}
    <div class="item grid-item">
        <div class="thumbnail">
            <img class="img-rounded" src="{{imgSrc}}" />
            <div class="caption">
                <p><a href="{{href}}">{{desc}}</a></p>
            </div>
        </div>
    </div>
    {{~/each~}}
</script>

<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-58d22c749295bca52f487966e382a94a495ac103faca9206cbd160bdf8aedf2a.js'>
</script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js'>
</script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.min.js'>
</script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/masonry/4.0.0/masonry.pkgd.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.imagesloaded/4.1.0/imagesloaded.pkgd.min.js'></script>
<!-- <script src="/header/header.js"></script> -->
<script>
var template = Handlebars.compile($("#items-template").html());
var data = {
    getItems: function(groupNo) {
        groupNo *= 15;
        var items = [];
        for(var i=0; i<15; i++) {
            items.push(groupNo + i);
        }
        items = $.map(items, function(v) {
            return {
                offset: v,
                imgSrc: "http://naver.github.io/egjs-experiment/infiniteGridService/demo/img/" + ( ( (v + 1) % 60) + 1 ) + ".jpg",
                href: "http://naver.com/",
                desc: "Cras justo odio..."
              };
        });
        return {items: items};
    }
};  
    
var groupIdx = 0;
function getItemElement() {
    return $(template(data.getItems(groupIdx++)));
};


var msnry = new Masonry( '.grid', {
    columnWidth: '.grid-sizer',
    percentPosition: true,
    transitionDuration: 0
});

 function appendItem() {
    var el = getItemElement();
    $(msnry.element).append( el );
    imagesLoaded(  document.querySelector('.grid'), function() {
        msnry.appended( el );
        $('.grid').css("visibility", "visible");
    }); 
} 

var loadCnt = 0;
window.addEventListener('scroll', function() {
    if(window.scrollY + window.innerHeight >= parseInt(window.getComputedStyle(document.documentElement).height)) {
        appendItem();

        // bench 
        $('.loadCnt').html(++loadCnt + "번 추가 로드");
    }
});
appendItem();

//# sourceURL=pen.js
</script>

</body></html>
