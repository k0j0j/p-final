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
		<div class="container-second pb-2" style="border: 0px">
			
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-5 pl-3 pt-3 overflow-auto">	
			<h3>MANAGER MANAGEMENT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2">관리자 설정 ▶ 관리자 조회</p>${ sp }
				</div>
			</div>

			<!-- Select-Menu -->
			<div>
				<div class="float-left ml-2">
				<form action="selectLevel.do" id="selectLevel" method="get">
					<select class="signup-input-text basic-font" id="selectBtn" name="selectBtn" style="margin:0px 5px 0px 0px; width:120px; height:28px" onchange="selectLevel(this.valuse)">					
						<option value="all">관리자 권한별 조회</option>
						<option value="회원">회원 관리<c:if test="${search.searchValue == '회원'}">selected</c:if></option>
						<option value="맛집">맛집 관리<c:if test="${search.searchValue == '맛집'}">selected</c:if></option>
						<option value="신고">신고 관리<c:if test="${search.searchValue == '신고'}">selected</c:if></option>
						<option value="문의">문의 관리<c:if test="${search.searchValue == '문의'}">selected</c:if></option>
						<option value="광고">광고 관리<c:if test="${search.searchValue == '광고'}">selected</c:if></option>
						<option value="관리자">관리자 설정<c:if test="${search.searchValue == '관리자'}">selected</c:if></option>
					</select>
				</form>
				</div>		
				<!-- 검색 -->
				<div class="float-right mb-2" id="search-area">
					<form action="mngKeySearch.do" name="mngKeySearch" method="get">
						<div class="float-right" style="margin-left: -15px">
							<input type="text" class="search-input-txt" name="searchValue" value="${ sp.searchValue }" placeholder="관리자 ID 검색" required>
							<!-- <input type="button" class="search-button"> -->
							<i class="fa fa-search mr-2 ml-1" aria-hidden="true"></i>

							<fieldset class="enter float-left" style="visibility: hidden; display:inline-block">
								<button></button>
							</fieldset>
						</div>
						<div class="float-right">			
							<select class="signup-input-text basic-font" name="searchCondition" id="searchCondition" style="margin:0px 5px 0px 0px; width:80px; height:28px">
										<option value="none" selected>검색 필터</option>
										<option value="search_Mid" <c:if test="${sp.searchCondition == 'search_Mid'}">selected</c:if>>아이디</option>
										<option value="search_Mname" <c:if test="${sp.searchCondition == 'search_Mname'}">selected</c:if>>이름</option>
										<%-- 
										<option value="search_Mid" <c:if test="${sp.searchCondition == 'search_Mid'}">selected</c:if>>아이디</option>
										<option value="search_Mname" <c:if test="${sp.searchCondition == 'search_Mname'}">selected</c:if>>이름</option>
										 --%>
							</select>
						</div>
					</form>
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
						<thead class="btn-secondary non-hover">
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
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MId }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MName }"/></td>
									
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.mngPosition }"/>
										<c:forEach var="admLevel" items="${admLevel}"><c:out value="${ admLevel.mngPosition }"/></c:forEach>
									</td>
									<td scope="col" class="th-center-txt td-txt"><button class="btn btn-outline-warning btn-delete" onclick="deleteMgt(${ list.mngNo })">권한 회수</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- PAGING -->
					<table class="table">
						<tr align="center" height="20">
							<td colspan="6" class="pt-5 pagin-txt">
							
								<!-- [이전] -->
								<c:if test="${ sp.currentPage eq 1 }">
									<font color="lightgray">[이전] &nbsp;</font>
								</c:if>
								<c:if test="${ sp.currentPage ne 1 }">
									<c:url var="before" value="mngKeySearch.do?searchValue=${ sp.searchValue }">
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
										<c:url var="pagination" value="mngKeySearch.do?searchValue=${ sp.searchValue }">
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
									<c:url var="after" value="mngKeySearch.do?searchValue=${ sp.searchValue }">
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
	</div>
</body>
<script>
	function deleteMgt(mngNo){
		if(confirm("관리자 계정을 삭제 처리하시겠습니까?")) {
			location.href="${ contextPath }/deleteMgt.do?mngNo=" + mngNo;
			alert("삭제되었습니다.")
		} else{
			return false;
		}
	}

	function selectLevel(selectBtn){
		alert($("#selectBtn").val());
		location.href="${ contextPath }/selectLevel.do?selectBtn=" + $("#selectBtn").val();
	}
 </script>
</html>