<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


			<!-- Inqry & Report -->
			<div class="row">
				<!-- SIDE MENU BAR -->
				<div class="col-sm-3">
					<div class="content-side-1 txt-center p-3"
						style="border: 1px solid lightgray">
						<h5>맛집 평점</h5>
						<hr>
						<h5 class="score-avg">★4.3점 / 4.5점</h5>
					</div>

					<div class="content-side-2 p-3">
						<p class="side-menu-title">결제 내역</p>
						<p class="side-menu-list">
							<a href="#">결제 내역</a>
						</p>
						<!-- <p class="side-menu-list"><a href="#">취소 예약 내역</a></p> -->
						<hr>

						<p class="side-menu-title">맛집 관리</p>
						<p class="side-menu-list">
							<a href="#">맛집 정보 변경</a>
						</p>
						<p class="side-menu-list">
							<a href="#">임시 휴업일 설정</a>
						</p>
						<hr>

						<p class="side-menu-title">고객 관리</p>
						<p class="side-menu-list">
							<a href="#">예약 고객 목록</a>
						</p>
						<!-- <p class="side-menu-list"><a href="#">찜한 고객 목록</a></p> -->
						<hr>

						<p class="side-menu-title">
							문의 내역<br>
						</p>
						<p class="side-menu-list">
							<a href="#">고객 문의</a>
						</p>
						<p class="side-menu-list">
							<a href="#">관리자 문의</a>
						</p>
					</div>
				</div>


				<!-- 본문영역 -->
				<div id="content-2">

					<div class="contenttitle">
						최근 예약 내역
						<button style="float: right;">더보기</button>
					</div>
					<br>
					<table>
						<tr>
							<th>결제날짜</th>
							<th>예약자명</th>
							<th>예약인원</th>
							<th>결제방식</th>
							<th>결제금액</th>
						</tr>
						<tr>
							<td>년.월.일</td>
							<td>박재연</td>
							<td>??명(표 부트스트랩 활용)</td>
							<td>카카오페이</td>
							<td>???원</td>
						</tr>

					</table>
					<h3>페이징 처리는 jsp에서 한카테고리당 8개, 페이지는 1~5로 만들기</h3>
					<br>

				</div>
			</div>
		</div>
	</div>
</body>
</html>