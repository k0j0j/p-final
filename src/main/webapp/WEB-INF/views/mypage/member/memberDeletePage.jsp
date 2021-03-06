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
				<h1 class="title">My Page</h1>
			</div>

			<div class="row">
				<!-- SIDE MENU BAR -->
				<div class="col-sm-3">
					<div class="content-side-1 txt-center p-3"
						style="border: 1px solid lightgray">
						<p class="member-name">박재연 회원님</p>
						<p class="member-level">Lv.3 회원</p>
						<p class="member-signup">회원 가입일</p>
						<p class="member-nextlevel">다음 레벨까지 ? 남았습니다</p>
					</div>

					<div class="content-side-2 txt-center p-3"
						style="border: 1px solid lightgray">
						<h4>보유중인 포인트</h4>
						<hr>
						<h4 class="held-point">1,6346 point</h4>
					</div>

					<div class="content-side-3 txt-center p-3"
						style="border: 1px solid lightgray">
						<p class="side-menu-title">결제 내역</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberreservepaylist.do"/>">예약 및 결제 내역</a>
						</p>
						<p class="side-menu-list">
							<a href=" <c:url value="memberrefund.do"/>">환불 신청 및 조회</a>
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
						<p class="side-menu-list">
							<a href=" <c:url value="recentviewrstrnt.do"/>">최근 본 맛집</a>
						</p>
					</div>

				</div>        


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
           
            <div class="btnDelete" id="btnDelete">
            <button>확인</button>
            &emsp;&emsp;&emsp;&emsp;&emsp;
            <button class="btnCancel">취소</button>
            </div>
            
        </div>
    </div> 
    
    <script>
    	$(document).ready(function(){
    		$("btnDelete").click(function(){
    			// 확인창
    			if(confirm("삭제하시겠습니까?")){
    				document.action = "${path}/mypage/member/memberdeletepage";
    				document.submit();
    			}
    		});
    	});
    
    </script>
 
<jsp:include page="../../common/footer.jsp" />
</body>
</html>