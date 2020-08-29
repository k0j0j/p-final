<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet"	href="${ contextPath }/resources/css/mypage/mypage.css" type="text/css" />


<title>맛집회원 마이페이지</title>

<style>
body {
   padding-top: 70px;
}
</style>
</head>

<body>

<jsp:include page="../common/menubar.jsp" />

<!-- MENU BAR -->
<div class="container float-left container-center" style="border: 1px solid lightgray">
	<div class="container-second float-left mt-5">
	
		<!-- TITLE -->
		<div class="title-txt ">
			<h1 class="title">My Page</h1>
		</div>
	
		<div class="content float-left mt-2" >
			<!-- content 부분을 가로 3등분 하기 -->
			<div class="content-side col-3">
				<div class="content-side-1">
					<h4>맛집 평점</h4>
					<hr>
					<h4 class="scoreavg">★4.3점 / 4.5점</h4>
				</div>
	
				<div id="content-side-2">
					<p class="side-menu-title">결제 내역</p>
					<p class="side-menu-list"><a href="#">결제 내역</a></p>
					<p class="side-menu-list"><a href="#">취소 예약 내역</a></p>
					<hr>
	
					<p class="side-menu-title">맛집 관리</p>
					<p class="side-menu-list"><a href="#">맛집 정보 변경</a></p>
					<p class="side-menu-list"><a href="#">임시 휴업일 설정</a></p>
					<hr>
	
					<p class="side-menu-title">고객 관리</p>
					<p class="side-menu-list"><a href="#">예약 고객 목록</a></p>
					<p class="side-menu-list"><a href="#">찜한 고객 목록</a></p>
					<hr>
	
					<p class="side-menu-title">문의 내역<br></p>
					<p class="side-menu-list"><a href="#">고객 문의</a></p>
					<p class="side-menu-list"><a href="#">관리자 문의</a></p>
				</div>
			</div>
	
			<!-- 우측 본문 영역-->
			<div class="content-area col-8 float-right">
				<div class="content-title float-left mb-3">
					<div class="float-none">
						<p class="float-left">최근 예약 내역</p>
						<button class="btn btn-warning float-right more-view-btn ">예약 더보기</button>
					</div>
					<div>
						<table class="table">
							<colgroup>
								<col width="15%"/>
								<col width="15%"/>
								<col width="55%"/>
								<col width="30%"/>
							</colgroup>
							<tr class="bg-light">
								<th class="content-txt-size txt-center">예약일자</th>
								<th class="content-txt-size txt-center">예약시간</th>
								<th class="content-txt-size txt-center">메뉴</th>
								<th class="content-txt-size txt-center">인원</th>
							</tr>
							<tr>
								<td class="content-txt-size">년.월.일</td>
								<td class="content-txt-size">13:00</td>
								<td class="content-txt-size">가게이름(시간, ?인) (표 부트스트랩 활용)</td>
								<td class="content-txt-size">?명</td>
							</tr>
						</table>
					</div>
				</div>
	
				<!-- 신규 리뷰 영역 -->
				<div class="content-title float-left mb-3">
					<!-- 신규 리뷰 title & 버튼 영역 -->
					<div class="float-none">
						<p class="float-left">신규 리뷰</p>
						<button class="btn btn-warning float-right more-view-btn">리뷰 확인하러 가기</button>
					</div>
					<!-- 신규 등록 리뷰 개수 출력 영역 -->
					<div class="content-info">
						<div class="new-review content-txt-m-size">
							<div class="float-none">
								<p class="float-left margin-left-15">신규 등록된 리뷰가 2건 있습니다.</p>
								<p class="float-right"><a href="#">더보기 ></a></p>							
							</div>
						</div>
					</div>
				</div>
				
				<!-- 최근 작성 댓글 영역 -->	
				<div class="content-title float-left mb-3">
					<!-- 최근 작성 댓글 영역 -->
					<div>
						<p>최근 작성한 댓글</p>
					</div>
					<div class="content-info content-txt-m-size">
						<p class="margin-left-15">예약: 문승원 문승원님, 안녕하세요. 다음에도 예약해주시면 좋은 좌석으로 준비 하겠습니다. 좋은 리뷰 남겨주셔서 고맙습니다^^</p>
						<div class="review-date">
							<p class="create-date float-right">작성된 날짜: 2020-07-19</p>
						</div>
					</div>
				</div>
	
				<div class="content-title">
					<div>
						<p>맛집 정보 변경 및 탈퇴</p>
					</div>
					<div class="content-info content-txt-m-size float-none">
						<p class="margin-left-15 float-left">최근 수정일자 : 2020-07-04 21:30</p>
						<button class="btn btn-warning update-info more-view-btn float-right">정보 변경하기</button>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="footer-bottom">
	<jsp:include page="../common/footer.jsp" />
</div>
</body>
</html>