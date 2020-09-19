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
					<p class="rstrnt-menu-list pl-2">관리자 설정 ▶ 관리자 등록</p>
				</div>
			</div>
			
			<!-- SIGN UP-->
			<div class="tab-content ">
	 			<div class="tab-pane fade show active pl-2 pb-5" id="home" role="tabpanel" aria-labelledby="home-tab">
					<!-- TITLE -->
					<div class="pt-4" style="text-align:center">
						<h3 style="color:#006a7d">MNG REGISTRATION</h3>
					</div>
					<form action="mngInsert.do" method="post" id="mngInsert" onsubmit="return validate()">
						<table width="600" class="table col-8 table-center">
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">ID</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text pasic-font-txt" id="mId" name="mId" placeholder="사용할 아이디를 입력하세요." required>
								
								<!-- AJAX -->
								<span class="guide ok id-ok pasic-font-txt">　사용 가능한 아이디</span>
								<span class="guide error id-error pasic-font-txt">　사용 불가능한 아이디</span>
								<input type="hidden" class="signup-input-text" name="idDuplicateCheck" id="idDuplicateCheck" value="0"></td>

							</tr>			
											
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="password" class="signup-input-text" name="mPwd" id="mPwd" placeholder="비밀번호를 입력하세요." required></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD CONF</td>
								<td scope="col" class="signup-td">
								<input type="password" class="signup-input-text pasic-font-txt" name="mngPwdconf"  id="mngPwdconf" placeholder="비밀번호를 한번 더 입력하세요." required>
								<span class="pasic-font-txt" id="pwd-input" name="pwd">　비밀번호 입력</span>
								<span class="pasic-font-txt ok" id="pwd-ok">　비밀번호 일치</span>
								<span class="pasic-font-txt error" id="pwd-fail">　비밀번호 불일치</span>
								</td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">NAME</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="text" class="signup-input-text" name="mName" id="mName" placeholder="관리자 이름을 입력하세요." required></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PHONE</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="text" class="signup-input-text" name="mPhone" id="mPhone" placeholder="전화번호를 입력하세요." required></td>
							</tr>							
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top: 33px !important">AUTHORITY</td>
								<td scope="col" class="signup-td">				
								<%-- <c:forEach var="checkLevel" items="${ mngPosition }"> --%>			
									<label for="member" class="basic-font"><input type="checkbox" name="mngPosition" id="member" value=" 회원 관리">　회원 관리　</label>
									<label for="rstrnt" class="basic-font"><input type="checkbox" name="mngPosition" id="rstrnt" value=" 맛집 관리">　맛집 관리　</label>
									<label for="report" class="basic-font"><input type="checkbox" name="mngPosition" id="report" value=" 신고 관리">　신고 관리　</label><br>
									<label for="inqury" class="basic-font"><input type="checkbox" name="mngPosition" id="inqury" value=" 문의 관리">　문의 관리　</label>
									<label for="advrts" class="basic-font"><input type="checkbox" name="mngPosition" id="advrts" value=" 광고 관리">　광고 관리　</label>
									<label for="manager" class="basic-font"><input type="checkbox" name="mngPosition" id="manager" value=" 관리자 설정">　관리자 설정　</label>									 
								<%-- </c:forEach> --%>
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
	
	
</script>
</html>