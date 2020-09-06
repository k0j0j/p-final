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
			<div class="w-100 h-25 mt-5 pl-3 pt-3 overflow-auto">	
			<h3>MANAGER MANAGEMENT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2">관리자 설정 ▶ 관리자 조회</p>
				</div>
			</div>

			<!-- Select-Menu -->
			<div>
				<div class="float-left ml-2">
					<select class="signup-input-text basic-font" style="margin:0px 5px 0px 0px; width:120px; height:28px">
						<option selected>관리자 권한별 조회</option>
						<option value="member">회원 관리</option>
						<option value="rstrnt">맛집 관리</option>
						<option value="report">신고 관리</option>
						<option value="inqury">문의 관리</option>
						<option value="advrts">광고 관리</option>
						<option value="manager">관리자 설정</option>
					</select>
				</div>		
				<!-- 검색 -->
				<div class="float-right mb-2" id="search-area">
					<div class="float-right">
						<input type="text" class="search-input-txt" placeholder="관리자 검색">
						<input type="button" class="search-button">
					</div>
					<div class="float-right">			
						<select class="signup-input-text basic-font" style="margin:0px 5px 0px 0px; width:80px; height:28px">
									<option selected>검색 필터</option>
									<option value="search_Mid">아이디</option>
									<option value="search_Mname">이름</option>
						</select>
					</div>
				</div>
			</div>
			
			<!-- Board Area -->
			<div class="tab-content">
	 			<div class="tab-pane fade show active pl-2" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<div class="taplist"></div>
					<table class="table table-hover mb-0">
						<colgroup>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
							<col width="20%"/>
						</colgroup>
						<thead class="btn-secondary">
							<tr>
								<th scope="col" class="th-center-title th-menu">NO</th>
								<th scope="col" class="th-center-title th-menu">관리자ID</th>
								<th scope="col" class="th-center-title th-menu">이름</th>
								<th scope="col" class="th-center-title th-menu">관리 권한</th>
								<th scope="col" class="th-center-title th-menu">사용 여부</th>
							</tr>
						</thead>
						<tbody>	
							<c:forEach var="list" items="${list}">
								<tr>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.mngNo }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.mngId }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.mngName }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.mngPosition }"/></td>
									<td scope="col" class="th-center-txt td-txt"><button class="btn btn-outline-warning btn-delete" onclick="managerDel(${ list.mngNo })">권한 회수</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- PAGING -->
					<table class="table">
						<tr align="center" height="20">
							<td colspan="6" class="pt-5 pagin-txt">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage eq 1 }">
									<font color="lightgray">[이전] &nbsp;</font>
								</c:if>
								<c:if test="${ pi.currentPage ne 1 }">
									<c:url var="before" value="managerList.do">
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
										<c:url var="pagination" value="managerList.do">
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
									<c:url var="after" value="managerList.do">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<a href="${ after }" style="color:black">&nbsp;[다음]</a>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function managerDel(mngNo){
		if(confirm("관리자 계정을 삭제 처리하시겠습니까?")) {
			location.href="${ contextPath }/managerList.do?targetNo=" + targetNo;
			alert("삭제되었습니다.")
		} else{
			return false;
		}
	}

</script>
</html>