<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<%@ include file="../../common/menubar2.jsp" %>
	<div class="container mt-3">
		<div class="container-second mt-10 col-2 ml-4 mr-4 float-left">
			<%@ include file="../common/sideMenu.jsp" %>
		</div>
	
		<div class="container-second mt-10 col-9 float-left" style="border: 0px">
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-3 pl-3 pt-3  overflow-auto">	
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
					<form action="updateMng.do" method="post" id="updateMng">
						<input type="hidden" name="mNo" value="${ loginUser.mNo }">
						<input type="hidden" name="mngPosition" id="mngPosition" value="">
						<table width="600" class="table col-8 table-center">
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">ID</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text pasic-font-txt" id="mngId" name="mngId" value="${ loginUser.mId }" readonly>
								</td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="password" class="signup-input-text" name="mPwd" id="password" placeholder="변경할 비밀번호를 입력하세요." required></td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">PASSWORD CONF</td>
								<td scope="col" class="signup-td">
								<input type="password" class="signup-input-text pasic-font-txt" name="passwordconf"  id="passwordconf" placeholder="비밀번호를 한번 더 입력하세요." required>
								<span class="pasic-font-txt" id="pwd-input">　비밀번호 입력</span>
								<span class="pasic-font-txt ok" id="pwd-ok">　비밀번호 일치</span>
								<span class="pasic-font-txt error" id="pwd-fail">　비밀번호 불일치</span>
								</td>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">NAME</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<input type="text" class="signup-input-text" name="mName" id="mName" value="${ loginUser.mName }"></td>
							</tr>							
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top: 33px !important">AUTHORITY</td>
								<td scope="col" class="signup-td">								
									<%-- <c:set var="mngP" value="${ mngPosition }"/> --%>
									<c:choose>
										<c:when test="${ fn:contains(mngPosition2, '관리자') }">									
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '회원') }">									
													<label for="member" class="basic-font"><input type="checkbox" class="mPosition" id="member" value="회원관리"  checked>　회원 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="member" class="basic-font"><input type="checkbox" class="mPosition" id="member" value="회원관리" >　회원 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '맛집') }">
													<label for="rstrnt" class="basic-font"><input type="checkbox" class="mPosition" id="rstrnt" value="맛집관리"  checked>　맛집 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="rstrnt" class="basic-font"><input type="checkbox" class="mPosition" id="rstrnt" value="맛집관리" >　맛집 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '신고') }">
													<label for="report" class="basic-font"><input type="checkbox" class="mPosition" id="report" value="신고관리"  checked>　신고 관리　</label><br>
												</c:when>
												<c:otherwise>
													<label for="report" class="basic-font"><input type="checkbox" class="mPosition" id="report" value="신고관리" >　신고 관리　</label><br>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '문의') }">
													<label for="inqury" class="basic-font"><input type="checkbox" class="mPosition" id="inqury" value="문의관리"  checked>　문의 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="inqury" class="basic-font"><input type="checkbox" class="mPosition" id="inqury" value="문의관리" >　문의 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '광고') }">
													<label for="advrts" class="basic-font"><input type="checkbox" class="mPosition" id="advrts" value="광고관리"  checked>　광고 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="advrts" class="basic-font"><input type="checkbox" class="mPosition" id="advrts" value="광고관리" >　광고 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '관리자') }">
													<label for="manager" class="basic-font"><input type="checkbox" class="mPosition" id="manager" value="관리자설정"  checked>　관리자 설정　</label>									 
												</c:when>
												<c:otherwise>
													<label for="manager" class="basic-font"><input type="checkbox" class="mPosition" id="manager" value="관리자설정" >　관리자 설정　</label>
												</c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '회원') }">									
													<label for="member" class="basic-font"><input type="checkbox" class="mPosition" id="member" value="회원관리" disabled checked>　회원 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="member" class="basic-font"><input type="checkbox" class="mPosition" id="member" value="회원관리" disabled>　회원 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '맛집') }">
													<label for="rstrnt" class="basic-font"><input type="checkbox" class="mPosition" id="rstrnt" value="맛집관리" disabled checked>　맛집 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="rstrnt" class="basic-font"><input type="checkbox" class="mPosition" id="rstrnt" value="맛집관리" disabled>　맛집 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '신고') }">
													<label for="report" class="basic-font"><input type="checkbox" class="mPosition" id="report" value="신고관리" disabled checked>　신고 관리　</label><br>
												</c:when>
												<c:otherwise>
													<label for="report" class="basic-font"><input type="checkbox" class="mPosition" id="report" value="신고관리" disabled>　신고 관리　</label><br>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '문의') }">
													<label for="inqury" class="basic-font"><input type="checkbox" class="mPosition" id="inqury" value="문의관리" disabled checked>　문의 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="inqury" class="basic-font"><input type="checkbox" class="mPosition" id="inqury" value="문의관리" disabled>　문의 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '광고') }">
													<label for="advrts" class="basic-font"><input type="checkbox" class="mPosition" id="advrts" value="광고관리" disabled checked>　광고 관리　</label>
												</c:when>
												<c:otherwise>
													<label for="advrts" class="basic-font"><input type="checkbox" class="mPosition" id="advrts" value="광고관리" disabled>　광고 관리　</label>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${ fn:contains(mngPosition, '관리자') }">
													<label for="manager" class="basic-font"><input type="checkbox" class="mPosition" id="manager" value="관리자설정" disabled checked>　관리자 설정　</label>									 
												</c:when>
												<c:otherwise>
													<label for="manager" class="basic-font"><input type="checkbox" class="mPosition" id="manager" value="관리자설정" disabled>　관리자 설정　</label>
												</c:otherwise>
											</c:choose>
										</c:otherwise>
									</c:choose>
									
								</td>
							</tr>							
						</table>
						<div class="pt-5" style="margin:auto; width:50%; text-align:center">
							<input type="button" class="btn btn-warning select-btn dohyeon-font" id="saveBtn" value="MODIFY">
							<button class="btn btn-default select-btn dohyeon-font" onclick="location.href='managerList.do'">CANCEL</button>
						</div>
					</form>
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
		
		$("#saveBtn").on("click", function(){
			$("#mngPosition").val("");
			$(".mPosition").each(function(index){
				console.log("checked : " + $(this).attr("checked") + index);
				if($(this).attr("checked") == "checked"){
					var temp = $("#mngPosition").val();
					$("#mngPosition").val(temp + $(this).val() + ",");
				}
			});
			var t =  $("#mngPosition").val();
			$("#mngPosition").val(t.substr(0,t.length - 1));	// "," 삭제용
			console.log($("#mngPosition").val());
			$("#updateMng").submit();
		});
		
		$(".mPosition").on("click", function(){
			if($(this).attr("checked")){
				$(this).removeAttr("checked");
			} else {
				$(this).attr("checked", "checked");
			}
		});
	});
	
</script>
</html>