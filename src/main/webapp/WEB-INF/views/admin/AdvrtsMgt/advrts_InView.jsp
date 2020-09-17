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
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
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
					<p class="rstrnt-menu-list pl-2">시스템 관리 ▶ 광고 등록 페이지</p>
				</div>
			</div>
			
			<!-- SIGN UP-->
			<div class="tab-content ">
	 			<div class="tab-pane fade show active pl-2 pb-5" id="home" role="tabpanel" aria-labelledby="home-tab">
					<!-- TITLE -->
					<div class="pt-4" style="text-align:center">
						<h3 style="color:#006a7d">REGISTER ADVRTS</h3>
					</div>
					<form action="adInsert.do" method="post" enctype="multipart/form-data" id="mngInsert" onsubmit="return validate()">
						<table width="600" class="table col-8 table-center">
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">NAME</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text2 pasic-font-txt" id="bnrNm" name="bnrNm" style="width:400px; height:30px" placeholder="광고 업체 이름을 입력하세요." required>
							</tr>			
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">CATEGORY</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text2 pasic-font-txt" id="bnrCategory" name="bnrCategory" style="width:400px; height:30px" placeholder="광고 종류를 입력해주세요." required>
							</tr>
									
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top: 100px !important">DETAIL NOTE</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<textarea name="bnrNote" id="bnrNote" style="resize: none; width:400px; height:200px" placeholder="광고에 대한 구체적인 설명을 작성해주세요." required></textarea>
							</tr>
							<tr>
								<td width="200" scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">URL</td>
								<td width="400" scope="col" class="signup-td">
								<input type="text" class="signup-input-text2 pasic-font-txt" id="bnrUrl" name="bnrUrl" style="width:400px; height:30px" placeholder="광고를 클릭했을 때 이동할 URL을 입력해주세요." required>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">BANNER FILE</td>
								<td scope="col" class="signup-td pasic-font-txt">
									<input type="file" class="signup-input-text2" name="bnrFile" id="bnrFile" style="padding-top:5px" placeholder="게시할 광고 이미지를 첨부해주세요. (650*100)" required>
								</td>
							</tr>
						</table>
						<div class="pt-5" style="margin:auto; width:50%; text-align:center">
							<input type="submit" class="btn btn-warning select-btn dohyeon-font" value="REGISTRATION">
							<button class="btn btn-default select-btn dohyeon-font" onclick="location.href='advrtsList.do'">CANCEL</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#bnrFile").change(function(){
			
			var regex = new RegExp("(.*?)\.(bmp|jpeg|jpg|gif|png)$");
			var agent = navigator.userAgent.toLowerCase();
			/* var fileSize = $("#bnrFile").files[0].size; */
			var fileSize = bnrFile.files[0].size;
						
			var maxSize = 5242880; //5MB
			if( fileSize >= maxSize){
				alert("첨부할 수 있는 파일의 사이즈를 초과했습니다.");				
				if ($.browser.msie) {	// IE input[type=file] init.
					$("#bnrFile").replaceWith( $("#bnrFile").clone(true)); 
				} else {	// 나머지 input[type=file] init.
					$("#bnrFile").val(""); 
				}
			}
			
			var ext = $(this).val().split(".").pop().toLowerCase();
			if($.inArray(ext, ["gif", "jpg", "jpeg", "png", "pdf"]) == -1){
				alert("첨부할 수 없는 파일 형식입니다.");				
				if ((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {	// IE
					console.log("익스")
					$("#bnrFile").replaceWith( $("#bnrFile").clone(true)); 
				}else{
					console.log("크롬")
					$("#bnrFile").val(""); 
				}
			}
		});		
	});
</script>
</html>