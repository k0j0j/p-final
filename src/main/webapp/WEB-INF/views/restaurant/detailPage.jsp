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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a9244e1b3fd43e35da8f588c2bb10cca&libraries=services"></script>
    
    <style>

    </style>
</head>

<body>
<jsp:include page="../common/menubar.jsp" />
	<%-- <c:set var="loginUser" value="20" scope="session" /> --%>

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

							<a href="<c:url value="reviewWrite.do">
								<c:param name="rNo" value="${ restaurant.RNo }" />
								<c:param name="rName" value="${ restaurant.RName }" />
							</c:url>">
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
	                                <td>${restaurant.RStartTime} ~ ${restaurant.REndTime}
	                                	<%-- <c:if test="${restaurant.RStartTime < 10}">
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
										</c:if> --%>
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
                            <button id="FilterButton_all" class="RestaurantReviewList_FilterButton" style="color:#ff7100">전체 (${ reviewCount.allReviewCount })</button>
                        </li>
                        <li class="RestaurantReviewList_FilterItem">
                            <button id="FilterButton_recommend" class="RestaurantReviewList_FilterButton">맛있다 (${ reviewCount.recommendReviewCount })</button>
                        </li>
                        <li class="RestaurantReviewList_FilterItem">
                            <button id="FilterButton_ok" class="RestaurantReviewList_FilterButton">괜찮다 (${ reviewCount.okReviewCount })</button>
                        </li>
                        <li class="RestaurantReviewList_FilterItem">
                            <button id="FilterButton_unRecommend" class="RestaurantReviewList_FilterButton">별로 (${ reviewCount.unRecommendReviewCount })</button>
                        </li>
                    </ul>
                </header>
                <ul class="RestaurantReviewList_ReviewList">
                    
                </ul>
                
                <div class="more_btn_wrap" style="display: flex; justify-content: center; padding: 5px;">
                    <button class="more_btn btn btn-outline-warning" onclick="moreList();">더보기</button>
                </div>
                
            </section>
            
        </div>
    </div>
	
	<script>
		var filterCheck = 0; // all
		var addListHtml = "";
		var startNum;
		var rNo = ${ restaurant.RNo };
		
		moreList(); //함수 호출
		
		function moreList() {
			var height = $(document).scrollTop();
			
			var rNo = ${ restaurant.RNo };
			if($(".RestaurantReviewList_ReviewItem").length == 0){
				startNum = 1;
			}

		     $.ajax({
		        url : "moreReview.do",
		        type : "post",
		        dataType : "json",
		        async:false,
		        data : {"startNum" : startNum, "rNo" : rNo, "filterCheck" : filterCheck},
		        
		        success : function(data) {
		        	//console.log(data.reviewList);
		        	
		            if(data.reviewList.length < 5){
		                $(".more_btn").css("display", "none");
		            }else {
		            	$(".more_btn").css("display", "");
		            }
		            if(data.reviewList.length > 0){
		            	
		            	addListHtml = "";
		            	
		            	
		                for(var i=0; i<data.reviewList.length;i++) {
		                	
		                		
			                	//console.log(data.reviewList[i].mStrePf);
			                	
			                	addListHtml += '<li class="RestaurantReviewItem RestaurantReviewList_ReviewItem">';
			                    addListHtml += '<div class="RestaurantReviewItem_User">';
			                    addListHtml += '<div class="RestaurantReviewItem_UserPictureWrap">';
			                    if(data.reviewList[i].mStrePf == undefined){
			                    	addListHtml += '<image class="RestaurantReviewItem_UserPicture" src="' + '${ contextPath }' + '/resources/img/member/' + 'basicProfile.jpg' + '"></image>';
			                    }else {
			                    	addListHtml += '<image class="RestaurantReviewItem_UserPicture" src="' + '${ contextPath }' + '/resources/img/member/' + data.reviewList[i].mStrePf + '"></image>';	
			                    }
			                    
			                    addListHtml += '</div>';
			                    addListHtml += '<span class="RestaurantReviewItem_UserNickName">' + data.reviewList[i].gnrlMember.MNickname + '</span>';
			                    addListHtml += '<ul class="RestaurantReviewItem_UserStat">';
			                    addListHtml += '<li class="RestaurantReviewItem_UserLevel">Level ' + data.reviewList[i].gnrlMember.MGrad + '</li>';
			                    
			                    /* if(data.reviewList[i].MNo == ${ sessionScope.loginUser.mNo }){ */
			                    	addListHtml += '<li class="RestaurantReviewItem_ButtonWrap">';
			                    	addListHtml += '<button class="RestaurantReviewItem_Button">수정</button>';
			                    	addListHtml += '<button class="RestaurantReviewItem_Button">삭제</button></li>';
			                    /* } */
			                    addListHtml += '</ul></div>';
			                    addListHtml += '<div class="RestaurantReviewItem_Content">';
			                    addListHtml += '<div class="RestaurantReviewItem__ReviewTextWrap">';
			                    addListHtml += '<div class="review_date">' + data.reviewList[i].revDate + '</div>';
			                    addListHtml += data.reviewList[i].revCn + '</div>'
			                    // 리뷰 이미지 들어갈 부분
			                    
			                    addListHtml += '<ul class="RestaurantReviewItem__PictureList">';
			                    
			                    var revNo = data.reviewList[i].revNo;
			                    
				                    $.ajax({
				        		        url : "moreReviewImg.do",
				        		        type : "post",
				        		        dataType : "json",
				        		        async:false,
				        		        data : {"rNo" : rNo, "revNo" : revNo},
				        		        
				        		        success : function(data) {
				        		        	console.log(data.reviewImgList);
				        		        	
				        		        	for(var j=0; j<data.reviewImgList.length; j++) {
				        		        		
				        		        		if(j < 3) {
				        		        			
				        		        			addListHtml += '<li class="RestaurantReviewItem__PictureItem">';
						        		        	addListHtml += '<a href="${ contextPath }/resources/img/review/' + data.reviewImgList[j].atchmnflCours + '" class="fresco RestaurantReviewItem__PictureButton" data-fresco-group="reviewImgGroup' +  data.reviewImgList[j].revNo + '_' + i + '">';
						        		        	addListHtml += '<img src="${ contextPath }/resources/img/review/' + data.reviewImgList[j].atchmnflCours + '">';
						        		        	addListHtml += '</a>';
						        		        	addListHtml += '</li>';
				        		        			
				        		        		}else if(j == 3){
				        		        			
				        		        			addListHtml += '<li class="RestaurantReviewItem__PictureItem">';
						        		        	addListHtml += '<a href="${ contextPath }/resources/img/review/' + data.reviewImgList[j].atchmnflCours + '" class="fresco RestaurantReviewItem__PictureButton" data-fresco-group="reviewImgGroup' +  data.reviewImgList[j].revNo + '_' + i + '">';
						        		        	addListHtml += '<img src="${ contextPath }/resources/img/review/' + data.reviewImgList[j].atchmnflCours + '">';
						        		        	
						        		        	if(data.reviewImgList.length != 4){
						        		        	
						        		        		addListHtml += '<div class="RestaurantReviewItem__PictureDeem">+' + (data.reviewImgList.length-4) + '</div>'	
						        		        	
						        		        	}
						        		        	
						        		        	addListHtml += '</a>';
						        		        	addListHtml += '</li>';
				        		        			
				        		        		}else {
				        		        			
				        		        			addListHtml += '<li class="RestaurantReviewItem__PictureItem" style="display: none">';
						        		        	addListHtml += '<a href="${ contextPath }/resources/img/review/' + data.reviewImgList[j].atchmnflCours + '" class="fresco RestaurantReviewItem__PictureButton" data-fresco-group="reviewImgGroup' +  data.reviewImgList[j].revNo + '_' + i + '">';
						        		        	addListHtml += '<img src="${ contextPath }/resources/img/review/' + data.reviewImgList[j].atchmnflCours + '">';
						        		        	addListHtml += '</a>';
						        		        	addListHtml += '</li>';	
						        		        	
				        		        		}
					        		        	
				        		        		
				        		        	
				        		        	}
				        		        	
				        		        }
				                    });
			                    
			                    addListHtml += '</ul>'
			                    
			                    addListHtml += '</div>';
			                    addListHtml += '<div class="RestaurantReviewItem_RecommendIconWrap">';
								if(data.reviewList[i].score == 1){
									addListHtml += '<image src="${ contextPath}/resources/img/detailview/faces/restaurant_recommend_active_face.png" class="RestaurantReviewItem_RecommendIcon"></image>';
				                    addListHtml += '<span class="RestaurantReviewItem_RatingText">맛있다</span>';	
								}else if(data.reviewList[i].score == 2){
									addListHtml += '<image src="${ contextPath}/resources/img/detailview/faces/restaurant_ok_active_face.png" class="RestaurantReviewItem_RecommendIcon"></image>';
				                    addListHtml += '<span class="RestaurantReviewItem_RatingText">괜찮다</span>';
								}else {
									addListHtml += '<image src="${ contextPath}/resources/img/detailview/faces/restaurant_unRecommend_active_face.png" class="RestaurantReviewItem_RecommendIcon"></image>';
				                    addListHtml += '<span class="RestaurantReviewItem_RatingText">별로</span>';
								}
			                    
			                    addListHtml += '</div>';
			                    addListHtml += '</li>';
		                    
		                	
		                }
		                
		                $(".RestaurantReviewList_ReviewList").append(addListHtml);
		                $(document).scrollTop(height);	
		                
		                startNum++;
		                
		            }
		        }
		    });
		 
		} 
	</script>
	
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
	    	
	    }); 
	
	    $('.menu_share_button').on('click', function(event) {
	        $('.share_modal_container').css("opacity", "1");
	        $('.share_modal_container').css("display", "flex");
	        
	    });
	
	    $('.share_modal_close').on('click', function(event) {
	        $('.share_modal_container').css("opacity", "0");
	        $('.share_modal_container').css("display", "none");
	        
	    });
	
	    $('.RestaurantReviewList_FilterButton').on('click', function(event) {
		    $('.RestaurantReviewList_FilterButton').css("color", "");
		    event.target.style.color = "#ff7100";
		    
		    console.log(event.target);
		    if(event.target === document.getElementById("FilterButton_all")){
		    	startNum = 1;
		    	filterCheck = 0;
		    	$('.RestaurantReviewList_ReviewList li').remove();
		    	moreList();
		    }else if(event.target === document.getElementById("FilterButton_recommend")){
		    	startNum = 1;
		    	filterCheck = 1;
		    	$('.RestaurantReviewList_ReviewList li').remove();
		    	moreList();
		    }else if(event.target === document.getElementById("FilterButton_ok")){
		    	startNum = 1;
		    	filterCheck = 2;
		    	$('.RestaurantReviewList_ReviewList li').remove();
		    	moreList();
		    }else {
		    	startNum = 1;
		    	filterCheck = 3;
		    	$('.RestaurantReviewList_ReviewList li').remove();
		    	moreList();
		    }
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