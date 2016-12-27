<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>

<!-- CSS -->
<link rel="stylesheet" href="../header/css/reset.css">
<link rel="stylesheet"
	href="../node_modules/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="../header/css/fonts.css">
<link rel="stylesheet" href="../header/css/header.css">
<link rel="stylesheet" href="../header/css/colorbox.css">

</head>

<body>
	<div id="headerWrap">
		<header id="header">
			<!-- logo -->
			<h1 class="hd-logo">
				<a id="hd-logo-link" href="../index.jsp"> <img id="hd-logo-svg"
					src="../header/css/images/logo_pk.svg" alt="logo">
				</a>
			</h1>

			<!-- Search -->
			<div id="hd-search">
				<span id="hd-icon-search" class="glyphicon glyphicon-search"
					aria-hidden="true"></span> <input type="text" class="hd-searchBox"
					placeholder="Search" required />
			</div>

			<!-- Navigation -->
			<nav id="hd-nav">
				<h2 class="hide">메인메뉴</h2>

				<!-- global navigation bar -->
				<ul id="hd-gnb">
					<li><a href="#" class="hd-gnb-upload"> UPLOAD </a> <!-- sub Menu 01 -->
						<ul class="hd-gnb-sub">
							<li><a href="#"> 사진 업로드 </a></li>
						</ul></li>

					<!-- gnb02 message -->
					<li><a href="#" class="hd-gnb-message"> MESSAGE </a> <!-- sub Menu 02 -->
						<!-- 받은 메세지 // javaScript로 수정할 영역 -->
						<ul class="hd-gnb-sub hd-msg">
							<div class="hd-msg-tab">
								<span class="hd-tab-msg"> <a href="#"> Message </a>
								</span> <span class="hd-tab-bot"> <a id="chatClick" href="#"> Chat Bot </a>
										
										<div >
										<span id="chatbot"><div   class="fb-messengermessageus"
											messenger_app_id='1222628424496492'
											page_id='1270710446313254' color="blue" size="standard">
										</div>
										</span>
									</div>	
																
     							</span>
							</div>
							<span class="hd-msg-txt"> recent message </span>
							<li class="hd-receive-msg-list01">
								<div class="hd-msgList firstMsgList">
									<img class="msgUserPic" src="css/images/profile01.png"
										alt="msgUser" />
									<!--   <p class="msgUserPic"></p> -->
									<span class="msgUserId"> PopEye00 </span> <span class="userMsg">
										안녕하세요. </span>
								</div>
							</li>
							<li class="hd-receive-msg-list02">
								<div class="hd-msgList">
								<div class="fb-send-to-messenger" 
        messenger_app_id='1222628424496492'
        page_id='1270710446313254'
        data-ref="PASS_THROUGH_PARAM" 
        color="blue" 
        size="standard">
      </div>
    </div>
								
								
							</li>
						</ul> <!-- //receiveMessageBox --></li>
					<!-- //gnb02 Message -->

					<!-- gnb03 my account -->
					<li><a href="#" class="hd-gnb-wardrobe"> ACCOUNT </a> <!-- sub Menu 03  / 계정정보 -->
						<ul class="hd-gnb-sub ">
							<li class="hd-sub-account-bar"><span
								class="hd-account-bar-id"> My Account </span> 
								<c:if test="${!empty user }">
								<span class="hd-account-bar-logout"><a onclick=" logout();"> logout</a> </span></li>
								<li class="hd-sub-account"><a href="#" class="hd-account">
									<span class="hd-my-account"> 
									<c:if test="${!empty user.phot_path}">
									<img class="hd-my-img"
										alt="" src="/user/download?src=${user.phot_path}" draggable="false"
										data-pin-nopin="true">
									</c:if>
										<c:if test="${empty user.phot_path}">
									<img class="hd-my-img"
										alt="" src="../header/upload/images.png" draggable="false"
										data-pin-nopin="true">
									</c:if>
									
								</span> <span class="hd-my-nick"> ${user.nick} </span> <span
									class="hd-my-email"> ${user.email} </span>
							</a></li>
							</c:if>
							
							<c:if test="${!empty  faceUser}">
								<span class="hd-account-bar-logout"><a onclick=" FB.logout();"> logout</a> </span></li>
								
							<li class="hd-sub-account"><a href="#" class="hd-account">
									<span class="hd-my-account"> 
									<c:if test="${!empty   faceUser.phot_path}">
									<img class="hd-my-img"
										alt="" src="${ faceUser.phot_path}" draggable="false"
										data-pin-nopin="true">
									</c:if>
										<c:if test="${empty   faceUser.phot_path}">
									<img class="hd-my-img"
										alt="" src="../header/upload/images.png" draggable="false"
										data-pin-nopin="true">
									</c:if>
									
								</span> <span class="hd-my-nick"> ${ faceUser.nick} </span> <span
									class="hd-my-email"> ${ faceUser.email} </span>
							</a></li>
							</c:if>
							
							
							<li class="hd-sub-account-list">
								<ul>
									<li class="hd-account-list-wdr"><a href="#" class=""
										draggable="false">
											<div class="my-wdr">내 옷장</div>
									</a></li>
									<li class="hd-account-list-info">
											<a class="hd-account-set"  href="../account/account.jsp">내 정보 수정</a>
									</li>
								</ul>
							</li>
						</ul></li>
					<!--// gnb03 myAccount -->
				</ul>
				<!--//hd-gnb-->
			</nav>
			<!--//navigation-->
		</header>
		<!--//header-->
	</div>
	<!--//headerWrap-->

	<!-- JS -->
	<script src="../node_modules/jquery/dist/jquery.js"></script>
	<script src="../node_modules/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="../header/js/jquery.colorbox-min.js"></script>
	<script src="../header/js/header.js"></script>
	<script src="../front/js/facebooklogout.js"></script>
	<script type="text/javascript">
	
	function logout() {
	 location.href="/index.jsp";
	}

	</script>
</body>

</html>