<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
    <title>디테일 페이지</title>
	
	<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
	
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
    <link href="${ contextPath }/resources/css/detailview/default.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/detail.css" rel="stylesheet" type="text/css" media="all" />
    <style>
        
    </style>
</head>

<body>
    <div class="list-photo-wrap">
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="${ contextPath }/resources/img/detailview/캡처.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="${ contextPath }/resources/img/detailview/캡처1.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="${ contextPath }/resources/img/detailview/캡처2.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="${ contextPath }/resources/img/detailview/캡처3.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="${ contextPath }/resources/img/detailview/캡처1.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="${ contextPath }/resources/img/detailview/캡처2.JPG">
            </div>
        </figure>
    </div>


    <div id="wrapper">

        <div id="three-column" class="container" style="text-align: left;">

            <div class="restaurant-detail">
                <header class="title"
                    style="text-align: left; border-bottom: 1px solid rgb(194, 194, 194); padding-bottom: 10px;">
                    <div class="title_wrap">
                        <span>
                            <h2>스타쉐프 하이 후남<span style="color: rgb(255, 183, 50); font-size: 22px;">&nbsp;★ 4.5</span>
                            </h2>
                        </span>
                        <div class="action_button_wrap">
                            <button class="review_writing_button">
                                <i class="review_writing_button_icon"></i>
                                <span class="review_writing_button_text">
                                    리뷰쓰기
                                </span>
                            </button>
                        </div>
                    </div>

                    <span class="byline cnt hit">36,125</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt review">1,445</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt favorite">525</span>
                </header>
                <div>
                    <table class="info no_menu">
                        <tbody>
                            <tr>
                                <th>주소</th>
                                <td>경상북도 포항시 북구 칠성천길 108-1</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>054-247-0764</td>
                            </tr>
                            <tr>
                                <th>음식 종류</th>
                                <td>탕 / 찌개 / 전골</td>
                            </tr>
                            <tr>
                                <th>영업시간</th>
                                <td>08:00 - 20:30</td>
                            </tr>
                            <tr>
                                <th>휴일</th>
                                <td>첫째/셋째 일</td>
                            </tr>
                            <tr>
                                <th>메뉴</th>
                                <td>
                                    <ul class="Restaurant_MenuList">
                                        <li class="Restaurant_MenuItem">
                                            <span class="Restaurant_Menu">곰탕(소)</span>
                                            <span class="Restaurant_MenuPrice">15,000원</span>
                                        </li>
                                        <li class="Restaurant_MenuItem">
                                            <span class="Restaurant_Menu">수육</span>
                                            <span class="Restaurant_MenuPrice">35,000원</span>
                                        </li>
                                        <li class="Restaurant_MenuItem">
                                            <span class="Restaurant_Menu">순대국</span>
                                            <span class="Restaurant_MenuPrice">8,000원</span>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
            </div>

            <div style="width:auto; height:800px; border-bottom: 1px solid rgb(194, 194, 194);">
            
                <div class="advertisement_wrap" style="width:1000px; height:200px; border: 1px solid red; margin: auto; margin-top: 50px;"></div>

                <div class="map_wrap" style="margin-top: 50px;">
                    <h2>지도1</h2>
                    <br>
                    <div id="map" style="width:auto; height:400px; border: 1px solid red;"></div>
                </div>

            </div>
            <br>
            <section class="RestaurantReviewList">
                <header class="RestaurantReviewList_Header">
                    <h2 class="RestaurantReviewList_Title">리뷰</h2>
                    <ul class="RestaurantReviewList_FilterList">
                        <li class="RestaurantReviewList_FilterItem">
                            <button class="RestaurantReviewList_FilterButton">전체 (56)</button>
                        </li>
                        <li class="RestaurantReviewList_FilterItem">
                            <button class="RestaurantReviewList_FilterButton">추천 (46)</button>
                        </li>
                        <li class="RestaurantReviewList_FilterItem">
                            <button class="RestaurantReviewList_FilterButton">보통 (6)</button>
                        </li>
                        <li class="RestaurantReviewList_FilterItem">
                            <button class="RestaurantReviewList_FilterButton">비추천 (4)</button>
                        </li>
                    </ul>
                </header>
                <ul class="RestaurantReviewList_ReviewList">
                    <li class="RestaurantReviewItem RestaurantReviewList_ReviewItem">
                        <div class="RestaurantReviewItem_User">
                            <div class="RestaurantReviewItem_UserPictureWrap">
                                <image class="RestaurantReviewItem_UserPicture" src="https://graph.facebook.com/495782101149814/picture?fit=around|56:56&crop=56:56;*,*&output-format=jpg&output-quality=80"> </image>
                            </div>
                            <span class="RestaurantReviewItem_UserNickName">김영진</span>
                            <ul class="RestaurantReviewItem_UserStat">
                                <li class="RestaurantReviewItem_UserStatItem">15</li>
                                <li class="RestaurantReviewItem_UserStatItem">21</li>
                            </ul>
                        </div>
                        <div class="RestaurantReviewItem_Content">

                        </div>
                        <div class="RestaurantReviewItem_RequestButton">

                        </div>
                    </li>
                </ul>
            </section>
            
        </div>
    </div>

</body>

</html>