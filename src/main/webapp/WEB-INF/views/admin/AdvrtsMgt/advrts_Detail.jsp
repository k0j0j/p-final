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
					<p class="rstrnt-menu-list pl-2">시스템 관리 ▶ 광고 상세 페이지</p>
				</div>
			</div>
			
			<!-- SIGN UP-->
			<div class="tab-content ">
	 			<div class="tab-pane fade show active pl-2 pb-5" id="home" role="tabpanel" aria-labelledby="home-tab">
					<!-- TITLE -->
					<div class="pt-4" style="text-align:center">
						<h3 style="color:#006a7d">VIEW AD DETAILS</h3>
					</div>
					<!-- <form action="adInsert.do" method="post" enctype="multipart/form-data" id="mngInsert" onsubmit="return validate()"> -->
						<table width="600" class="table col-8 table-center">
							<colgroup>
								 <col width="30%"/>
								 <col width="70%"/>
							</colgroup>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding: 5px 20px!important">NAME</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<%-- <input type="text" class="signup-input-text2 pasic-font-txt" id="bnrNm" name="bnrNm" style="width:400px; height:30px" value='<c:out value="${ detail.bnrNm }"/>' readonly> --%>
								<c:out value="${ ad.bnrNm }"/>
							</tr>			
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">CATEGORY</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<!-- <input type="text" class="signup-input-text2 pasic-font-txt" id="bnrCategory" name="bnrCategory" style="width:400px; height:30px" readonly> -->
								<c:out value="${ ad.bnrCategory }"/>
							</tr>
									
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top: 100px !important">DETAIL NOTE</td>
								<td scope="col" class="signup-td pasic-font-txt" style="width:400px; height:200px">
								<pre name="bnrNote" class="pasic-font-txt" id="bnrNote" style="resize: none; width:400px; height:200px"><c:out value="${ ad.bnrNote }"/></pre>
								
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px">URL</td>
								<td scope="col" class="signup-td pasic-font-txt">
								<!-- <input type="text" class="signup-input-text2 pasic-font-txt" id="bnrUrl" name="bnrUrl" style="width:400px; height:30px" readonly> -->
								<c:out value="${ ad.bnrUrl }"/>
							</tr>
							<tr>
								<td scope="col" class="th-center-title bg-secondary text-center" style="font-size:18px; padding-top:35px!important">BANNER FILE</td>
								<td scope="col" class="signup-td pasic-font-txt">
									<!-- <input type="file" class="signup-input-text2" name="bnrFile" id="bnrFile" style="padding-top:5px" placeholder="게시할 광고 이미지를 첨부해주세요. (650*100)" readonly> -->
									<a><img src="${contextPath}/resources/img/admin/banner/${ ad.bnrRFile }" style="max-width:500px"></a>
								</td>
							</tr>
						</table>
						<div class="pt-5" style="margin:auto; width:50%; text-align:center">
							<!-- <input type="submit" class="btn btn-warning select-btn dohyeon-font" value="REGISTRATION"> -->
							<button class="btn btn-light select-btn dohyeon-font" style="width:300px"onclick="advrtsList()">목록으로 이동</button>
						</div>
					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function advrtsList(){
		location.href="advrtsList.do";
	}
</script>
</html>