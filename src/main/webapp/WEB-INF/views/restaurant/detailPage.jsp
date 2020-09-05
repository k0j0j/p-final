<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
	<link rel="icon" type="image/x-icon" href="${contextPath}/resources/img/main/favicon.png" />
	<title>HONEYPOINT, 나의 맛집 로드</title>
	
	<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
	
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
    <link href="${ contextPath }/resources/css/detailview/default-before.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ contextPath }/resources/css/detailview/detail.css?ver=2" rel="stylesheet" type="text/css" media="all" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    
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
    
    <!-- 지도 api -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9244e1b3fd43e35da8f588c2bb10cca&libraries=services"></script>
    
    <style>

    </style>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
	
    <div class="list-photo-wrap pt-3 mt-5">
    
    	<c:forEach items="${ imgList }" var="img" varStatus="vs">
    	
    		<c:if test="${ vs.index  < 5 }">
    			<figure class="photo-wrap">
		            <div class="photo-centered">
		                <a href="${ contextPath }/resources/img/detailview/${ img.streFileName }" class="fresco" data-fresco-group="restaurant-image">
		                    <img class="photo" src="${ contextPath }/resources/img/detailview/${ img.streFileName }">
		                </a>
		            </div>
        		</figure>	
    		</c:if>
    		
    		<c:if test="${ vs.index > 4 }">
    			<figure class="photo-wrap" style="display: none;">
		            <div class="photo-centered">
		                <a href="${ contextPath }/resources/img/detailview/${ img.streFileName }" class="fresco" data-fresco-group="restaurant-image">
		                    <img class="photo" src="${ contextPath }/resources/img/detailview/${ img.streFileName }">
		                </a>
		            </div>
        		</figure>
    		</c:if>
			
		</c:forEach>

    </div>


    <div id="wrapper">

        <div id="three-column" class="container" style="text-align: left;">

            <div class="restaurant_detail">
                <header class="title"
                    style="text-align: left; border-bottom: 1px solid rgb(194, 194, 194); padding-bottom: 10px;">
                    <div class="title_wrap">
                        <span>
                            <h2>${ restaurant.RName }<span style="color: rgb(255, 183, 50); font-size: 22px;">&nbsp;★ ${ restaurant.RRating }</span>
                            </h2>
                        </span>
                        <div class="action_button_wrap">

	                      	<button class="restaurant_menu_buttons menu_share_button">
                                <img src="${ contextPath }/resources/img/detailview/icons/share.jpg" class="restaurant_menu_icon menu_share_icon"></img>
                                <span class="restaurant_menu_text share_text">
                                    	공유하기
                                </span>
                            </button>

							<a href="<c:url value="reviewWrite.do" />">
	                            <button class="restaurant_menu_buttons">
	                                <img src="${ contextPath }/resources/img/detailview/icons/review_writing_icon.png" class="restaurant_menu_icon menu_review_writing_icon"></img>
	                                <span class="restaurant_menu_text review_writing_text">
	                                    	리뷰쓰기
	                                </span>
	                            </button>
                            </a>

                            <button class="restaurant_menu_buttons">
                                <img src="${ contextPath }/resources/img/detailview/icons/favorite_icon.png" class="restaurant_menu_icon menu_favorite_icon"></img>
                                <span class="restaurant_menu_text favorite_text">
                                    	가고싶다
                                </span>
                            </button>
	                      	
                        </div>
                    </div>

                    <span class="byline cnt hit">${ restaurant.RCount }</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt review">1,445</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt favorite">525</span>
                </header>
                
                <div class="restaurant_detail_content">
	                <div class="restaurant_detail_content_item restaurant_detail_content_info">
	                    <table class="info no_menu">
	                        <tbody>
	                            <tr>
	                                <th>주소</th>
	                                <td>${ restaurant.RAddress }</td>
	                            </tr>
	                            <tr>
	                                <th>전화번호</th>
	                                <td>${ restaurant.RTel }</td>
	                            </tr>
	                            <tr>
	                                <th>가격대</th>
	                                <td>${ restaurant.RPrice }</td>
	                            </tr>
	                            <tr>
	                                <th>영업시간</th>
	                                <td>
	                                	<c:if test="${restaurant.RStartTime < 10}">
										    <c:out value= "0${ restaurant.RStartTime }:00 - " />
										</c:if>
										
										<c:if test="${restaurant.RStartTime eq 10}">
										    <c:out value= "${ restaurant.RStartTime }:00 - " />
										</c:if>
										
										<c:if test="${restaurant.RStartTime > 10}">
										    <c:out value= "${ restaurant.RStartTime }:00 - " />
										</c:if>
										
	                                	<c:if test="${restaurant.REndTime < 10}">
										    <c:out value= "0${restaurant.REndTime}:00" />
										</c:if>
										
										<c:if test="${restaurant.REndTime eq 10}">
										    <c:out value= "${restaurant.REndTime}:00" />
										</c:if>
										
										<c:if test="${restaurant.REndTime > 10}">
										    <c:out value= "${restaurant.REndTime}:00" />
										</c:if>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>휴일</th>
	                                <td>${ restaurant.RRestDay }</td>
	                            </tr>
	                            <tr>
	                                <th>메뉴</th>
	                                <td>
	                                    <ul class="Restaurant_MenuList">
	                                    
	                                    	<c:forEach items="${ menuList }" var="menu">
		                                    	<li class="Restaurant_MenuItem">
		                                            <span class="Restaurant_Menu">${ menu.menuName }</span>
		                                            <span class="Restaurant_MenuPrice">${ menu.menuPrice }원</span>
		                                        </li>
	                                    	</c:forEach>
	                                    	
	                                    </ul>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                
	                <div class="restaurant_detail_content_item restaurant_detail_content_side">
	                	<a href="<c:url value="searchlocation.do" />">
	                		<button type="button" class="btn btn-warning" style="width:200px; height:50px;">좌표찾기용</button>
	                	</a>
	                	<button type="button" class="btn btn-warning" style="width:200px; height:50px;">예약하기</button>
	                </div>
	                
                </div>
                <br>
            </div>

            <div style="padding-bottom: 100px; border-bottom: 1px solid rgb(194, 194, 194);">
            
                <!-- <div class="advertisement_wrap" style="width:1000px; height:200px; border: 1px solid red; margin: auto; margin-top: 50px;"></div> -->

                <div class="map_wrap" style="margin-top: 50px;">
                    <h2>지도</h2>
                    <br>
                    <div id="map" style="height:400px;"></div>
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
	
	<div class="share_modal_container">
        <div class="share_modal_dialog">
            
            <div class="share_modal_header">
                <h2 class="share_modal_title">　　　공유하기</h2>
                <button class="share_modal_close">
                    <img class= "share_modal_close_icon" src="${ contextPath }/resources/img/detailview/close.png">
                </button>
            </div>
            
            <div class="share_modal_content">

                <div class="share_modal_itemWrapper">
                    <div class="share_modal_item">
                        <button class="share_modal_item_button">
                            <img src="${ contextPath }/resources/img/detailview/icons/kakaotalk.png">
                            <span class="share_modal_item_text">카카오톡</span>
                        </button>
                        
                    </div>

                    <div class="share_modal_item">
                        <button class="share_modal_item_button">
                            <img src="${ contextPath }/resources/img/detailview/icons/fb.png">
                            <span class="share_modal_item_text">페이스북</span>
                        </button>
                    </div>

                    <div class="share_modal_item">
                        <button class="share_modal_item_button">
                            <img src="${ contextPath }/resources/img/detailview/icons/url.png">
                            <span class="share_modal_item_text">URL</span>
                        </button>
                    </div>
                </div>


                    

            </div>

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
        
        $('.menu_share_button').on('click', function(event) {
            $('.share_modal_container').css("opacity", "1");
            $('.share_modal_container').css("display", "flex");
            
        });

        $('.share_modal_close').on('click', function(event) {
            $('.share_modal_container').css("opacity", "0");
            $('.share_modal_container').css("display", "none");
            
        });

        </script>

		<script>
			// 카카오 지도
	
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption);
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${ restaurant.RAddress }',
							function(result, status) {
	
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {
	
									var coords = new kakao.maps.LatLng(result[0].y,
											result[0].x);
	
									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
										map : map,
										position : coords
									});
	
									var iwContent = '<div style="padding:5px;">${ restaurant.RName } <br><a href="https://map.kakao.com/link/map/' + result[0].y + ',' + result[0].x + '" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${restaurant.RName},' + result[0].y + ',' + result[0].x + '" style="color:blue" target="_blank">길찾기</a></div>' // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
									console.log(iwContent);
								    iwPosition = new kakao.maps.LatLng(result[0].y, result[0].x); //인포윈도우 표시 위치입니다

									// 인포윈도우를 생성합니다
									var infowindow = new kakao.maps.InfoWindow({
									    position : iwPosition, 
									    content : iwContent 
									});
									  
									// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
									infowindow.open(map, marker); 
	
									// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
									map.setCenter(coords);
								}
							});
		</script>


</body>

</html>