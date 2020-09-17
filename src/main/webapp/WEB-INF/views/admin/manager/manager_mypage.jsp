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
<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"> -->
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
					<p class="rstrnt-menu-list pl-2">관리자 설정 ▶ 관리자 수정</p>
				</div>
			</div>
			
			<!-- SIGN UP-->
			<div class="tab-content ">
	 			<div class="tab-pane fade show active pl-2 pb-5" id="home" role="tabpanel" aria-labelledby="home-tab">
					<!-- TITLE -->
					<div class="pt-4" style="text-align:center">
						<h3 style="color:#006a7d">MNG MYPAGE</h3>
					</div>
					<form action="mngInsert.do" method="post" id="mngInsert">
						<table width="600" class="table col-8 table-center">
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">ID</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text pasic-font-txt" id="mngId" name="mngId" value="${ manager.mngId }" disabled>
								</td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="password" class="signup-input-text" name="password" id="password" placeholder="변경할 비밀번호를 입력하세요."></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD CONF</td>
								<td scope="col" class="signup-td">
								<input type="password" class="signup-input-text pasic-font-txt" name="passwordconf"  id="passwordconf" placeholder="비밀번호를 한번 더 입력하세요.">
								<span class="pasic-font-txt" id="pwd-input">　비밀번호 입력</span>
								<span class="pasic-font-txt ok" id="pwd-ok">　비밀번호 일치</span>
								<span class="pasic-font-txt error" id="pwd-fail">　비밀번호 불일치</span>
								</td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">NAME</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="text" class="signup-input-text" name="name" value="${ manager.mngName }"></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top: 33px !important">AUTHORITY</td>
								<td scope="col" class="signup-td">
									<label for="member" class="basic-font"><input type="checkbox" name="adminLevel" id="member">　회원 관리　</label>
									<label for="rstrnt" class="basic-font"><input type="checkbox" name="adminLevel" id="rstrnt">　맛집 관리　</label>
									<label for="report" class="basic-font"><input type="checkbox" name="adminLevel" id="report">　신고 관리　</label><br>
									<label for="inqury" class="basic-font"><input type="checkbox" name="adminLevel" id="inqury">　문의 관리　</label>
									<label for="advrts" class="basic-font"><input type="checkbox" name="adminLevel" id="advrts">　광고 관리　</label>
									<label for="manager" class="basic-font"><input type="checkbox" name="adminLevel" id="manager">　관리자 설정　</label>									 
								</td>
							</tr>							
						</table>	
					</form>				
					<div class="pt-5" style="margin:auto; width:50%; text-align:center">
						<button class="btn btn-warning select-btn dohyeon-font">MODIFY</button>
						<button class="btn btn-default select-btn dohyeon-font" onclick="location.href='managerList.do'">CANCEL</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(function() {
		$("#pwd-ok").hide();
		$("#pwd-fail").hide();
		$("#passwordconf").keyup(function() {
			var password = $("#password").val();
			var passwordconf = $("#passwordconf").val();
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