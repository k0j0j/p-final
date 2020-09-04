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
    <link href="${ contextPath }/resources/css/detailview/detail.css?ver=1" rel="stylesheet" type="text/css" media="all" />
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9244e1b3fd43e35da8f588c2bb10cca"></script>
    
    <style>
        /* ${ contextPath }/resources/img/detailview/캡처.JPG */
 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
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

            <div class="restaurant_detail">
                <header class="title"
                    style="text-align: left; border-bottom: 1px solid rgb(194, 194, 194); padding-bottom: 10px;">
                    <div class="title_wrap">
                        <span>
                            <h2>${ restaurant.rName }<span style="color: rgb(255, 183, 50); font-size: 22px;">&nbsp;★ ${ restaurant.rRating }</span>
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

                    <span class="byline cnt hit">${ restaurant.rCount }</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt review">1,445</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt favorite">525</span>
                </header>
                
                <div class="restaurant_detail_content">
	                <div class="restaurant_detail_content_item restaurant_detail_content_info">
	                    <table class="info no_menu">
	                        <tbody>
	                            <tr>
	                                <th>주소</th>
	                                <td>${ restaurant.rAddress }</td>
	                            </tr>
	                            <tr>
	                                <th>전화번호</th>
	                                <td>${ restaurant.rTel }</td>
	                            </tr>
	                            <tr>
	                                <th>가격대</th>
	                                <td>${ restaurant.rPrice }</td>
	                            </tr>
	                            <tr>
	                                <th>영업시간</th>
	                                <td>
	                                	<c:if test="${restaurant.rStartTime < 10}">
										    <c:out value= "0${ restaurant.rStartTime }:00 - " />
										</c:if>
										
										<c:if test="${restaurant.rStartTime eq 10}">
										    <c:out value= "${ restaurant.rStartTime }:00 - " />
										</c:if>
										
										<c:if test="${restaurant.rStartTime > 10}">
										    <c:out value= "${ restaurant.rStartTime }:00 - " />
										</c:if>
										
	                                	<c:if test="${restaurant.rEndTime < 10}">
										    <c:out value= "0${restaurant.rEndTime}:00" />
										</c:if>
										
										<c:if test="${restaurant.rEndTime eq 10}">
										    <c:out value= "${restaurant.rEndTime}:00" />
										</c:if>
										
										<c:if test="${restaurant.rEndTime > 10}">
										    <c:out value= "${restaurant.rEndTime}:00" />
										</c:if>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th>휴일</th>
	                                <td>${ restaurant.rRestDay }</td>
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
		
		var mapContainer = document.getElementById('map'), // 지도의 중심좌표
    	mapOption = { 
        	center: new kakao.maps.LatLng(${ restaurant.rLat }, ${ restaurant.rLng }), // 지도의 중심좌표
        	level: 3 // 지도의 확대 레벨
    	}; 

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		// 지도에 마커를 표시합니다 
		var marker = new kakao.maps.Marker({
		    map: map, 
		    position: new kakao.maps.LatLng(${ restaurant.rLat }, ${ restaurant.rLng })
		});
		
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		var content = '<div class="wrap">' + 
		            '    <div class="info">' + 
		            '        <div class="title">' + 
		            '${ restaurant.rName }' + 
		            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		            '        </div>' + 
		            '        <div class="body">' + 
		            '            <div class="desc">' + 
		            '                <div class="ellipsis">${ restaurant.rAddress }</div>' + 
		            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
		            '            </div>' + 
		            '        </div>' + 
		            '    </div>' +    
		            '</div>';
		
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: content,
		    map: map,
		    position: marker.getPosition()       
		});
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(marker, 'click', function() {
		    overlay.setMap(map);
		});
		
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		function closeOverlay() {
		    overlay.setMap(null);     
		}
		
		
		function getInfo() {
		    // 지도의 현재 중심좌표를 얻어옵니다 
		    var center = map.getCenter(); 
		    
		    // 지도의 현재 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    // 지도타입을 얻어옵니다
		    var mapTypeId = map.getMapTypeId(); 
		    
		    // 지도의 현재 영역을 얻어옵니다 
		    var bounds = map.getBounds();
		    
		    // 영역의 남서쪽 좌표를 얻어옵니다 
		    var swLatLng = bounds.getSouthWest(); 
		    
		    // 영역의 북동쪽 좌표를 얻어옵니다 
		    var neLatLng = bounds.getNorthEast(); 
		    
		    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
		    var boundsStr = bounds.toString();
		    
		    
		    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
		    message += '경도 ' + center.getLng() + ' 이고 <br>';
		    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
		    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
		    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
		    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
		    
		    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
		    console.log(message);
		}
		
		$(document).ready(function() {
			getInfo();
		});
		
		kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
		});	
		</script>


</body>

</html>