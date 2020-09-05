<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">   
</head>

<body>
	<%@ include file="../common/aNav.jsp" %>

	<div class="container">
		<div class="container-second pb-2" style="border: 0px">
			
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-5 pl-3 pt-3 pb-1 overflow-auto">
				<h3>REPORT RSTRNT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2">맛집 관리 ▶ 신고 내역</p>
				</div>
			</div>
			<div>			
				<div class="btn-group btn-group-toggle pl-2 pb-1" data-toggle="buttons">
					<label class="btn btn-light radio-button radio-button-height" onclick="Mgt_Report()">전체 신고 내역</label>
					<label class="btn btn-light radio-button radio-button-height" onclick="membMgt_Report()">회원 신고 내역</label>
					<label class="btn btn-light radio-button radio-button-height active" onclick="rntMgt_Report">맛집 신고 내역</label>					
				</div>
			</div>

			<!-- Board Area -->
			<div class="tab-content">
				<div class="tab-pane fade show active pl-2" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<div class="taplist"></div>
					<table class="table table-hover">
						<colgroup>
							<col width="10%"/>
							<col width="15%"/>
							<col width="40%"/>
							<col width="20%"/>
							<col width="15%"/>
						</colgroup>
						<thead class="btn-secondary">
							<tr>
								<th scope="col" class="th-center-title th-menu">NO</th>
								<th scope="col" class="th-center-title th-menu">신고 회원 ID</th>
								<th scope="col" class="th-center-title th-menu">맛집 이름 (신고 사유)</th>
								<th scope="col" class="th-center-title th-menu">신고 일자</th>
								<th scope="col" class="th-center-title th-menu">신고 처리</th>
							</tr>
						</thead>
						<tbody>							
							<c:forEach var="list" items="${list}">
								<tr>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.prtNo }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MId }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.targetId } ( ${ list.rptResn } )"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.rptDate }"/></td>
									<td scope="col" class="th-center-txt td-txt"><button class="btn btn-outline-warning btn-delete" onclick="mgtReportDel(${ list.targetNo })">이용 정지</button></td>
								</tr>
							</c:forEach>
							
							<!-- PAGING -->
							<tr align="center" height="20">
								<td colspan="6" class="pt-5 pagin-txt">
								
									<!-- [이전] -->
									<c:if test="${ pi.currentPage eq 1 }">
										<font color="lightgray">[이전] &nbsp;</font>
									</c:if>
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="rntReport.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
										</c:url>
										<a href="${ before }" style="color:black">[이전]</a> &nbsp;
									</c:if>
									
									<!-- PAGE NUMBER -->
									<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="orange" size="2"><b>[${ p }]</b></font>
										</c:if>
										
										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="rntReport.do">
												<c:param name="currentPage" value="${ p }"/>
											</c:url>
											<a href="${ pagination }" style="color:black">${ p }</a>
										</c:if>
									</c:forEach>
									
									<!-- [다음] -->
									<c:if test="${ pi.currentPage eq pi.maxPage }">
										<font color="lightgray">&nbsp;[다음]</font>
									</c:if>
									<c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="rntReport.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
										</c:url>
										<a href="${ after }" style="color:black">&nbsp;[다음]</a>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>	
<script>
	function Mgt_Report(){
		location.href="reportList.do";
	}	
	function membMgt_Report(){
		location.href="memReport.do";
	}	
	function rntMgt_Report(){
		location.href="rntReport.do";
	}
	
	function mgtReportDel(mNo){
		if(confirm("맛집 업체를 이용 정지 처리하시겠습니까?")) {
			location.href="${ contextPath }/mgtRstReportDel.do?targetNo=" + targetNo;
			alert("이용 정지 처리되었습니다.")
		} else{
			return false;
		}
	}
</script>
</html>