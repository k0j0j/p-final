<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.side-padding{
	padding: 1px 25px !important;
	font-family: 'Nanum Gothic', sans-serif !important;
	font-size: 12px !important;
	border: 0px;
}

.side-title{
	padding: 2px 10px !important;
}

.basic-nanum{
	height: 100%; margin: 0;
	font-family: 'Nanum Gothic', sans-serif !important;
	font-size:15px;
}

</style>
</head>
<body>
	<!-- <h5 class="mt-3 basic-nanum" style="text-align:center; text-size: 20px"><a href="admin.do" class="">관리자 페이지</a></h5> -->
	<button class="btn btn-outline-dark mt-3 basic-nanum" style="padding:5px 15px;margin-left:5px" onclick="location.href='admin.do'">ADMIN MAIN</button>
	
	<div class="list-group mt-3">
		<a class="pasic-font-txt menu-txt side-title">회원 관리</a>
		<c:choose>
			<c:when test="${ fn:contains(sessionScope.mngPosition, '회원관리') }">
            	<a href="memMgt.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">등록 회원 목록</a>
				<a href="xMemMgt.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">탈퇴 회원 목록</a>
			</c:when>
			<c:otherwise>
				<a href="memMgt.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">등록 회원 목록</a>
				<a href="xMemMgt.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">탈퇴 회원 목록</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="list-group mt-3">
		<a class="pasic-font-txt menu-txt side-title">맛집 관리</a>
		<c:choose>
			<c:when test="${ fn:contains(sessionScope.mngPosition, '맛집관리') }">
            	<a href="rSearch.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">등록된 맛집 목록</a>
				<a href="rstRegist.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">신청 대기 맛집</a>
				<a href="rntReject.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">등록 불가 맛집</a>
			</c:when>
			<c:otherwise>
				<a href="rSearch.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">등록된 맛집 목록</a>
				<a href="rstRegist.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">신청 대기 맛집</a>
				<a href="rntReject.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">등록 불가 맛집</a>
			</c:otherwise>
		</c:choose>
	</div><hr>
	<div class="list-group mt-3">
		<a class="pasic-font-txt menu-txt side-title">신고 관리</a>
		<c:choose>
			<c:when test="${ fn:contains(sessionScope.mngPosition, '신고관리') }">
            	<a href="reportList.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">전체 신고 내역</a>
				<a href="memReport.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">회원 신고 내역</a>
				<a href="rntReport.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">맛집 신고 내역</a>
			</c:when>
			<c:otherwise>
				<a href="reportList.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">전체 신고 내역</a>
				<a href="memReport.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">회원 신고 내역</a>
				<a href="rntReport.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">맛집 신고 내역</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="list-group mt-3">
		<a class="pasic-font-txt menu-txt side-title">문의 관리</a>
		<c:choose>
			<c:when test="${ fn:contains(sessionScope.mngPosition, '문의관리') }">
            	<a href="InqryMgtList.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">전체 문의 내역</a>
				<a href="InqryMgtM.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">회원 문의 내역</a>
				<a href="InqryMgtR.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">맛집 문의 내역</a>
			</c:when>
			<c:otherwise>
				<a href="InqryMgtList.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">전체 문의 내역</a>
				<a href="InqryMgtM.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">회원 문의 내역</a>
				<a href="InqryMgtR.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">맛집 문의 내역</a>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="list-group mt-3">
		<a class="pasic-font-txt menu-txt side-title">광고 관리</a>
		<c:choose>
			<c:when test="${ fn:contains(sessionScope.mngPosition, '광고관리') }">
            	<a href="advrtsList.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">전체 광고 내역</a>
				<a href="advrtsIList.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">등록 광고 내역</a>
				<a href="advrtsDList.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">삭제 광고 내역</a>
			</c:when>
			<c:otherwise>
				<a href="advrtsList.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">전체 광고 내역</a>
				<a href="advrtsIList.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">등록 광고 내역</a>
				<a href="advrtsDList.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">삭제 광고 내역</a>
			</c:otherwise>
		</c:choose>
	</div><hr>
	<div class="list-group mt-3 mb-3">
		<a class="pasic-font-txt menu-txt side-title">관리자 설정</a>
		<c:choose>
			<c:when test="${ fn:contains(sessionScope.mngPosition, '관리자설정') }">
            	<a href="managerList.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">관리자 조회</a>
				<a href="enrollView.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">관리자 등록</a>
				<a href="updateView.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">관리자 정보 변경</a>
			</c:when>
			<c:otherwise>
				<a href="managerList.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">관리자 조회</a>
				<a href="enrollView.do" class="list-group-item list-group-item-action btn-outline-secondary disabled side-padding">관리자 등록</a>
				<a href="updateView.do" class="list-group-item list-group-item-action btn-outline-secondary side-padding">관리자 정보 변경</a>
			</c:otherwise>
		</c:choose>		
	</div>
</body>
</html>