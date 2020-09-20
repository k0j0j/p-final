<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
		   <div class="share_modal_container modal_number_3" style="display: none; opacity: 0;">
	        <div class="resvr_modal_dialog">
	            
	            <div class="resvr_modal_header">
	                <div class="resvr_modal_title">예약하기</div>
	                <span class="resvr_modal_name">스타쉐프 바이 후남</span>
	                <div class="resvr_modal_address">인천광역시 남동구 구월동 1364-8</div>
	            </div>
	            
	            <div class="resvr_modal_content">
	                <input id="datepicker" class="form-control resvr_modal_date" type="date" name="resvr_date" placeholder="예약날짜">
	                <input class="form-control resvr_control_time" type="time" name="resvr_time">    
	                    
	                    <select class="custom-select resvr_control_number" id="inputGroupSelect02" placeholder="예약시간">
	                        <option selected disabled>인원수</option>
	                        <option value="1">1</option>
	                        <option value="2">2</option>
	                        <option value="3">3</option>
	                        <option value="4">4</option>
	                        <option value="5">5</option>
	                        <option value="6">6</option>
	                        <option value="7">7</option>
	                        <option value="8">8</option>
	                        <option value="9">9</option>
	                        <option value="10">10</option>
	                    </select>    
	            </div>
	            <div class="alert alert-warning resvr_control_result" role="alert">
	            	<span class="resvr_control_result_date">0000-00-00</span> 
	            	<span class="resvr_control_result_time">00:00</span> 
	            	<span class="resvr_control_result_number">0</span>명 
	            	<span class="resvr_control_result_price">0</span>원 
	            </div>
	
	            <div class="resvr_modal_content">
	                <input class="form-control resvr_control_name" name="resvr_name" type="text" placeholder="성함을 입력해주세요">
	                <input class="form-control resvr_control_phone" name="resvr_phone" type="text" placeholder="전화번호를 입력해주세요">
	            </div>
	            <div class="resvr_modal_content">
	                <textarea class="form-control resvr_control_content" id="exampleFormControlTextarea1" name="resvr_content" rows="3" placeholder="요청 사항을 입력하세요."></textarea>
	            </div>
	            
	            <div class="resvr_button_wrapper" style="margin-top: 20px;">
	                <button type="button" class="btn btn-outline-warning resvr_cancel_btn">취소하기</button>
	                <button type="submit" class="btn btn-outline-warning resvr_ok_btn" onclick="resve_click();">예약하기</button>
	            </div>
	        </div>
	    </div>

	<script>
		// 예약 내역 바뀔때마다 결과 값 바꾸기

		$(".resvr_modal_date").on("propertychange change keyup paste input",
				function() {
					var newValue = $(".resvr_modal_date").val();
					console.log(newValue);

					$(".resvr_control_result_date").html(newValue);

				});

		$(".resvr_control_time").on("propertychange change keyup paste input",
				function() {
					var newValue = $(".resvr_control_time").val();
					console.log(newValue);

					$(".resvr_control_result_time").html(newValue);

				});

		$(".resvr_control_number").on(
				"propertychange change keyup paste input", function() {
					var newValue = $(".resvr_control_number").val();
					var newValue2 = $(".resvr_control_number").val() * 5000;
					money = newValue2;
					console.log(newValue);

					$(".resvr_control_result_number").html(newValue);
					$(".resvr_control_result_price").html(newValue2);

				});

		// 예약 버튼 클릭
		function resve_click() {

			var date = document.querySelector(".resvr_modal_date").value;
			var time = document.querySelector(".resvr_control_time").value;
			var number = document.querySelector(".resvr_control_number").value;

			var name = document.querySelector(".resvr_control_name").value;
			var phone = document.querySelector(".resvr_control_phone").value;
			var content = document.querySelector(".resvr_control_content").value;
			var amount = number * 5000;
			var rNo = $
			{
				restaurant.RNo
			}
			;
			//var mNo = ${ loginUser.mNo };

			//console.log(date + " " + time + " " + number);

			var resvrInfo = "${ restaurant.RName }" + " "
					+ date.substring(5, 10);
			//console.log(resvrInfo);

			var IMP = window.IMP;
			IMP.init('imp64570035');
			console.log(money);

			IMP.request_pay({
				pg : 'kakao',
				merchant_uid : 'merchant_' + new Date().getTime(),

				name : resvrInfo,
				amount : money,
				buyer_email : '${ loginUser.mEmail }',
				buyer_name : '${ loginUser.mName }',
				buyer_tel : '${ loginUser.mPhone }',
				buyer_addr : '${ loginUser.mAddress }',
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {

					$.ajax({
						type : "post",
						url : "resve.do",
						data : {
							'rsvde' : date,
							'rsvtm' : time,
							'visitrCo' : number,
							"rsvctm" : name,
							"resvePhone" : phone,
							"resveReq" : content,
							"resveAmount" : amount,
							"rNo" : rNo,
							"mNo" : mNo
						},

						success : function() {
							var msg = '결제가 완료되었습니다.';

						}
					});

				} else {
					console.log("실패");
					var msg = '결제에 실패하였습니다.';
					//msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
				document.location.href = "/honeypoint/"; //alert창 확인 후 이동할 url 설정
			});

		}
	</script>
</body>
</html>