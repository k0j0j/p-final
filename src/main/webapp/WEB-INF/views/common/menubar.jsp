<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet"
	href="${ contextPath }/resources/css/main/clean-blog.main.css?ver=1.1"
	type="text/css">


<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">


<title>Clean Blog - Start Bootstrap Theme</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/vendor/main/bootstrap/css/bootstrap.css">

<!-- Custom fonts for this template -->
<link
	href="${contextPath}/resources/vendor/main/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link
	href="${contextPath}/resources/css/main/clean-blog.min.main.css?ver=1.2"
	rel="stylesheet">

<style>
.navbar-brand{
	font-size:20px;
}
</style>

</head>


<body>

	<c:if test="${ !empty msg }">
		<script>alert('${msg}')</script>
		<c:remove var="msg"/>
	</c:if>


	<!-- Navigation 로그인 전 -->
	<nav class="navbar navbar-expand-lg navbar-light shadow fixed-top"
		id="mainNav">
		<c:if test="${ empty sessionScope.loginUser }">
			<div class="container">
				<a class="navbar-brand" href="index.jsp">HONEYPOINT</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					MENU <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="loginPage.do" />">LOGIN</a></li>
						<li class="nav-item"><a class="nav-link"
							href="<c:url value="joinPage.do" />">SIGN UP</a></li>
					</ul>
				</div>
			</div>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
		<!-- 일반 회원 로그인 -->
					<c:if test="${ loginUser.mSortNo == 1 }">

			<div class="container">
				<a class="navbar-brand" href="index.jsp">HONEYPOINT</a>
				<ul class="navbar-nav ml-auto">
					<div class="btn-group">
						<button type="button" class="btn btn-default" id="name"
							data-toggle="dropdown" aria-expanded="false">
							${ loginUser.mName }님, 환영합니다. <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="memberreservepaylist.do">&nbsp;&nbsp;예약 내역</a></li>
							<li><a href="recentviewrstrnt.do">&nbsp;&nbsp;최근 본 맛집</a></li>
							<li><a href="memberfavorrstrnt.do">&nbsp;&nbsp;찜한 맛집</a></li>
							<li><a href="recentreview.do">&nbsp;&nbsp;작성한 리뷰</a></li>
							<li><a href="membermp.do">&nbsp;&nbsp;마이 페이지</a></li>
							<li value="LOGOUT"><a href="logout.do">&nbsp;&nbsp;로그아웃</a></li>
						</ul>
					</div>
				</ul>
			</div>
			</c:if>
			<!-- 맛집 회원 로그인 -->
				<c:if test="${ loginUser.mSortNo == 2 }">

			<div class="container">
				<a class="navbar-brand" href="index.jsp">HONEYPOINT</a>

				<ul class="navbar-nav ml-auto">
					<div class="btn-group">
						<button type="button" class="btn btn-default" id="name"
							data-toggle="dropdown" aria-expanded="false">
							${ loginUser.mName }님, 환영합니다. <span class="caret"></span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">&nbsp;&nbsp;결제내역</a></li>
							<li><a href="#">&nbsp;&nbsp;맛집 정보 변경</a></li>
							<li><a href="#">&nbsp;&nbsp;임시휴업일 설정</a></li>
							<li><a href="#">&nbsp;&nbsp;예약고객 목록</a></li>
							<li><a href="#">&nbsp;&nbsp;고객문의</a></li>
							<li><a href="#">&nbsp;&nbsp;관리자문의</a></li>
							<li value="LOGOUT"><a href="logout.do">&nbsp;&nbsp;로그아웃</a></li>
						</ul>
					</div>

				</ul>
			</div>
			</c:if>
			<!-- 관리자 로그인 -->
			<c:if test="${ loginUser.mSortNo == 3 }">


		<div class="container">
			<a class="navbar-brand" href="index.jsp">HONEYPOINT</a>
			<ul class="navbar-nav ml-auto">
				<div class="btn-group">
					<button type="button" class="btn btn-default"
						data-toggle="dropdown" aria-expanded="false">
						${ loginUser.mName }님, 환영합니다. <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li><a href="admin.do">&nbsp;&nbsp;관리자 페이지</a></li>
						<li value="LOGOUT"><a href="logout.do">&nbsp;&nbsp;로그아웃</a></li>
					</ul>
				</div>
			</ul>
		</div>
		</c:if>
		</c:if>
	</nav>
  
	<!-- Bootstrap core JavaScript -->
	<script
		src="${ contextPath }/resources/vendor/main/jquery/jquery.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${ contextPath }/resources/js/main/clean-blog.min.js"></script>


</body>
</html>