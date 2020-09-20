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


<title>맛집회원 문의내역</title>

<style>
body {
   padding-top: 70px;
}
</style>
</head>
<body>
	  <!-- ↑ 사이드바 -->

    <h1>My Page</h1>

    <div id="content">
        <!-- content 부분을 가로 3등분 하기 -->
        <aside id="content-1">
            <div class="content1-1">
                <h4>맛집 평점</h4>
                <hr>
                <h4>★4.3점 / 4.5점</h4>
            </div><br>
            
            <div id="content1-3">
                <p class="menutitle">결제 내역<br>                
                    <p class="menulist"><a href="#">결제 내역</a></p>
                    <p class="menulist"><a href="#">취소 예약 내역</a></p>
                </p><br><hr>
                <br>
                
                <p class="menutitle">맛집 관리<br>
                    <p class="menulist"><a href="#">맛집 정보 변경</a></p>
                    <p class="menulist"><a href="#">임시 휴업일 설정</a></p>
                </p><br><hr>

                <p class="menutitle">고객 관리<br>
                    <p class="menulist"><a href="#">예약 고객 목록</a></p>
                    <p class="menulist"><a href="#">찜한 고객 목록</a></p>
                </p><br><hr>
                <br>

                <p class="menutitle">문의 내역<br>
                    <p class="menulist"><a href="#">고객 문의</a></p>
                    <p class="menulist"><a href="#">관리자 문의</a></p>
                </p>
            </div>
        </aside>
        

        <!-- 컨텐츠 -->

        <div id="content-2">
            <div class="btn3">
            <button class="threebtn float-left"><a href="">전체 문의 내역</a></button>
            <button class="threebtn float-left"><a href="">맛집 문의</a></button>
            <button class="threebtn float-left"><a href="">시스템 문의</a></button>

            <button class="inquiryregist">문의 등록</button>
            </div>
            <div class="box">
            <p>시스템 문의내역</p>
            <table>
                
                <tr>
                    <th>구분</th>
                    <th class="t2">문의글 제목</th>
                    <th class="t3">문의 일자</th>
                    <th>답변 여부</th>
                </tr>
                <tr>
                    <td>일반</td>
                    <td>박재연</td>
                    <td>년.월.일</td>
                    <td>미답변</td>
                </tr>
                
            </table>
           <h3>페이징 처리는 jsp에서 한카테고리당 8개, 페이지는 1~5로 만들기</h3>

        </div>

    </div>
</body>
</html>