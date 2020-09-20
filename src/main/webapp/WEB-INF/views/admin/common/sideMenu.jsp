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
	padding: 2px 15px !important;
	font-family: 'Nanum Gothic', sans-serif !important;
	font-size: 12px !important;
	border: 0px;
}

</style>
</head>
<body>
	<h5 class="mt-3" style="text-align:center">관리자 페이지</h5><hr>
	<div class="list-group mt-3">
		<a>회원 관리</a>
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
		<a>맛집 관리</a>
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
	</div>
	<div class="list-group mt-3">
		<a>신고 관리</a>
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
		<a>문의 관리</a>
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
		<a>광고 관리</a>
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
	</div>
	<div class="list-group mt-3 mb-3">
		<a>관리자 설정</a>
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