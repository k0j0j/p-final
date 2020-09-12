<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet"
	href="${ contextPath }/resources/css/mypage/mypage.css" type="text/css" />


<title>일반회원 정보 변경</title>

<style>
body {
	padding-top: 70px;
}
</style>

</head>
<body>
	<div>
		<jsp:include page="../../common/menubar.jsp" />
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
						<p class="member-name">${ loginUser.MName }님환영합니다</p>
						<p class="member-level">${ loginUser.MGrad }회원</p>
						<p class="member-signup">${ loginUser.MEnrollDate }가입하셨습니다</p>
						<p class="member-nextlevel">다음 레벨까지 ? 남았습니다</p>
					</div>

					<div class="content-side-2 txt-center p-3"
						style="border: 1px solid lightgray">
						<h4>보유중인 포인트</h4>
						<hr>
						<p class="held-point">${ loginUser.MPoint }point</p>
					</div>

					<div class="content-side-3 txt-center p-3"
						style="border: 1px solid lightgray">
						<p class="side-menu-title">결제 내역</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberreservepaylist.do"/>">예약 및 결제
								내역</a>
						</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberrefund.do"/>">환불 신청 및 조회</a>
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
						<p class="side-menu-list">
							<a href=" <c:url value="recentviewrstrnt.do"/>">최근 본 맛집</a>
						</p>
					</div>
				</div>

				<!-- 본문영역 -->

				<div class="col-sm-9">
					
					<div class="content-title mb-5">

						<p class="float-left" style="margin: 0px">회원정보 변경 페이지</p>
						<button class="btn btn-warning float-right more-view-btn">회원
							탈퇴</button>
					</div>
					<form class="inputform" method="post"
					action="mypage/member/memberinfochange.do">
						<div>
							<table class="info-table">
								<div class="float-none">
									<p class="margin-left-15 float-left" style="margin: 0px">아이디 :&ensp;</p>
									<input type="text" name="mId" value="${loginUser.MId }"
										readonly>	
									<br><br>				
									<p class="margin-left-15 float-left" style="margin: 0px">변경할 비밀번호 :&ensp;</p>
									<input type="password" name="mPwd">
									<br><br>
									<p class="margin-left-15 float-left" style="margin: 0px">비밀번호확인 :&ensp;</p>
									<input type="password" name="mPwd2">
									<br><br>
									<p class="margin-left-15 float-left" style="margin: 0px">이메일 :&ensp;</p>
									<input type="text" value="${loginUser.MEmail }" name="mEmail">
									<br><br>
									<p class="margin-left-15 float-left" style="margin: 0px">전화번호 :&ensp;</p>
									<input type="text" value="${loginUser.MPhone }" name="mPhone">
									<br><br>
									<p class="margin-left-15 float-left" style="margin: 0px">주소 :&ensp;</p>
									<input type="text" value="${loginUser.MAddress }" name="mAddress">
									<br><br>
								</div>
						</table>

						<button class="btn btn-warning float-center more-view-btn"
							id="btnUpdate">변경</button>
						<button class="btn btn-warning float-center more-view-btn">취소</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	</div>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>
