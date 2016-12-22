<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../header/header.jsp" %>

<html lang="ko">
<head>
<script src="../front/js/facebooklogout.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>card UI</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<!-- CSS -->
<!-- <link rel="stylesheet" href="bootflat_main.css"> -->
<link rel="stylesheet"
	href="../node_modules/bootflat/bootflat/css/bootflat.css">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.css">

<link rel="stylesheet" href="../main/css/fonts.css">
<link rel="stylesheet" href="../main/css/main.css">


</head>

<body>



	<!--  !!  Modal  !!  -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<!--x버튼-->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<div class="user_profile">
						<img id="userProfileImg" src="#" style="width: 30px; height: 30px">
						<span id="userNickname" class="user_name"></span>
					</div>
					<div class="user_storage">
						<img src="storage.PNG"> <span class="tagbutton"><img
							src="money.PNG" style="width: 30px; height: 35px"> </span>
					</div>
				</div>
				<div class="modal-body">

					<div class="modal-image">
						<img src="park.jpg"> <span id="tag1" class="rounded">
							&#8361;&nbsp480,000</span> <span id="tag2" class="rounded">
							&#8361;&nbsp700,000</span>
					</div>
					<div class="reaction">
						<br /> <font size="4"> 반응&nbsp24개</font> &nbsp <img
							id="chang_image" src="love.JPG" />
					</div>

					<div class="icon_list">
						<br /> <a href="http://www.facebook.com" target=_blank><img
							src="facebook.PNG"></a>&nbsp&nbsp&nbsp <a
							href="http://www.instargram.com" target=_blank><img
							src="instagram.PNG"></a>&nbsp&nbsp&nbsp <img src="share.PNG">&nbsp&nbsp&nbsp
					</div>
					</br> <br />

					<div class="modal-table">
						<table width="100%" height="80" border="0" cellpadding="0"
							cellspacing="0" style="table-layout: fixed">
							<tr>
								<th class="line">코트</th>
								<th class="line">하의</th>
								<th class="line">신발</th>
								<th class="line">머플러</th>
							</tr>
							<tr>
								<th class="lineright"><a href="http://www.naver.com">brandA</a></th>
								<th class="lineright"><a href="http://www.daum.net">brandB</a></th>
								<th class="lineright"><a href="http://www.google.com">brandC</a></th>
								<th><a href="http://www.fackbook.com">brandD</a></th>
							</tr>
							<tr>
								<th>&#8361;&nbsp480,000</th>
								<th>&#8361;&nbsp160,000</th>
								<th>&#8361;&nbsp210,000</th>
								<th>&#8361;&nbsp110,000</th>
							</tr>
						</table>
						<br />
					</div>

					<div class="comment">
						<font size="3">TakahiroK 님의 Comment</font> <br /> <br />
					</div>

					<div class="comment">
						<input type="text"
							onfocus="if(this.value =='옷장구독해주세요') this.value='';"
							onblur="if(this.value =='') this.value='옷장구독해주세요';"
							value="옷장구독해주세요" size="65"
							; style="background-color: transparent; border: 0">
					</div>
					<div class="horizonal">
						<HR width="100%" align="right"
							style="color: #e2e2d2; background-color: #e2e2d2; height: 3px; border: none" />
					</div>

					<div class="seecomment">
						<font face="Arial Black" font size="4"> 댓글</font>
					</div>

					<div class="arrow">
						<img src="love.JPG">
					</div>

					<div class="horizonal2">
						<HR width="100%" align="right"
							style="color: #e2e2d2; background-color: #e2e2d2; height: 2px; border: none" />
					</div>

					<div class="table2">
						<table>
							<tr>
								<th>userId</th>
								<td style="padding: 10px">댓글입력</td>
							</tr>
							<tr>
								<th style="padding: 10px">userA</th>
								<td style="padding: 10px">옷잡 구독</td>
							</tr>
							<tr>
								<th style="padding: 10px">userB</th>
								<td style="padding: 10px">머플러가 너무 멋지네요!</td>
							</tr>
						</table>
					</div>
					<h3>야이씨 나온다.</h3>
				</div>
			</div>

		</div>
	</div>

	<!--  SaveModal -->
	<div id="saveModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<p>Some text in the modal.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	<!--  card post start  -->
	<div class="container">
		<div class="grid" id="grid" style="opacity: '1';"></div>
	</div>

	<!-- JS -->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../node_modules/bootstrap/js/modal.js"></script>

	<script src="../main/js/eg.pkgd.min.js"></script>
	<script src="../main/js/main.js"></script>
	<script src="../main/js/jquery.colorbox-min.js"></script>
	
	<script>
	$(function(){
	    $("#imgHanger").hover(function() {
	        $(this).attr("src", "css/images/hang_line_bl.svg");
	    }, function() {
	        $(this).attr("src", "css/images/hang_bl.svg");
	    });
	});
	</script>

</body>
</html>