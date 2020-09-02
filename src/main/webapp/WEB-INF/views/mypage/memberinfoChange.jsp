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


<title>일반회원 정보 변경</title>

<style>
body {
  padding-top: 70px;
}
</style>

</head>
<body>
<div>
<jsp:include page="../common/menubar.jsp" />
</div>
 <!-- ↑ 사이드바 -->

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
            
            <div class="contenttitle">최근 작성한 리뷰</div>
           
            <br>

            <table>
                <div class="contentinfo">가게이름1 <button type="button" style="float: right;">해당 리뷰페이지로 이동</button></div>
            </table>
            <br>

            <table>
                <div class="contentinfo">가게이름2 <button type="button" style="float: right;">해당 리뷰페이지로 이동</button><a href="#"></a><br></div>
            </table>

            <br>
            
            <table>
                <div class="contentinfo">가게이름3 <button type="button" style="float: right;">해당 리뷰페이지로 이동</button><a href="#"></a><br></div>
            </table>

            <br>
            
            <table>
                <div class="contentinfo">가게이름4 <button type="button" style="float: right;">해당 리뷰페이지로 이동</button><a href="#"></a><br></div>
            </table>

        </div>
    </div>
<jsp:include page="../common/footer.jsp" />
</body>
</html>