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
    <link href="${ contextPath }/resources/css/detailview/writeReview.css?ver=3" rel="stylesheet" type="text/css" media="all" />

    

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
	<form action="updateReview.do" method="post" enctype="multipart/form-data">
	    <div class="insertReviewPage pt-3 mt-5">
	        <div class="pageWrapper">
			
	            <header class="i-review-title">
	                리뷰 수정하기
	                <%-- <span class="restaurant-name">${ param.rName }</span> --%>
	            </header>
				
	            <div class="ReviewWritingPage_Container">
	                <section class="i-review-content">
	                    <ul class="RestaurantRecommendPicker_list">
	                        <li class="RestaurantRecommendPicker_item">
	                            <button type="button" class="RestaurantRecommendPicker_button RestaurantRecommendPicker_button_recommend">
	                                <img src="${ contextPath }/resources/img/detailview/faces/restaurant_recommend_face.png" class="RestaurantRecommendPicker_image RestaurantRecommendPicker_image_recommend"></img>
	                                <span class="RestaurantRecommendPicker_likeLabel RestaurantRecommendPicker_likeLabel_recommend">맛있다</span>
	                            </button>
	                        </li>
	                        <li class="RestaurantRecommendPicker_item">
	                            <button type="button" class="RestaurantRecommendPicker_button RestaurantRecommendPicker_button_ok">
	                                <img src="${ contextPath }/resources/img/detailview/faces/restaurant_ok_face.png" class="RestaurantRecommendPicker_image RestaurantRecommendPicker_image_ok"></img>
	                                <span class="RestaurantRecommendPicker_likeLabel RestaurantRecommendPicker_likeLabel_ok">괜찮다</span>
	                            </button>
	                        </li>
	                        <li class="RestaurantRecommendPicker_item">
	                            <button type="button" class="RestaurantRecommendPicker_button RestaurantRecommendPicker_button_unRecommend">
	                                <img src="${ contextPath }/resources/img/detailview/faces/restaurant_unRecommend_face.png" class="RestaurantRecommendPicker_image RestaurantRecommendPicker_image_unRecommend"></img>
	                                <span class="RestaurantRecommendPicker_likeLabel RestaurantRecommendPicker_likeLabel_unRecommend">보통</span>
	                            </button>
	                        </li>
	                    </ul>
	                    <div class="i-review-item-editor">
	                        <textarea name="revCn" class="ReviewEditor_Editor" maxlength="10000" style="overflow: hidden; overflow-wrap: break-word; height: 150px;" placeholder="${ loginUser.mNickname }님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!">${ review.revCn }</textarea>
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
	            <!-- 리뷰 이미지 들어올 공간 -->
	                <ul class="draggable_image_wrapper_pictureList">
	                	<c:if test="${!empty img }">
	                		<c:forEach var="list" items="${ img }" varStatus="status">
	                			<li class='draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_${ status.count } draggable_image_wrapper_uploadPics' data-index='${ status.index }'>
	                			<img id="imgPrev_${ status.count }" src="${contextPath}/resources/img/review/${ list.atchmnflCours }" class="draggable_image_wrapper_pictureItem_images">
	                			<div class="draggable_image_wrapper_pictureItem_hover hover_mouse_leaving"></div></li>
	                		</c:forEach>
	                	</c:if>
	                    <li class="draggable_image_wrapper_pictureItem draggable_image_wrapper_lastPictureItem">
	                        <button type="button" class="draggable_image_wrapper_pictureButton">
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
	            
	            <scirpt>
	            
	            </scirpt>
	            
	            <div class="control-buttons">
	            	<a href="<c:url value="detail.do">
								<c:param name="rNo" value="${ param.rNo }" />
							</c:url>">
	                <button type="button" class="btn btn-warning" style="width:100px; height:50px;">취소</button>
	                </a>
	                <button type="submit" class="btn btn-warning Review_WriteButton" style="width:100px; height:50px;" disabled>작성</button>
	            </div>
	            
	            <script>
	            $(document).ready(function(){
	            	if(${ review.score } == 1){
	            		$(".RestaurantRecommendPicker_likeLabel_recommend").css("color", "#ff7100");
	                    $(".RestaurantRecommendPicker_image_recommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_recommend_active_face.png");
	            	}else if(${ review.score } == 2){
	            		$(".RestaurantRecommendPicker_likeLabel_ok").css("color", "#ff7100");
	                    $(".RestaurantRecommendPicker_image_ok").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_ok_active_face.png");
	            	}else {
	            		$(".RestaurantRecommendPicker_likeLabel_unRecommend").css("color", "#ff7100");
	                    $(".RestaurantRecommendPicker_image_unRecommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_unRecommend_active_face.png");
	            	}
	            });
	            </script>
	
	            <div class="fileArea">
					<!-- 인풋태그들어올자리 -->
	            </div>
	            
				<div class="leavingFileArea" style="">
					
				</div>
				
				<!-- 리뷰 번호 넘겨주는 인풋 -->
				<input type="hidden" name="revNo" value="${ param.revNo }">
				<!-- 로그인 유저 데이터 -->
	            <input type="hidden" name="mNo" value="${ loginUser.mNo }">
	            <!-- 맛집 번호 넘겨주는 인풋 -->
	            <input type="hidden" name="rNo" value="${ param.rNo }">
	            <!-- 평가 넘겨주는 인풋 -->
	            <input type="hidden" name="score" id="score_input" value="1">
				
	        </div>
	        
	    </div>
    </form>
    <script type="text/javascript" src="${ contextPath }/resources/js/detail/updateReview.js?ver=3"></script>
	<jsp:include page="../common/footer.jsp" />
	<script>
	
	var reviewImgCount = $( '.draggable_image_wrapper_uploadPics' ).length;
	var keyCount = $('.ReviewEditor_Editor').val();
	var list = new Array();

    <c:forEach items="${img}" var="item">
    	list.push("${item.atchmnflCours}");
    </c:forEach>
	
		$(document).ready(function(){
			$('.ReviewEditor__CurrentTextLength').text(keyCount.length);
			$('.Review_CurrentImages').text(reviewImgCount);
		});
		
		// image remove
	    
	    function removeImg(value){
	        console.log("index : " + index + 1 - reviewImgCount);
	        var index = $(value).parent().parent().index();
	        $(value).parent().parent().remove();
	        $(".fileArea input:nth-child(" + (index + 1 - reviewImgCount) + ")").remove();

	        imgCount--;
	        
	        $(".Review_CurrentImages").html(imgCount);
	    }
		
		// image leaving remove
		function removeLeavingImg(value){

	        var index = $(value).parent().parent().data("index");
	        var rNo = ${ param.rNo };
	        var revNo = ${ param.revNo };
	        
	        console.log(list[index]);
	        
	        var addHtml = '<input type="text" name="deleteNames" value="' + list[index] + '">'
	        
	        $(".leavingFileArea").append(addHtml);
			
	        $(value).parent().parent().remove();
	        
			reviewImgCount--;
	        imgCount--;
	        
	        $(".Review_CurrentImages").html(imgCount);
	    }
	</script>

</body>
</html>