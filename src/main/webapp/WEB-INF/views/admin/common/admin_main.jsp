<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.honeypoint.admin.reportMgt.model.vo.*, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	ArrayList<Report> rlist = (ArrayList<Report>)request.getAttribute("rlist"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

<!-- Font setting -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@900&display=swap" rel="stylesheet">


<style>
th, td {
	border-bottom: 0.3px solid #c0c0c0;
	padding: 10px;
	width:15%;
	height: 40%;
	font-weight:normal;
}


</style>

</head>

<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="container mt-3">
		<div class="container-second mt-10 col-2 ml-4 mr-4 float-left">
			<%@ include file="sideMenu.jsp" %>
		</div>
	
		<div class="container-second mt-10 col-9 float-left" style="border: 0px">			
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-4 p-3 pt-2 overflow-auto">	
			<h3>ADMIN PAGE</h3>
			<p class="loginUser" style="margin-top:10px !important">${ loginUser.mName }</p>
				<table class="preview-table table-center">
					<thead>
					<tr>
						<th class="preview-table-th">접속자 수</th>
						<th class="preview-table-th">가입자 수</th>
						<th class="preview-table-th">맛집 등록 신청</th>
						<th class="preview-table-th">신규 신고 내역</th>
						<th class="preview-table-th">결제 내역</th>
					</tr>
					</thead>
					<tbody>
			        <tr>
			        	<%! int count; %><% count++; application.setAttribute("countValue", count); %>
						<th class="preview-point">${ loginC }</th>
						<th class="preview-point"><c:out value="${ count }"></c:out></th>
						<th class="preview-point">${ count2 }</th>
						<th class="preview-point">${ count3 }</th>
						<th class="preview-point">${ count4 }</th>
					</tr>
					</tbody>
				</table>
			</div>
	
			<!-- Inqry & Report -->
			<div class="row">
				<div class="col-sm-12">
					<div class="row" style="margin:0 auto">
						<div class="col col-6 col-sm-6 float-left irarea">
							<label class="title_txt">INQRY LIST</label>
							<button type="button" class="btn-outline-warning title_btn" onclick="location.href='InqryMgtList.do'">더보기</button>
							<c:forEach var="result" items="${ result }" begin="0" end="3">
								<p class="main-list-txt btn-outline-dark" style="cursor:pointer">· <c:out value="[${ result.inqrySe }] ${ result.inqryTitle }"/></p>
							</c:forEach>
						</div>
					
						<div class="col col-6 col-sm-6 irarea">
					        <label class="title_txt">REPORT LIST</label>
							<button type="button" class="btn-outline-warning title_btn" onclick="location.href='reportList.do'">더보기</button>
							
								<c:forEach var="result2" items="${result2}" begin="0" end="3">								
									<p class="main-list-txt btn-outline-dark" style="cursor:pointer">·<c:out value="${ result2.MId } ( ${ result2.targetId }: ${ result2.rptResn})"/></p>
								</c:forEach>
						</div>
					</div>
				</div>
		
				<!-- Banner -->
				<div class="w-100 p-3 overflow-auto irarea">
					<div class="col col-12 float-left m-auto left-index " style="border-top: 0.5px dotted #F4E700"></div>
					<p></p>
					<div class="col col-6 col-sm-6 float-left not-margin-top">
						<label class="title_txt">BANNER LIST</label>
						<c:forEach var="result3" items="${result3}" begin="0" end="1">								
								<p class="main-list-txt btn-outline-dark" style="cursor:pointer" onclick="adDetail(${ result3.bnrNo })">· <c:out value="${ result3.bnrNm }"/></p>
						</c:forEach>
					</div>
					
					<div class="col col-6 col-sm-6 float-left not-margin-top">					 
						<label class="title_txt"></label>
						<button type="button" class="btn-outline-warning title_btn" onclick="location.href='advrtsList.do'">더보기</button>
						<label class="title_txt">　</label>
						<c:forEach var="result3" items="${result3}" begin="2" end="3">
								<p class="main-list-txt btn-outline-dark" style="cursor:pointer" onclick="adDetail(${ result3.bnrNo })">· <c:out value="${ result3.bnrNm }"/></p>
						</c:forEach>
						<!-- <p class="main-list-txt" style="margin-top:20px">· 출력 중인 광고 3</p>
						<p class="main-list-txt">· 출력 중인 광고 4</p> -->
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
<script>
	function adDetail(bNo){
		location.href="${ contextPath }/adDetail.do?bNo=" + bNo;
	} 
</script>
</html>