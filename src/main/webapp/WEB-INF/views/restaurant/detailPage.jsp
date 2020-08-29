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
    <link href="${ contextPath }/resources/css/detailview/default-before.css?ver=2" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/detail.css?ver=2" rel="stylesheet" type="text/css" media="all" />
    
    <link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/vendor/main/bootstrap/css/bootstrap.css">
    <!-- gallery -->

    <script
    src="https://code.jquery.com/jquery-3.5.1.js"
    integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>

    <!-- fresco -->
    <script type="text/javascript" src="${ contextPath }/resources/css/fresco/dist/js/fresco.min.js"></script>
    <link href="${ contextPath }/resources/css/fresco/dist/css/fresco.css" rel="stylesheet" type="text/css"/>
    
    <style>
        /* ${ contextPath }/resources/img/detailview/캡처.JPG */

    </style>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
    <div class="list-photo-wrap pt-3 mt-5">
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처.JPG">
                </a>
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처1.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처1.JPG">
                </a>
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처2.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처2.JPG">
                </a>
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처3.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처3.JPG">
                </a>
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처1.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처1.JPG">
                </a>
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처2.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처2.JPG">
                </a>
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <a href="${ contextPath }/resources/img/detailview/캡처2.JPG" class="fresco" data-fresco-group="unique_name1">
                    <img class="photo" src="${ contextPath }/resources/img/detailview/캡처2.JPG">
                </a>
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
                        	<a href="<c:url value="reviewWrite.do" />">
	                            <button class="review_writing_button">
	                                <i class="review_writing_button_icon"></i>
	                                <span class="review_writing_button_text">
	                                   	 리뷰쓰기
	                                </span>
	                            </button>
	                      	</a>
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

            <div style="padding-bottom: 100px; border-bottom: 1px solid rgb(194, 194, 194);">
            
                <!-- <div class="advertisement_wrap" style="width:1000px; height:200px; border: 1px solid red; margin: auto; margin-top: 50px;"></div> -->

                <div class="map_wrap" style="margin-top: 50px;">
                    <h2>지도</h2>
                    <br>
                    <div id="map" style="height:400px; border: 1px solid red;"></div>
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
                            <ul class="RestaurantReviewItem_UserStat">
                            	<li class="RestaurantReviewItem_UserNickName">김영진</li>
                                <li class="RestaurantReviewItem_UserLevel">Level 1</li>
                                <li class="RestaurantReviewItem_ButtonWrap">
                                	<button class="RestaurantReviewItem_Button">수정</button>
                                	<button class="RestaurantReviewItem_Button">삭제</button>
                                </li>
                            </ul>
                        </div>
                        <div class="RestaurantReviewItem_Content">

							<div class="RestaurantReviewItem__ReviewTextWrap">
								<div class="review_date">2020.05.05</div>
								가성비 최고의 맛집!<br>
								저는 이동갈비를 먹고 정갈비를 먹었는데요.<br>
								이동갈비는 좀 짜서 정갈비를 드신 후에 이동갈비랑 밥을 드시는 것을 추천해요!!<br>
								<br>
								여기서 좀 아쉬운 점은 국물을 떠 먹을 수 있는 된장찌개가 없고 물냉면이 없다는 점 ㅠㅠ 물냉파는 진짜 서러웠습니다 ㅠㅠ <br>
								<br>
								그대신 고기가 맛있고 저렴하고 양도 많아서 정말 잘 먹었어요! 원래 삼겹살 혼자 4인분은 먹어야 배 차는데 남친이랑 여기 갈비 4인분 먹고도 배 찼어요 ㅎㅎ<br>
								<br>
								전 무조건 다시 갈 것 같아요!! 갈비 맛집으로 추천합니다!!<br>
                            </div>

                            <ul class="RestaurantReviewItem__PictureList">
                                <li class="RestaurantReviewItem__PictureItem">
                                    <button class="RestaurantReviewItem__PictureButton" id="example-1">
                                        <img src="${ contextPath }/resources/img/detailview/캡처1.JPG">
                                    </button>
                                </li>
                                <li class="RestaurantReviewItem__PictureItem">
                                    <button class="RestaurantReviewItem__PictureButton">
                                        <img src="${ contextPath }/resources/img/detailview/캡처2.JPG">
                                    </button>
                                </li>
                                <li class="RestaurantReviewItem__PictureItem">
                                    <button class="RestaurantReviewItem__PictureButton">
                                        <img src="${ contextPath }/resources/img/detailview/캡처3.JPG">
                                    </button>
                                </li>
                                <li class="RestaurantReviewItem__PictureItem">
                                    <button class="RestaurantReviewItem__PictureButton">
                                        <img src="${ contextPath }/resources/img/detailview/카페1.jpg">
                                        <div class="RestaurantReviewItem__PictureDeem">+5</div>
                                    </button>
                                </li>
                            </ul>

                        </div>

                        <div class="RestaurantReviewItem_RecommendIconWrap">
                            <div class="RestaurantReviewItem_RecommendIcon"></div>
                            <span class="RestaurantReviewItem_RatingText">맛있다</span>
                        </div>

                    </li>
                    <li class="RestaurantReviewItem RestaurantReviewList_ReviewItem">
                        <div class="RestaurantReviewItem_User">
                            <div class="RestaurantReviewItem_UserPictureWrap">
                                <image class="RestaurantReviewItem_UserPicture" src="https://graph.facebook.com/495782101149814/picture?fit=around|56:56&crop=56:56;*,*&output-format=jpg&output-quality=80"> </image>
                            </div>
                            <ul class="RestaurantReviewItem_UserStat">
                            	<li class="RestaurantReviewItem_UserNickName">김영진</li>
                                <li class="RestaurantReviewItem_UserLevel">Level 1</li>
                                <li class="RestaurantReviewItem_ButtonWrap">
                                	<button class="RestaurantReviewItem_Button">수정</button>
                                	<button class="RestaurantReviewItem_Button">삭제</button>
                                </li>
                            </ul>
                        </div>
                        <div class="RestaurantReviewItem_Content">
							<div class="RestaurantReviewItem__ReviewTextWrap">
								<span>2020.05.05</span><br>
								가성비 최고의 맛집!<br>
								저는 이동갈비를 먹고 정갈비를 먹었는데요.<br>
								이동갈비는 좀 짜서 정갈비를 드신 후에 이동갈비랑 밥을 드시는 것을 추천해요!!<br>
								<br>
								여기서 좀 아쉬운 점은 국물을 떠 먹을 수 있는 된장찌개가 없고 물냉면이 없다는 점 ㅠㅠ 물냉파는 진짜 서러웠습니다 ㅠㅠ <br>
								<br>
								그대신 고기가 맛있고 저렴하고 양도 많아서 정말 잘 먹었어요! 원래 삼겹살 혼자 4인분은 먹어야 배 차는데 남친이랑 여기 갈비 4인분 먹고도 배 찼어요 ㅎㅎ<br>
								<br>
								전 무조건 다시 갈 것 같아요!! 갈비 맛집으로 추천합니다!!<br>

 
							</div>
                        </div>
                        <div class="RestaurantReviewItem_RecommendIconWrap">
                            <div class="RestaurantReviewItem_RecommendIcon"></div>
                            <span class="RestaurantReviewItem_RatingText">맛있다</span>
                        </div>
                    </li>
                </ul>
            </section>
            
        </div>
    </div>
	
	<jsp:include page="../common/footer.jsp" />
	
    <script type='text/javascript'>
        $(document).ready(function() {
          $('.RestaurantReviewItem__PictureButton').on('click', function(event) {
            // the page will scroll up without this
            event.preventDefault();
        
            // Fresco API code goes here
            Fresco.show(['${ contextPath }/resources/img/detailview/캡처1.JPG', '${ contextPath }/resources/img/detailview/캡처2.JPG'
                        ,  '${ contextPath }/resources/img/detailview/캡처3.JPG',  '${ contextPath }/resources/img/detailview/카페1.jpg'
                        ,  '${ contextPath }/resources/img/detailview/캡처1.JPG']);
          });
        });
        </script>



</body>

</html>