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
    <link href="${ contextPath }/resources/css/detailview/default.css?ver=1" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/writeReview.css?ver=1" rel="stylesheet" type="text/css" media="all" />

    

    <!-- textarea autosize -->
    <script type="text/javascript" src="${ contextPath }/resources/autosize/dist/autosize.min.js"></script>
    
    <!-- jquery -->
    <script
    src="https://code.jquery.com/jquery-3.5.1.js"
    integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
    crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="../common/menubar.jsp" />
    <div class="insertReviewPage pt-3 mt-5">
        <div class="pageWrapper">

            <header class="i-review-title">
                리뷰 작성하기 - 
                <span class="restaurant-name">맛집 1996</span>
            </header>

            <div class="ReviewWritingPage_Container">
                <section class="i-review-content">
                    <ul class="RestaurantRecommendPicker_list">
                        <li class="RestaurantRecommendPicker_item">
                            <button class="RestaurantRecommendPicker_button RestaurantRecommendPicker_button_recommend">
                                <img src="${ contextPath }/resources/img/detailview/faces/restaurant_recommend_face.png" class="RestaurantRecommendPicker_image RestaurantRecommendPicker_image_recommend"></img>
                                <span class="RestaurantRecommendPicker_likeLabel RestaurantRecommendPicker_likeLabel_recommend">맛있다</span>
                            </button>
                        </li>
                        <li class="RestaurantRecommendPicker_item">
                            <button class="RestaurantRecommendPicker_button RestaurantRecommendPicker_button_ok">
                                <img src="${ contextPath }/resources/img/detailview/faces/restaurant_ok_face.png" class="RestaurantRecommendPicker_image RestaurantRecommendPicker_image_ok"></img>
                                <span class="RestaurantRecommendPicker_likeLabel RestaurantRecommendPicker_likeLabel_ok">괜찮다</span>
                            </button>
                        </li>
                        <li class="RestaurantRecommendPicker_item">
                            <button class="RestaurantRecommendPicker_button RestaurantRecommendPicker_button_unRecommend">
                                <img src="${ contextPath }/resources/img/detailview/faces/restaurant_unRecommend_face.png" class="RestaurantRecommendPicker_image RestaurantRecommendPicker_image_unRecommend"></img>
                                <span class="RestaurantRecommendPicker_likeLabel RestaurantRecommendPicker_likeLabel_unRecommend">보통</span>
                            </button>
                        </li>
                    </ul>
                    <div class="i-review-item-editor">
                        <textarea class="ReviewEditor_Editor" maxlength="10000" style="overflow: hidden; overflow-wrap: break-word; height: 150px;" placeholder="김영진님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"></textarea>
                    </div>
                    <div class="i-review-item-image"></div>
                </section>
                <p class="ReviewEditor__TextLengthStateBox">
                    <span class="ReviewEditor__CurrentTextLength">0</span>
                    <span class="ReviewEditor__TextLengthStateDivider">/</span>
                    <span class="ReviewEditor__MaxTextLength">4000</span>
                </p>
            </div>

            <div class="draggable_image_wrapper">
                <ul class="draggable_image_wrapper_pictureList">
                    <li class="draggable_image_wrapper_pictureItem draggable_image_wrapper_lastPictureItem">
                        <button class="draggable_image_wrapper_pictureButton">
                            <i class="draggable_image_wrapper_plus"></i>
                        </button>
                        <p class="Review_ImageCountStateBox">
                            <span class="Review_CurrentImages">0</span>
                            <span class="Review_CountStateDivider">/</span>
                            <span class="Review_MaxImages">15</span>
                        </p>
                    </li>
                    
                </ul>
            </div>
            
            <div class="control-buttons">
                <button type="button" class="btn btn-warning" style="width:100px; height:50px;">취소</button>
                <button type="submit" class="btn btn-warning" style="width:100px; height:50px;">작성</button>
            </div>

            <div class="fileArea">

				<!-- 인풋태그들어올자리 -->
            </div>
        </div>
        
    </div>
    <script type="text/javascript" src="${ contextPath }/resources/js/detail/writeReview.js?ver=2"></script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>