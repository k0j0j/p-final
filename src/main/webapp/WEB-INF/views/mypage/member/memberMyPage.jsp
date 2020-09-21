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

<title>일반회원 마이페이지</title>

<style>
body {
	padding-top: 70px;
	
	background: #F0F2F0;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to bottom, #000C40, #F0F2F0);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to bottom, #000C40, #F0F2F0); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

.infocg {
	width: 29%;
	height: 100%;
	float: center;
}

.container-background{
	background: white;
}

a { text-decoration:none !important } 
a:hover { text-decoration:none !important }
</style>
</head>

<body>
	<div>
		<jsp:include page="../../common/menubar3.jsp" />
	</div>
	<div class="container mb-3 container-background">
		<div class="container-second">

			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-4 pt-3 mb-4 overflow-auto title-txt">
				<h1 class="title">My Page</h1>
			</div>

			<div class="row">
				<!-- SIDE MENU BAR -->
				<div class="col-sm-3 mr-5">
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

					<div class="content-side-3 txt-center p-3" style="border: 1px solid lightgray">
						<p class="side-menu-title">결제 내역</p>
						<p class="side-menu-list">
							<a href="<c:url value="memberreservepaylist.do"/>">예약 및 결제 내역</a>
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
				<div class="col-sm-6">
					<div class="content-title mb-5">
						<div>
							<p class="float-left" style="margin: 0px">최근 결제 내역</p>
							<button class="btn btn-warning float-right more-view-btn"
							Onclick="location.href='memberrecentpay.do'"  style="cursor:pointer;">더보기</button>
						</div>
						<div>
							<table class="table">
								<colgroup>
									<col width="20%" />
									<col width="20%" />
									<col width="60%" />
								</colgroup>
								<tr class="bg-light">
									<th class="content-txt-size txt-center">결제일자</th>
									<th class="content-txt-size txt-center">결제종류</th>
									<th class="content-txt-size txt-center">내용</th>
								</tr>
								<tr>
									<td class="content-txt-size">년.월.일</td>
									<td class="content-txt-size">카카오페이</td>
									<td class="content-txt-size">가게이름(시간, ?인)ddddddd</td>
								</tr>
							</table>
						</div>
					</div>

					<!-- 리뷰알람 영역 -->
					<div class="content-title float-left mb-2">
						<!-- 리뷰 알람 title & 버튼 영역 -->
						<div class="float-none">
							<p class="float-left" style="margin: 0px">리뷰 알람</p>

						</div>
						<!-- 리뷰 알람 개수 출력 영역 -->
						<div class="content-info">
							<div class="review-alarm context-txt-m-size">
								<div class="float-none">
									<p class="float-left margin-left-15">작성 가능한 리뷰가 2건 있습니다.</p>
								</div>
							</div>
						</div>
					</div>

					<!-- 최근 작성 리뷰 영역 -->
					<div class="content-title float-left mb-4">
						<!-- 최근 작성 리뷰 영역 -->
						<div>
							<p class="float-left" style="margin: 0px">최근 작성한 리뷰</p>
						</div>
						<div class="content-info content-text-m-size">
							<div class="contentinfo">
								리뷰 내용 <a href="#"></a>
								<button class="btn btn-warning float-right more-view-btn"
								Onclick="location.href='recentreview.do'"  style="cursor:pointer;">더보기</button>
							</div>
						</div>
					</div>

					<div class="content-title">
						<div>
							<p class="mt-0">회원 정보 변경 및 탈퇴</p>
						</div>
						<div class=" content-info content-txt-m-size float-none">
							<p class="margin-left-15 float-left" style="margin: 0px">최근
								수정일자 : ${ loginUser.mModifyDate}</p>
							<button	class="btn btn-warning update-info more-view-btn float-right" 
							Onclick="location.href='memberinfochange.do'"  style="cursor:pointer;">정보
								변경하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../../common/footer3.jsp" />
</body>
</html>