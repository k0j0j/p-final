<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/main/favicon.png" />
	<title>HONEYPOINT, 나의 맛집 로드</title>  
	    
    <c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link href="${ contextPath }/resources/css/detailview/default.css" rel="stylesheet" type="text/css" media="all" />
    <%-- <link href="${ contextPath }/resources/css/editorRecommend/editorList.css"> --%>
    
</head>
<style>
.title-wrap {
        display: flex;
        justify-content: center;
        align-items: center;
        height:100px;
        
    }

    .title {
        font-size: 30px;
        font-weight: bold;
    }

    /* card list */

    .card-item {
        margin-bottom: 2rem;
        
    }

    .card-image{
        border-radius: 10%;
        height: 0;
        padding-bottom: 60%;
        background-color: lightgrey;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;
        position: relative;
        
    }
    
    .background-opacity {
        display: flex;
        position: absolute;
        border-radius: 10%;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.2);
        justify-content: center;
        align-items: center;
    }

    .card-title {
        color: whitesmoke;
        font-size: 1.4rem;
        text-shadow: 10px 10px 16px rgba(0,0,0,0.9);
        text-align: center;
        font-weight: bold;
        margin: 0 10px;
    }

    .card-image img{
        display: none;
    }

    @media (min-width:600px) {
        .card-list {
            display: flex;
            flex-wrap: wrap;
            margin: 0 -1rem;
            
        }
        .card-item {
            width: 50%;
            padding: 0 1rem;
        }

        
    }

    @media (min-width: 1200px) {
        .card-item {
            width:33%;
        }

        .editor-list-page {
            padding: 0 100px;
        }
    }
</style>
<body>
<jsp:include page="../common/menubar4.jsp" />
    <div class="editor-list-page pt-3 mt-5">
        <section class="title-wrap">
            <p class="title">에디터 추천 맛집</p>
        </section>

        <ul class="card-list">
            <li class="card-item">
                <figure class="card-image" style="background-image: url(${contextPath}/resources/img/main/food5.jpg);">
                     <img src="${contextPath}/resources/img/main/food5.jpg" alt="에디터추맛1">
                     <div class="background-opacity">
                         <span class="card-title">
                            인천 구월동 카페 TOP 10
                         </span>
                     </div>
                </figure>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(${contextPath}/resources/img/main/food4.jpg);">
                     <img src="${contextPath}/resources/img/main/food4.jpg">
                     <div class="background-opacity">
                        <span class="card-title">
                            올림픽공원 주변 맛집 베스트 35곳
                        </span>
                    </div>
                </figure>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(${contextPath}/resources/img/main/food3.jpg);">
                     <img src="${contextPath}/resources/img/main/food3.jpg" alt="에디터추맛3">
                     <div class="background-opacity">
                        <span class="card-title">
                            포항 맛집 베스트 7곳
                        </span>
                    </div>
                </figure>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(${contextPath}/resources/img/main/food2.jpg);">
                     <img src="${contextPath}/resources/img/main/food2.jpg" alt="에디터추맛4">
                     <div class="background-opacity">
                        <span class="card-title">
                            삼계탕 맛집 베스트 20곳
                        </span>
                    </div>
                </figure>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(${contextPath}/resources/img/main/food1.jpg);">
                     <img src="${contextPath}/resources/img/main/food1.jpg" alt="에디터추맛5">
                     <div class="background-opacity">
                        <span class="card-title">
                            막국수 맛집 베스트 50곳
                        </span>
                    </div>
                </figure>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(${contextPath}/resources/img/main/food5.jpg);">
                     <img src="${contextPath}/resources/img/main/food5.jpg" alt="에디터추맛6">
                     <div class="background-opacity">
                        <span class="card-title">
                            망고 빙수 맛집 베스트 7곳
                        </span>
                    </div>
                </figure>
            </li>
        </ul>
    </div>











    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <jsp:include page="../common/footer4.jsp" />
</body>


</html>