<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet"
	href="${ contextPath }/resources/css/mypage/mypage.css" type="text/css" />

<title>일반회원 포인트 사용내역</title>

<style>
body {
	padding-top: 70px;
}
</style>
</head>

<body>
	<div>
		<jsp:include page="../../common/menubar3.jsp" />
	</div>
	<div class="container mb-3">
		<div class="container-second">

			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-4 mb-4 overflow-auto title-txt">
				<h1 class="title">My Page</h1>
			</div>

			<div class="row">
				<!-- SIDE MENU BAR -->
				<div class="col-sm-3">
					<div class="content-side-1 txt-center p-3"
						style="border: 1px solid lightgray">
						<p class="member-name">${ m.mName }님 환영합니다</p>
						<p class="member-level">Lv ${ m.mGrad } 회원이며</p>
						<p class="member-signup">${ m.mEnrollDate } 가입하셨습니다</p>
					</div>

					<div class="content-side-2 txt-center p-3"
						style="border: 1px solid lightgray">
						<h4>보유중인 포인트</h4>
						<hr>
						<p class="held-point">${ m.mPoint } point</p>
					</div>

					<div class="content-side-3 txt-center p-3"
						style="border: 1px solid lightgray">
						<p class="side-menu-title">결제 내역</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberreservepaylist.do"/>">예약 및 결제
								내역</a>
						</p>						
						<hr>

						<p class="side-menu-title">계좌내역</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberpaidpoint.do"/>">포인트 지급내역</a>
						</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberusedpoint.do"/>">포인트 사용내역</a>
						</p>
						<hr>

						<p class="side-menu-title">맛집 관리</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberfavorrstrnt.do"/>">찜한 맛집</a>
						</p>				
					</div>
				</div>

				<!-- 본문 영역 -->
				<div class="col-sm-9">
					<div class="content-title mb-5">
						<div>
							<p class="float-left" style="margin: 0px">포인트 사용내역</p>
						</div>
						<div>
							<table class="table">
								<colgroup>
									<col width="25%" />
									<col width="25%" />
									<col width="25%" />
									<col width="25%" />
								</colgroup>
								<thead class="tableitem">
								<tr class="bg-light">
									<th class="content-txt-size txt-center">사용날짜</th>
									<th class="content-txt-size txt-center">맛집이름</th>
									<th class="content-txt-size txt-center">차감 포인트</th>
									<th class="content-txt-size txt-center">잔여 포인트</th>
								</tr>
								</thead>
								<tbody>
									<c:forEach var="list" items="${list}">
										<tr>
											<td scope="col" class="content-txt-size"><c:out
													value="${ list.pointDate}" /></td>
											<td scope="col" class="content-txt-size"><c:out
													value="${ list.rName}" /></td>
											<td scope="col" class="content-txt-size"><c:out
													value="${ list.pointHistory}" /></td>
											<td scope="col" class="content-txt-size"><c:out
													value="${ list.mPoint}" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
						<table class="table">
							<!-- PAGING -->
							<tr align="center" height="20">
								<td colspan="6" class="pt-5 pagin-txt">
									<!-- [이전] --> <c:if test="${ pi.currentPage eq 1 }">
										<font color="lightgray">[이전] &nbsp;</font>
									</c:if> <c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="memberusedpoint.do">
											<c:param name="currentPage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<a href="${ before }" style="color: black">[이전]</a> &nbsp;
								</c:if> <!-- PAGE NUMBER --> <c:forEach var="p"
										begin="${ pi.startPage }" end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<font color="orange" size="2"><b>[${ p }]</b></font>
										</c:if>

										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="memberusedpoint.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<a href="${ pagination }" style="color: black">${ p }</a>
										</c:if>
									</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage eq pi.maxPage }">
										<font color="lightgray">&nbsp;[다음]</font>
									</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="memberusedpoint.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<a href="${ after }" style="color: black">&nbsp;[다음]</a>
									</c:if>
								</td>
							</tr>
						</table>
						
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../../common/footer.jsp" />
</body>
</html>