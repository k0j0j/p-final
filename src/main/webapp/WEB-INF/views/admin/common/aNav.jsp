<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css 경로 불러오기용 -->
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />

<link href="${contextPath}/resources/css/admin/admin.css" rel="stylesheet" /> 
<%-- <link href="${contextPath}/resources/css/admin/styles.css" rel="stylesheet" /> --%>

<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HONEY POINT! - ADMIN PAGE</title>
<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/main/favicon.png" />

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
   href="${contextPath}/resources/vendor/main/bootstrap/css/bootstrap.css">

<!-- Custom fonts for this template -->
<link href="${contextPath}/resources/vendor/main/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
   href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
   rel='stylesheet' type='text/css'>
<link
   href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
   rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->

<style>
body {
   padding-top: 70px;
}
</style>
</head>


<body>
   <!-- 배경 애니메이션 -->
   <!-- <div class="line line-1">
      <div class="wave wave1" style="background-image: url(src/main/webapp/WEB-INF/views/admin/common/1.png)"></div>
   </div>
   <div class="line line-1">
      <div class="wave wave2" style="background-image: url(src/main/webapp/WEB-INF/views/admin/common/2.png)"></div>
   </div>
   <div class="line line-1">
      <div class="wave wave3" style="background-image: url(src/main/webapp/WEB-INF/views/admin/common/3.png)"></div>
   </div> -->
   
   
   
   
   
   
   
   

   <nav class="navbar navbar-expand-lg shadow navbar-light fixed-top navbar-background" id="mainNav">
      <div class="container" style="background-color:white !important">
         <a class="navbar-brand" href="index.jsp">HONEY POINT</a>
         <div class="collapse navbar-collapse" id="navbarResponsive" style="background-color:white">
            <ul class="navbar-nav text-uppercase m-auto flow-ul-menu dohyeon-font">
               <li class="nav-item nav-size"><a class="nav-link js-scroll-trigger menutext" href="admin.do">MAIN</a></li>
               <li class="nav-item nav-size">
                   <a class="nav-link js-scroll-trigger menutext" href="rSearch.do">맛집</a>
                  <ul class="sub-nav-ul0">
                  	<%-- <c:choose>
						<c:if test="${ fn:contains(sessionScope.mngPosition, '광고') }">
                     		<li class="nav-item "><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="rSearch.do">　Rstrnt_MGT</a></li>
						</c:if>
						<c:otherwise>
							
						</c:otherwise>
					</c:choose> --%>
					<li class="nav-item "><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">등록된 맛집 목록</a></li>
                     <li class="nav-item "><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">신청 대기 맛집</a></li>
                     <li class="nav-item "><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">등록 불가 맛집</a></li>
                  </ul>
               </li>
                  
               <li class="nav-item nav-size ">
                  <a class="nav-link js-scroll-trigger menutext" href="memMgt.do">회원</a>
                  <ul class="sub-nav-ul0">
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="memMgt.do">등록 회원 목록</a></li>
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="xMemMgt.do">탈퇴 회원 목록</a></li>
                     
                  </ul>
               </li>
               
               <li class="nav-item nav-size">
                  <a class="nav-link js-scroll-trigger menutext" href="reportList.do">신고</a>
                  <ul class="sub-nav-ul0">
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="reportList.do">전체 신고 내역</a></li>
	                  <li class="nav-item "><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="rntReport.do">맛집 신고 내역</a></li>
	                  <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="memReport.do">회원 신고 목록</a></li>
                  </ul>
               </li>
               
               <li class="nav-item nav-size">
                  <a class="nav-link js-scroll-trigger menutext" href="InqryMgtList.do">문의</a>
                  <ul class="sub-nav-ul0">
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="InqryMgtList.do">전체 문의 내역</a></li>                     
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">회원 문의 내역</a></li>
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">맛집 문의 내역</a></li>
                  </ul>
               </li>
               
               <li class="nav-item nav-size">
                  <a class="nav-link js-scroll-trigger menutext" href="advrtsList.do">광고</a>
                  <ul class="sub-nav-ul0">
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="advrtsList.do">전체 광고 목록</a></li>
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">등록 광고 목록</a></li>
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="#">삭제 광고 목록</a></li>
                  </ul>
               </li>
               
               <li class="nav-item nav-size">
                  <a class="nav-link js-scroll-trigger menutext" href="managerList.do">관리자 설정</a>
                  <ul class="sub-nav-ul0">
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="managerList.do">관리자 조회</a></li>
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="enrollView.do">관리자 등록</a></li>
                     <li class="nav-item mr-5"><a class="nav-link js-scroll-trigger sub-nav-ul0 sub-menutext" href="updateView.do">관리자 정보 변경</a>
                  </ul>
               </li>
            <!-- logout 버튼 -->
            </ul>
            <ul class="navbar-nav text-uppercase ml-2 ">                       
               <li class="nav-item logoutbtn">
                  <a class="nav-link js-scroll-trigger menutext" href="logout.do">LOGOUT</a>
               </li>
            </ul>
         </div>
      </div>
   </nav>






   <!-- Bootstrap core JavaScript -->
   <script src="${ contextPath }/resources/vendor/main/jquery/jquery.min.js"></script>
   <!-- Custom scripts for this template -->
   <script src="${ contextPath }/resources/js/main/clean-blog.min.js"></script>


</body>
</html>