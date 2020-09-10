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


<title>일반회원 탈퇴 페이지</title>
<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/main/favicon.png" />

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
            
            <div class="contenttitle">회원정보 탈퇴</div>
            <br>
            <table>
                <p>현재 비밀번호 <input type="text" type="pwcheck"></p>
                <br><br><br>
                <p>비밀번호 재확인 <input type="text" type="pwrecheck"></p>
                
                &emsp;
                <br><br><br>
                <p>탈퇴사유 
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" id="closed" name="reason" value="M" checked>
                    <label for="reason">폐업</label>
                    
                    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                    <input type="radio" id="stop" name="reason" value="M" checked>
                    <label for="reason">사이트 이용중단</label>
                </p>
                <br><br><br>

            </table>
           
            <div class="yesorno">
            <button>확인</button>
            &emsp;&emsp;&emsp;&emsp;&emsp;
            <button>취소</button>
            </div>
            
        </div>
    </div> 
 
<jsp:include page="../common/footer.jsp" />
</body>
</html>