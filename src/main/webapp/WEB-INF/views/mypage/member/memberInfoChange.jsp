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
<title>일반회원 정보 변경</title>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/mypage/mypage.css" type="text/css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
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

			<!-- m & Preview -->
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
						<p class="held-point">${ m.mPoint }point</p>
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
				<!-- 본문영역 -->

				<div class="col-sm-4">

					<div class="content-title mb-5">

						<p class="float-left" style="margin: 0px">회원정보 변경</p>

						<td colspan="2" align="center">
							<c:url var="mdelete" value="memberdeletepage.do">
								<c:param name="mId" value="${ m.mId }" />
							</c:url>
						</td>
					</div>
					<div class="infocg ml-3" style="width:100%">
						<form class="inputform" method="post" action="memberUpdate.do"
							onsubmit="return validate();">
							<div>
								<table class="info-table">
									<div class="float-none">

										<p class="margin-left-15 float-left" style="margin: 0px">아이디
											:&ensp;</p>
										<input type="text" name="mId" value="${m.mId }" readonly>
										<input type="hidden" name="mNo" value="${m.mNo }"> <br>
										<br>

										<p class="margin-left-15 float-left" style="margin: 0px">변경할
											비밀번호 :&ensp;</p>
										<input type="password" name="mPwd"> <br> <br>
										<p class="margin-left-15 float-left" style="margin: 0px">이메일
											:&ensp;</p>
										<input type="text" value="${m.mEmail }" name="mEmail">
										<br> <br>
										<p class="margin-left-15 float-left" style="margin: 0px">전화번호
											:&ensp;</p>
										<input type="text" value="${m.mPhone }" name="mPhone">
										<br> <br>

										<!-- 주소 -->

										<p class="margin-left-15 float-left" style="margin: 0px">
											우편번호 :&ensp;</p>
										<input type="text" name="post" class="postcodify_postcode5"
											value="${post }" readonly>
										<button class="btn btn-warning float-center more-view-btn"
											type="button" id="postcodify_search_button" size="6">검색</button>
										<br> <br>
										<p class="margin-left-15 float-left" style="margin: 0px">
											도로명주소 :&ensp;</p>
										<input type="text" name="address1" class="postcodify_address"
											value="${address1 }" readonly> <br> <br>
										<p class="margin-left-15 float-left" name="address2"
											style="margin: 0px">상세주소 :&ensp;</p>
										<input type="text" name="address2" class="postcodify_details"
											value="${address2}"> <br> <br>
									</div>
								</table>
							</div>
							<button class="btn btn-warning float-center more-view-btn"
								id="btnUpdate">변경</button>
							<button type="reset"
								class="btn btn-warning float-center more-view-btn">
								<!-- <a href="javascript:history.back();">취소</a> -->
								취소
							</button>
							<button type="button"
								class="btn btn-warning float-right more-view-btn" float
								onclick="location.href='${ mdelete }'">회원탈퇴</button>
					</div>


					</form>
				</div>
			</div>
		</div>	
	</div>

	<jsp:include page="../../common/footer3.jsp" />

	<script>
		$(function() {
			$("#postcodify_search_button").postcodifyPopUp();
		});
	</script>

</body>
</html>
