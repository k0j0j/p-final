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

<title>일반회원 환불내역 페이지</title>

<style>
body{
	padding-top: 70px;
}	
</style>

</head>
<body>
<div>
<jsp:include page="../common/menubar.jsp" />
</div>

 <h1>MY PAGE</h1>

    <div id="content">
        <!-- content 부분을 가로 3등분 하기 -->
        <aside id="content-1">
            <div class="content1-1">
                <h4>??? 회원님</h4>
                <h4>Lv.3 회원</h4>
                <h6>회원 가입일</h6>
                <h6>다음레벨까지 ??? 남았습니다.</h6>
            </div><br>
            
            <div class="content1-2">
                <div class="content1-2-1">
                    <h4>보유중인 포인트</h4>
                </div>
                <div class="content1-2-2">
                    <h4>#,####</h4>
                </div>
            </div><br>        
            
            <div id="content1-3">
                <p class="menutitle">결제 내역<br>                
                    <p class="menulist"><a href="#">예약 및 결제 내역</a></p>
                    <p class="menulist"><a href="#">환불 신청 및 조회</a></p>
                </p><br><hr>
                
                <p class="menutitle">계좌내역<br>
                    <p class="menulist"><a href="#">포인트 지급내역</a></p>
                </p><br><hr>
                                                    
                <p class="menutitle">맛집 관리<br>
                    <p class="menulist"><a href="#">찜한 맛집</a></p>
                    <p class="menulist"><a href="#">최근 본 맛집</a></p>
                </p>
            </div>
        </aside>        


        <!-- 컨텐츠 -->

        <div id="content-2">
            
            <div class="contenttitle">환불내역 조회</div>
            <br>
            <table>
                <tr>
                    <th>환불 신청 일자</th>
                    <th>맛집이름</th>
                    <th>결제방법</th>
                    <th>결제금액</th>
                    <th>환불사유</th>
                    <th>예약메뉴</th>
                </tr>
                <tr>
                    <td>년.월.일</td>
                    <td>아웃백</td>
                    <td>카카오페이</td>
                    <td>100000원</td>
                    <td>개인사유</td>
                    <td>토마호크 스테이크</td>
                </tr>
                
            </table>
            <h3>항목10개 + 페이징처리</h3>
           
        </div>
    </div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>