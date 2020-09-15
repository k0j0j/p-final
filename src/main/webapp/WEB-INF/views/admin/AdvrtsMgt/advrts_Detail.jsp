<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/main/favicon.png" />
<title>HONEYPOINT, 나의 맛집 로드</title>  

<!-- Font setting -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
	span.guide {	
	display: none;
	}
	
	span.ok {
		color: navy;
	}
	
	span.error {
		color: red;
	}
</style>

</head>
<body>
	<%@ include file="../common/aNav.jsp" %>
	
	<!-- 배경 이미지 -->
	<div class="container">
		
		<div class="container-second" style="border: 0px">
			
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-5 pl-3 pt-3  overflow-auto">	
			<h3>ADMIN MANAGEMENT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2">시스템 관리 ▶ 광고 상세 페이지</p>
				</div>
			</div>
			
			<!-- SIGN UP-->
			<div class="tab-content ">
	 			<div class="tab-pane fade show active pl-2 pb-5" id="home" role="tabpanel" aria-labelledby="home-tab">
					<!-- TITLE -->
					<div class="pt-4" style="text-align:center">
						<h3 style="color:#006a7d">REGISTER ADVRTS</h3>
					</div>
					<form action="mngInsert.do" method="post" id="mngInsert" onsubmit="return validate()">
						<table width="600" class="table col-8 table-center">
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">NAME</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text2 pasic-font-txt" id="bnrNM" name="bnrNM" style="width:400px; height:30px" placeholder="광고 업체 이름을 입력하세요." required>
							</tr>			
											
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top: 100px !important">DETAIL NOTE</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<textarea name="bnrNote" id="bnrNote" style="resize: none; width:400px; height:200px" placeholder="광고에 대한 구체적인 설명을 작성해주세요." required></textarea>
							</tr>							
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">BANNER FILE</td>
								<td scope="col" class="signup-td pasic-font-txt">
									<input type="file" class="signup-input-text2" name="bnrId" id="bnrId" style="padding-top:5px" placeholder="게시할 광고 이미지 첨부" required>
								</td>
							</tr>							
						</table>
						<div class="pt-5" style="margin:auto; width:50%; text-align:center">
							<input type="submit" class="btn btn-warning select-btn dohyeon-font" value="REGISTRATION">
							<button class="btn btn-default select-btn dohyeon-font" onclick="location.href='managerList.do'">CANCEL</button>
						</div>
					</form>				
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function validate(){
		if($("#idDuplicateCheck").val() == 0){
			alert("사용 가능한 아이디를 입력해주세요.");
			$("#mId").focus();
			return false;
		}else {
			return true;
		}
	}

	 $(function(){
		$("#mId").on("keyup", function(){
			var mId = $(this).val().trim();
		  
			if(mId.length < 5){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);				  	
				return;
			}		  
		
			$.ajax({
				url:"idCheck.do",
				data:{mId:mId},
				success: function(data){
					console.log(data);
					
					if(data.isUsable == true){	// boolean 타입 자체로 리턴되므로 따옴표 없이 비교한다.
						$(".guide.id-error").hide();
					 	$(".guide.id-ok").show();
					 	$("#idDuplicateCheck").val(1);	// value 1 -> 아이디 사용 가능의 의미
					} else{
						$(".guide.id-ok").hide();
						$(".guide.id-error").show();
						$("#idDuplicateCheck").val(0);
					}
				}, error:function(){
					 console.log('ajax 통신 실패');
				}
			});
		});
	});
	
	$(function() {
		$("#pwd-ok").hide();
		$("#pwd-fail").hide();
		$("#mngPwdconf").keyup(function() {
			var password = $("#mPwd").val();
			var passwordconf = $("#mngPwdconf").val();
			if (password != "" || passwordconf != "") {
				if(password == passwordconf) {
					$("#pwd-input").hide();
					$("#pwd-ok").show();
					$("#pwd-fail").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#pwd-input").hide();
					$("#pwd-ok").hide();
					$("#pwd-fail").show();
					$("#submit").attr("disabled", "disabled");
				}
			} else{
				$("#pwd-input").show();
				$("#pwd-ok").hide();
				$("#pwd-fail").hide();
			}			
		});
	});
	
	/* function save(){
		$("#mngInsert").submit();
	} */
</script>
</html>