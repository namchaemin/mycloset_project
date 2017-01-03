<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../node_modules/jquery/dist/jquery.js"></script>
</head>
<body>

	<div>
		<div>

			<!-- Modal content-->
			<div>
				<div>
					<button type="button" class="close" id="modal2Close"
						data-dismiss="modal" style="width: 20px;">&times;</button>
					<h4 class="modal-title">스타일 업로드</h4>
					<hr>

					<div class="modal-body2">

						<input type="text" style="width: 400px;" class="form-control"
							placeholder="제목을 입력하세요." id="styleTitle" name="styleTitle">

						<div class="preview-image2" id="previewImage2">
							<img class="imgBox" id="output" src="" width="400px">

							<div class="styleTagBox" style="margin-bottom: 50px;">
								<img class="styleTagNumber" id="styleTagNumber1"
									name="styleTagNumber1" src="../header/img/number1.png"> <img
									class="styleTagNumber" id="styleTagNumber2"
									name="styleTagNumber2" src="../header/img/number2.png"> <img
									class="styleTagNumber" id="styleTagNumber3"
									name="styleTagNumber3" src="../header/img/number3.png"> <img
									class="styleTagNumber" id="styleTagNumber4"
									name="styleTagNumber4" src="../header/img/number4.png"> <img
									class="styleTagNumber" id="styleTagNumber5"
									name="styleTagNumber5" src="../header/img/number5.png">
							</div>



							<hr style="margin-top: 50px;">

							<div class="addStyleToolBox">
								<p class="addStylePTag">스타일 정보 추가하기 (최대 5개)</p>
								<img id="stylePlusButton" class="styleButton" type="button"
									src="../header/img/plus-button.svg" style="margin-left: 30px;" />
								<!-- <img id="styleDeleteButton" class="styleButton" type="button" src="../header/img/delete-button.svg" /> -->

								<div id="formGroup1" class="form-group">
									<!-- <pre class="descInfo">옷정보                                  가격정보</pre> -->
									<input type="text" class="form-control" id="styleInfo"
										name="styleInfo1" placeholder="1.옷 정보"> <input
										type="text" class="form-control" id="priceInfo"
										name="priceInfo1" placeholder="1.가격 정보">
									<button type="button" class="close small" id="close1"
										style="width: 20px;">&times;</button>
									<input type="hidden" id="input_styleTagNumber1"
										name="styleTagPosition1">
								</div>

								<div id="formGroup2" class="form-group">
									<input type="text" class="form-control" id="styleInfo"
										name="styleInfo2" placeholder="2.옷 정보"> <input
										type="text" class="form-control" id="priceInfo"
										name="priceInfo2" placeholder="2.가격 정보">
									<button type="button" class="close small" id="close2"
										style="width: 20px;">&times;</button>
									<input type="hidden" id="input_styleTagNumber2"
										name="styleTagPosition2">
								</div>

								<div id="formGroup3" class="form-group">
									<input type="text" class="form-control" id="styleInfo"
										name="styleInfo3" placeholder="3.옷 정보"> <input
										type="text" class="form-control" id="priceInfo"
										name="priceInfo3" placeholder="3.가격 정보">
									<button type="button" class="close small" id="close3"
										style="width: 20px;">&times;</button>
									<input type="hidden" id="input_styleTagNumber3"
										name="styleTagPosition3">
								</div>

								<div id="formGroup4" class="form-group">
									<input type="text" class="form-control" id="styleInfo"
										name="styleInfo4" placeholder="4.옷 정보"> <input
										type="text" class="form-control" id="priceInfo"
										name="priceInfo4" placeholder="4.가격 정보">
									<button type="button" class="close small" id="close4"
										style="width: 20px;">&times;</button>
									<input type="hidden" id="input_styleTagNumber4"
										name="styleTagPosition4">
								</div>

								<div id="formGroup5" class="form-group">
									<input type="text" class="form-control" id="styleInfo"
										name="styleInfo5" placeholder="5.옷 정보"> <input
										type="text" class="form-control" id="priceInfo"
										name="priceInfo5" placeholder="5.가격 정보">
									<button type="button" class="close small" id="close5"
										style="width: 20px;">&times;</button>
									<input type="hidden" id="input_styleTagNumber5"
										name="styleTagPosition5">
								</div>

							</div>

							<hr>

							<label
								style="float: left; margin-left: -340px; margin-top: 10px;">내용</label>
							<textarea name="styleDesc" id="memo" style="width: 400px;"
								class="form-control" rows="5"
								placeholder="#을 이용하여 해시태그를 등록 해보세요!                                 예)  #청바지 랑 #셔츠 새로 샀어요!"></textarea>

							<hr>

							<button class="btn btn-default submitbuttom" id="uploadSubmitBtn"
								style="margin-top: 10px; margin-left: 84%;">업로드</button>

						</div>

					</div>

				</div>
			</div>

		</div>
	</div>


	<script>
$.ready(function(){
    $.ajax()
});

</script>
</body>
</html>