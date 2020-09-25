<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/img/main/favicon.png" />

<title>HONEYPOINT, 나의 맛집 로드</title>

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
	href="${contextPath}/resources/css/main/clean-blog.min.main.css?ver=1.1"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/main/clean-blog.css?ver=1.1"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,600,700"
	rel="stylesheet" />
<link href="${ contextPath }/resources/css/main/main.css"
	rel="stylesheet" />

<style>
#hotkeyword {
	border: 3px solid #F4E700;
	color: black;
	background-color: white;
	width: 610px;
	height: 5%;
	text-align: left;
}

.btn1 {
	position: relation;
	width: 358px;
	height: 50px;
}

.container {
	width: 100%;
}

.food {
	width: 100%;
	height: 10%;
	font-weight: bold;
	color: #000;
	font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif;
}

.swiper-container {
	height: 300px;
	position: relative;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
}

.swiper-slide img {
	max-width: 100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
	vertical-align: middle;
}

.text {
	padding: 0px;
	color: white;
	font-weight: bold;
	text-align: center;
	top: 20%;
	left: 23%;
	position: absolute;
	font-size: 30px;
}

.adv {
	width: 50%;
	height: 100px;
	font-weight: bold;
	color: black;
	border: 1px solid black;
	font-family: Lato, 'Helvetica Neue', Helvetica, Arial, sans-serif;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
	margin-left: 285px;
}

.card-img-top {
	width: 100%;
	height: 230px;
}

.card {
	width: 100%;
	height: 380px;
}

#more {
	border-radius: 7px;
	padding: 5px;
	font-weight: 200;
}
</style>

</head>

<body>
	<jsp:include page="../common/menubar2.jsp" />

	<!-- Page Header -->
	<header class="masthead"
		style="background-image: url('${contextPath}/resources/img/main/food1.jpg')">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-10 mx-auto">
					<div class="site-heading">


						<!-- Search Bar -->
						<div class="s009">
							<form action=search.do name="searchForm" method="get">
								<div class="inner-form">
									<div class="basic-search">
										<div class="input-field">
											<input id="search" name="searchValue"
												value="${ search.searchValue }" type="text"
												placeholder="주변 맛집을 찾아보세요!" />
											<div class="icon-wrap">
												<svg class="svg-inline--fa fa-search fa-w-16" fill="#ccc"
													aria-hidden="true" data-prefix="fas" data-icon="search"
													role="img" xmlns="http://www.w3.org/2000/svg"
													viewBox="0 0 512 512">
				                  <path
														d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z"></path>
				                </svg>
											</div>
										</div>
									</div>

								</div>
						</div>
						</form>

						<br>

					</div>

				</div>
			</div>
		</div>
	</header>


	<!-- Main Content -->
	<div class="container">
		<div class="row">


			<div class="btn-group btn-group-justified" role="group"
				aria-label="...">
				<div class="btn-group btn1" role="group">
					<button type="button" class="btn btn-default">예약하러 가기</button>
				</div>
				<div class="btn-group btn1" role="group">
					<button type="button" class="btn btn-default"
						onClick="location.href ='editorPage.do'">추천 맛집</button>
				</div>
				<div class="btn-group btn1" role="group">
					<button type="button" class="btn btn-default"
						onClick="location.href ='blist.do?bType=1'"
						style="cursor: pointer;">게시판</button>
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
	<hr>

	<div class="container">
		<div class="food">&nbsp;#조회수가 높은 맛집스토리</div>
	</div>
	<br>

	<div class="container">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="a" items="${list}">
					<c:url var="rdetail" value="detail.do">
						<c:param name="rNo" value="${a.rNo}" />
					</c:url>
					<div class="swiper-slide"
						onclick="location.href ='detail.do?rNo=${a.rNo}'"
						style="cursor: pointer;">
						<img
							src="${contextPath}/resources/img/detailview/${a.plist[0].streFileName}">
					</div>

				</c:forEach>
			</div>

			<!-- 네비게이션 -->
			<div class="swiper-button-next"></div>
			<!-- 다음 버튼 (오른쪽에 있는 버튼) -->
			<div class="swiper-button-prev"></div>
			<!-- 이전 버튼 -->

			<!-- 페이징 -->
			<div class="swiper-pagination"></div>
		</div>

	</div>
	<br>
	<hr>

	<div class="container">
		<div class="food">
			&nbsp;#평점 높은 순<a href=" <c:url value="more.do"/>"><button
					type="button" class="btn btn-outline-dark float-right" id="more">더보기</button></a>
		</div>
	</div>
	<br>

	<div class="container">
		<div class="card-deck">
			<c:forEach var="a" items="${scoreList}">

				<div class="card">
					<c:url var="rdetail" value="detail.do">
						<c:param name="rNo" value="${a.rNo}" />
					</c:url>
					<img
						src="${contextPath}/resources/img/detailview/${a.plist[0].streFileName}"
						onclick="location.href ='detail.do?rNo=${a.rNo}'"
						style="cursor: pointer;" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${a.rName}</h5>
						<p1>${a.rType}&nbsp; ${a.rRating}</p1>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<br>

	<div class="container">
		<div class="adv">
			<c:forEach var="a" items="${adv}">

				<a href="http://www.chaesundang.co.kr"><img
					src="${contextPath}/resources/img/admin/banner/${a.bnrRFile}"></a>

			</c:forEach>
		</div>
	</div>
	<br>
	<hr>
	<div class="container">
		<div class="food">
			&nbsp;#요즘 뜨는 카페
			<button type="button" class="btn btn-outline-dark float-right"
				id="more">더보기</button>
		</div>
		<br>
		<div class="card-deck">
			<c:forEach var="a" items="${scoreList}">

				<div class="card">
					<c:url var="rdetail" value="detail.do">
						<c:param name="rNo" value="${a.rNo}" />
					</c:url>
					<img
						src="${contextPath}/resources/img/detailview/${a.plist[0].streFileName}"
						onclick="location.href ='detail.do?rNo=${a.rNo}'"
						style="cursor: pointer;" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${a.rName}</h5>
						<small>${a.rAddress}</small>




					</div>
				</div>
			</c:forEach>
			<%-- 			<div class="card">
			<c:forEach var="m" items="${ list }">
			<c:if test="${ m.rNo eq 41 }">
			<c:url var="rdetail" value="detail.do">
			<c:param name="rNo" value="${m.rNo}"/>
		</c:url>
			
				<img src="${contextPath}/resources/img/main/${m.plist[0].streFileName}"
				
					class="card-img-top" alt="..." onclick="location.href ='detail.do?rNo=${m.rNo}'" style="cursor: pointer;">
				<div class="card-body">
					<h5 class="card-title">${ m.rName }</h5>

					<p1>${m.rType}</p1>
					<br> <small>${m.rAddress}</small>
				</div>
				</c:if>
				</c:forEach>
			</div> --%>

		</div>
	</div>
	<br>
	<hr>

	<div class="container">
		<div class="food">
			&nbsp;#분위기 좋은 술집
			<button type="button" class="btn btn-outline-dark float-right"
				id="more">더보기</button>
		</div>
		<br>
		<div class="card-deck">
			<c:forEach var="a" items="${pub}">

				<div class="card">
					<c:url var="rdetail" value="detail.do">
						<c:param name="rNo" value="${a.rNo}" />
					</c:url>
					<img
						src="${contextPath}/resources/img/detailview/${a.plist[0].streFileName}"
						onclick="location.href ='detail.do?rNo=${a.rNo}'"
						style="cursor: pointer;" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${a.rName}</h5>
						<small>${a.rAddress}</small>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<br>

	<hr>


	<div class="container">
		<div class="food">
			&nbsp;#추천하는 양식
			<button type="button" class="btn btn-outline-dark float-right"
				id="more">더보기</button>
		</div>
		<br>
		<div class="card-deck">
			<c:forEach var="a" items="${italian}">

				<div class="card">
					<c:url var="rdetail" value="detail.do">
						<c:param name="rNo" value="${a.rNo}" />
					</c:url>
					<img
						src="${contextPath}/resources/img/detailview/${a.plist[0].streFileName}"
						onclick="location.href ='detail.do?rNo=${a.rNo}'"
						style="cursor: pointer;" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title">${a.rName}</h5>
						<small>${a.rAddress}</small>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</div>
	<br>
	<br>

	<!-- Bootstrap core JavaScript -->
	<script src="${contextPath}/resources/vendor/main/jquery/jquery.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="${contextPath}/resources/js/main/clean-blog.min.js"></script>
	<br>
	<br>
	<jsp:include page="../common/footer2.jsp" />


	<script>
		new Swiper('.swiper-container', {

			slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
			spaceBetween : 30, // 슬라이드간 간격
			slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

			// 그룹수가 맞지 않을 경우 빈칸으로 메우기
			// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
			loopFillGroupWithBlank : true,

			loop : true, // 무한 반복

			pagination : { // 페이징
				el : '.swiper-pagination',
				clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
			},
			navigation : { // 네비게이션
				nextEl : '.swiper-button-next', // 다음 버튼 클래스명
				prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
			},
		});
	</script>

	<script>
		
	</script>
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

</body>

</html>

