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
</head>

<body>
	<%@ include file="../common/aNav.jsp" %>
	
	<!-- 배경 이미지 -->
	<div class="container">	
		<div class="container-second pb-2" style="border: 0px">
		
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-5 pl-3 pt-3 pb-1 overflow-auto">
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
			
			<div>
				<div class="btn-group btn-group-toggle pl-2 pb-1" data-toggle="buttons">
					<label class="btn btn-light radio-button radio-button-height" onclick="advrtsMgt()">전체 광고 목록</label>
					<label class="btn btn-light radio-button radio-button-height active" onclick="advrtsIList()">등록 광고 목록</label>
					<label class="btn btn-light radio-button radio-button-height" onclick="advrtsDList()">삭제 광고 목록</label>					
				</div>
			</div>
			
			<!-- Board Area -->
			<div class="tab-content" id="myTabContent1">
	 			<div class="tab-pane fade show active pl-2" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<div class="taplist"></div>
					<table class="table table-hover mb-0">
						<colgroup>
							<col width="20%"/>
							<col width="40%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<thead class="btn-secondary">
							<tr>
								<th scope="col" class="th-center-title th-menu">NO</th>
								<th scope="col" class="th-center-title th-menu">업체명 (상세 설명)</th>
								<th scope="col" class="th-center-title th-menu">광고 설정 일자</th>
								<th scope="col" class="th-center-title th-menu">광고 설정</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="list" items="${list}">
								<tr>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.bnrNo }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.bnrNm } ( ${ list.bnrNote })"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.bnrDate }"/></td>															
									<td scope="col" class="th-center-txt td-txt">
										<button class="btn btn-outline-danger btn-delete" onclick="advrtsOff(${ list.bnrNo })">광고 종료</button>										
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- PAGING -->
				<table class="table">
					<tr align="center" height="20">
						<td colspan="6" class="pt-5 pagin-txt">
						
							<!-- [이전] -->
							<c:if test="${ sp.currentPage eq 1 }">
								<font color="lightgray">[이전] &nbsp;</font>
							</c:if>
							<c:if test="${ sp.currentPage ne 1 }">
								<c:url var="before" value="advrtsIList.do">
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
									<c:url var="pagination" value="advrtsIList.do">
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
								<c:url var="after" value="advrtsIList.do">
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
	
	function advrtsOff(bNo){
		if(confirm("광고를 종료하시겠습니까?")) {
			location.href="${ contextPath }/advrtsOff.do?bNo=" + bNo;
			alert("종료되었습니다.")
		} else{
			return false;
		}
	}
</script>
</html>