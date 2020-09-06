<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

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
					<form action="mngInsert.do" method="post" id="mngInsert">
						<table width="600" class="table col-8 table-center">
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px;">ID</td>
								<td width="400" scope="col" class="signup-td"><input type="text" class="signup-input-text pasic-font-txt" id="mngId" name="mngId" placeholder="사용할 아이디를 입력하세요." required>
								
								<!-- AJAX -->
								<span class="guide ok pasic-font-txt">　사용 가능한 아이디</span>
								<span class="guide error pasic-font-txt">　사용 불가능한 아이디</span>
								<input type="hidden" class="signup-input-text" name="idDuplicateCheck" id="idDuplicateCheck" value="0"></td>

							</tr>			
											
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="password" class="signup-input-text" name="password" placeholder="비밀번호를 입력하세요."></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD CONF</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="password" class="signup-input-text" name="passwordconf" placeholder="비밀번호를 한번 더 입력하세요."></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">NAME</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="text" class="signup-input-text" name="name" placeholder="관리자 이름을 입력하세요."></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">AUTHORITY</td>
								<td scope="col" class="signup-td">
									<select class="signup-input-text basic-font" name="adminlevel" style="margin:0px 0px">
										<option selected>관리자 권한 선택</option>
										<option value="member">회원 관리</option>
										<option value="rstrnt">맛집 관리</option>
										<option value="report">신고 관리</option>
										<option value="inqury">문의 관리</option>
										<option value="advrts">광고 관리</option>
										<option value="manager">관리자 설정</option>
									</select>
								</td>
							</tr>							
						</table>	
					</form>				
					<div class="pt-5" style="margin:auto; width:50%; text-align:center">
						<button class="btn btn-warning select-btn dohyeon-font">REGISTRATION</button>
						<button class="btn btn-default select-btn dohyeon-font">CANCEL</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

	function validate(){
		// 아이디 중복 체크 여부
		if($("#idDuplicateCheck").val() == 0){
			alert("사용 가능한 아이디를 입력해주세요.");
			$("#mngId").focus();
			return false;
		}else {
			return true;
		}
	}

	 $(function(){
			$("#mngId").on("keyup", function(){
				var mngId = $(this).val();
			  
				if(mngId.length < 5){
					$(".guide").hide();
					$("#idDuplicateCheck").val(0);
				  	
					return;
				}		  
			
			$.ajax({
				url:"idCheck.do",
				data:{id:mngId},
				type:"post",
				success: function(data){
					console.log(data);
					
					if(data == "ok"){	// boolean 타입 자체로 리턴되므로 따옴표 없이 비교한다.
						$(".error").hide();
					 	$(".ok").show();
					 	$("#idDuplicateCheck").val(1);	// value 1 -> 아이디 사용 가능의 의미
					} else{
						$(".ok").hide();
						$(".error").show();
						$("#idDuplicateCheck").val(0);
					}
				}, error:function(){
					 console.log('ajax 통신 실패');
				}
			});
		});
	});

</script>
</html>