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
    <link href="${ contextPath }/resources/css/editorRecommend/editorDetail.css">
    
</head>
<style>

</style>
<body>
    <div class="editor-list-page">
        <section class="title-wrap">
            <p class="title">에디터 추천 맛집</p>
        </section>

        <ul class="card-list">
            <li class="card-item">
                <figure class="card-image" style="background-image: url(images/카페1.jpg);">
                     <img src="images/카페1.jpg" alt="에디터추맛1">
                </figure>
                <div class="card-desc">
                    <div class="card-desc-title">
                        <figure class="card-desc-profile">
                            <img src="images/프사1.jpg">
                        </figure>
                        <div class="card-desc-title-item">
                            <div class="card-desc-title-name">김영진</div>
                            <div class="stars">
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even"></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-desc-content">
                        구성도 다양하고 정말 배부르게 먹었어요. 점심에는 식사로 오니까 부족함없이 챙기려고 해주시고 정말 친절하셨어요~! 서비스 만족도 최상입니다. 다만 샤리는 좀 더 간이 되면 좋았을 거 같아요. 맛있었던 카이센동
                    </div>
                </div>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(images/맛잇는거1.jpg);">
                     <img src="images/맛잇는거1.jpg" alt="에디터추맛2">
                </figure>
                <div class="card-desc">
                    <div class="card-desc-title">
                        <figure class="card-desc-profile">
                            <img src="images/프사1.jpg">
                        </figure>
                        <div class="card-desc-title-item">
                            <div class="card-desc-title-name">김영진</div>
                            <div class="stars">
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even"></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-desc-content">
                        구성도 다양하고 정말 배부르게 먹었어요. 점심에는 식사로 오니까 부족함없이 챙기려고 해주시고 정말 친절하셨어요~! 서비스 만족도 최상입니다. 다만 샤리는 좀 더 간이 되면 좋았을 거 같아요. 맛있었던 카이센동
                    </div>
                </div>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(images/14144.PNG);">
                     <img src="images/14144.PNG" alt="에디터추맛3">
                </figure>
                <div class="card-desc">
                    <div class="card-desc-title">
                        <figure class="card-desc-profile">
                            <img src="images/프사1.jpg">
                        </figure>
                        <div class="card-desc-title-item">
                            <div class="card-desc-title-name">김영진</div>
                            <div class="stars">
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even"></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-desc-content">
                        구성도 다양하고 정말 배부르게 먹었어요. 점심에는 식사로 오니까 부족함없이 챙기려고 해주시고 정말 친절하셨어요~! 서비스 만족도 최상입니다. 다만 샤리는 좀 더 간이 되면 좋았을 거 같아요. 맛있었던 카이센동
                    </div>
                </div>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(images/13.png);">
                     <img src="images/13.png" alt="에디터추맛4">
                </figure>
                <div class="card-desc">
                    <div class="card-desc-title">
                        <figure class="card-desc-profile">
                            <img src="images/프사1.jpg">
                        </figure>
                        <div class="card-desc-title-item">
                            <div class="card-desc-title-name">김영진</div>
                            <div class="stars">
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even"></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-desc-content">
                        구성도 다양하고 정말 배부르게 먹었어요. 점심에는 식사로 오니까 부족함없이 챙기려고 해주시고 정말 친절하셨어요~! 서비스 만족도 최상입니다. 다만 샤리는 좀 더 간이 되면 좋았을 거 같아요. 맛있었던 카이센동
                    </div>
                </div>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(images/캡처2.JPG);">
                     <img src="images/캡처2.JPG" alt="에디터추맛5">
                </figure>
                <div class="card-desc">
                    <div class="card-desc-title">
                        <figure class="card-desc-profile">
                            <img src="images/프사1.jpg">
                        </figure>
                        <div class="card-desc-title-item">
                            <div class="card-desc-title-name">김영진</div>
                            <div class="stars">
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even"></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-desc-content">
                        구성도 다양하고 정말 배부르게 먹었어요. 점심에는 식사로 오니까 부족함없이 챙기려고 해주시고 정말 친절하셨어요~! 서비스 만족도 최상입니다. 다만 샤리는 좀 더 간이 되면 좋았을 거 같아요. 맛있었던 카이센동
                    </div>
                </div>
            </li>
            <li class="card-item">
                <figure class="card-image" style="background-image: url(images/캡처3.JPG);">
                     <img src="images/캡처3.jpg" alt="에디터추맛6">
                </figure>
                <div class="card-desc">
                    <div class="card-desc-title">
                        <figure class="card-desc-profile">
                            <img src="images/프사1.jpg">
                        </figure>
                        <div class="card-desc-title-item">
                            <div class="card-desc-title-name">김영진</div>
                            <div class="stars">
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even active"></span>
                                <span class="star odd active"></span>
                                <span class="star even"></span>
                            </div>
                        </div>
                        
                    </div>
                    <div class="card-desc-content">
                        구성도 다양하고 정말 배부르게 먹었어요. 점심에는 식사로 오니까 부족함없이 챙기려고 해주시고 정말 친절하셨어요~! 서비스 만족도 최상입니다. 다만 샤리는 좀 더 간이 되면 좋았을 거 같아요. 맛있었던 카이센동
                    </div>
                </div>
            </li>
        </ul>
    </div>











    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>


</html>