<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/main/favicon.png" />
<title>HONEYPOINT, 나의 맛집 로드</title>  

</head>

<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="container mt-3">
		<div class="container-second mt-10 col-2 ml-4 mr-4 float-left">
			<%@ include file="../common/sideMenu.jsp" %>
		</div>
	
		<div class="container-second mt-10 col-9 float-left" style="border: 0px">
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-3 pl-3 pt-3 pb-1 overflow-auto">
			<h3>ADVERTISEMENT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2" id="myTabContentTitle1">시스템 관리 ▶ 전체 광고 목록</p>
				</div>
			</div>
					
			<!-- 검색 -->
			<%-- 
			<div class="float-right" id="search-area">
				<div>
					<form action="SearchReportMgt.do" id="searchReportMgtForm" method="get">
						<input id="url" class="search-input-txt" type="text" name="searchValue" placeholder=" 신고 회원 검색" value="${ search.searchValue }" required>
						<i class="fa fa-search mr-2 ml-1" aria-hidden="true"></i>

						<fieldset class="enter float-left" style="visibility: hidden; display:inline-block">
							<button></button>
						</fieldset>
					</form>
				</div>
			</div>
			 --%>
			<!-- ADVRTS INSERT -->
			<div class="float-right" id="search-area">
				<div>
					<button class="btn btn-outline-secondary btn-delete" style="padding:4px 15px; font-size: 15px; width:100px; height:25px" onclick="location.href='advrtsInView.do'">광고 등록하기</button>
				</div>
			</div>
			<div>
				<div class="btn-group btn-group-toggle pl-2 pb-1" data-toggle="buttons">
					<label class="btn btn-light radio-button radio-button-height active" onclick="advrtsMgt()">전체 광고 목록</label>
					<label class="btn btn-light radio-button radio-button-height" onclick="advrtsIList()">등록 광고 목록</label>
					<label class="btn btn-light radio-button radio-button-height" onclick="advrtsDList()">삭제 광고 목록</label>					
				</div>
			</div>
			
			<!-- Board Area -->
			<div class="tab-content" id="myTabContent1">
	 			<div class="tab-pane fade show active pl-2" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<div class="taplist"></div>
					<table class="table table-hover mb-0">
						<colgroup>
							<col width="10%"/>
							<col width="40%"/>
							<col width="20%"/>
							<col width="30%"/>
						</colgroup>
						<thead class="btn-secondary">
							<tr>
								<th scope="col" class="th-center-title th-menu">NO</th>
								<th scope="col" class="th-center-title th-menu">광고 업체명</th>
								<th scope="col" class="th-center-title th-menu">등록 일자</th>
								<th scope="col" class="th-center-title th-menu">광고 설정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>						
									<td scope="col" class="th-center-txt td-txt" onclick="adDetail(${ list.bnrNo })"><c:out value="${ list.bnrNo }"/></td>												
									<td scope="col" class="th-center-txt td-txt" onclick="adDetail(${ list.bnrNo })"><c:out value="${ list.bnrNm }"/></td>
									<td scope="col" class="th-center-txt td-txt" onclick="adDetail(${ list.bnrNo })"><c:out value="${ list.bnrDate }"/></td>															
									<td scope="col" class="th-center-txt td-txt">
										<button class="btn btn-outline-warning btn-delete" onclick="advrtsIn(${ list.bnrNo })">광고 출력</button>
										<button class="btn btn-outline-danger btn-delete" onclick="advrtsDel(${ list.bnrNo })">광고 삭제</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<table class="table">
					<!-- PAGING -->
					<tr align="center" height="20">
						<td colspan="6" class="pt-5 pagin-txt">
						
							<!-- [이전] -->
							<c:if test="${ sp.currentPage eq 1 }">
								<font color="lightgray">[이전] &nbsp;</font>
							</c:if>
							<c:if test="${ sp.currentPage ne 1 }">
								<c:url var="before" value="advrtsList.do">
									<c:param name="currentPage" value="${ sp.currentPage - 1 }"/>
								</c:url>
								<a href="${ before }" style="color:black">[이전]</a> &nbsp;
							</c:if>
							
							<!-- PAGE NUMBER -->
							<c:forEach var="p" begin="${ sp.startPage }" end="${ sp.endPage }">
								<c:if test="${ p eq sp.currentPage }">
									<font color="orange" size="2"><b>[${ p }]</b></font>
								</c:if>
								
								<c:if test="${ p ne sp.currentPage }">
									<c:url var="pagination" value="advrtsList.do">
										<c:param name="currentPage" value="${ p }"/>
									</c:url>
									<a href="${ pagination }" style="color:black">${ p }</a>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ sp.currentPage eq sp.maxPage }">
								<font color="lightgray">&nbsp;[다음]</font>
							</c:if>
							<c:if test="${ sp.currentPage ne sp.maxPage }">
								<c:url var="after" value="advrtsList.do">
									<c:param name="currentPage" value="${ sp.currentPage + 1 }"/>
								</c:url>
								<a href="${ after }" style="color:black">&nbsp;[다음]</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	function advrtsMgt(){
		location.href="advrtsList.do";
	}
	
	function advrtsIList(){
		location.href="advrtsIList.do";
	}
	
	function advrtsDList(){
		location.href="advrtsDList.do";
	}
	
	
	function adDetail(bNo){
		location.href="${ contextPath }/adDetail.do?bNo=" + bNo;
	} 
	
	
	function advrtsIn(bNo){
		if(confirm("광고를 등록하시겠습니까?")) {
			location.href="${ contextPath }/advrtsIn.do?bNo=" + bNo;
			alert("등록되었습니다.");
		} 
	}
	
	function advrtsDel(bNo){
		if(confirm("광고를 삭제하시겠습니까?")) {
			location.href="${ contextPath }/advrtsDel.do?bNo=" + bNo;
			alert("삭제되었습니다.");
		} 
	}
</script>
</html>