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


<title>맛집회원 일정관리</title>

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
				<h1 class="title">맛집 일정관리</h1>
			</div>
			
	
			<!-- Inqry & Report -->
			<div class="row">
				<!-- SIDE MENU BAR -->
				<div class="col-sm-3">
					<div class="content-side-1 txt-center p-3" style="border: 1px solid lightgray">
						<h5>맛집 평점</h5>
						<hr>
						<h5 class="score-avg">★4.3점 / 4.5점</h5>
					</div>
	
					<div class="content-side-2 p-3">
						<p class="side-menu-title">결제 내역</p>
						<p class="side-menu-list"><a href="#">결제 내역</a></p>
						<!-- <p class="side-menu-list"><a href="#">취소 예약 내역</a></p> -->
						<hr>
		
						<p class="side-menu-title">맛집 관리</p>
						<p class="side-menu-list"><a href="#">맛집 정보 변경</a></p>
						<p class="side-menu-list"><a href="#">임시 휴업일 설정</a></p>
						<hr>
		
						<p class="side-menu-title">고객 관리</p>
						<p class="side-menu-list"><a href="#">예약 고객 목록</a></p>
						<!-- <p class="side-menu-list"><a href="#">찜한 고객 목록</a></p> -->
						<hr>
		
						<p class="side-menu-title">문의 내역<br></p>
						<p class="side-menu-list"><a href="#">고객 문의</a></p>
						<p class="side-menu-list"><a href="#">관리자 문의</a></p>
					</div>
				</div> 


        <!-- 컨텐츠 -->

        <div id="content-2">
            
            <div class="contenttitle">예약 일정 관리</div>
            <hr>

            <div class="onoff">
                <p>예약기능 활성화 + ON OFF 버튼</p>
            
            </div>
            
        <div class="time">
            <div class="timeset">
                <p>오전</p>
                <button>9:30</button><button>10:00</button><button>10:30</button>
                <button>11:00</button><button>11:30</button><button>12:00</button>

                <p>오후</p>
                <button>12:30</button><button>13:00</button><button>13:30</button>
                <button>14:00</button><button>14:30</button><button>15:00</button>
            </div>
            <div class="reservetimeset">
                        <p>예약시간 설정</p>
                <select style="width:100px;">
                    <option selected>--- 시</option>
                    <!-- value값 줘서 증가하도록 만들기 -->
                    <option>09 시</option>
                    <option>10 시</option>
                    <option>11 시</option>
                </select>

                        
                <select>
                    <option selected>--- 분</option>
                    <option value="ko">10 분</option>
                    <option value="ch">20 분</option>
                    <option value="jp">30 분</option>
                </select>
                <h1>↑ 크기 키우는법??</h1>

                <p>추가하거나 삭제하고 싶은 시간을 설정 후 아래 버튼을 눌러주세요!</p>
                <button>추가</button>
                <button>삭제</button>
            </div>

            <p>예약 인원 설정</p>
            <p>최소인원 <input type="text"> 명</p>
            <p>최대인원 <input type="text"> 명</p>
            <button>저장</button>
        </div>

    </div>

</body>
</html>