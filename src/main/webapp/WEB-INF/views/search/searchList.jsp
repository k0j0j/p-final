<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link rel="icon" type="image/x-icon"
	href="${contextPath}/resources/img/main/favicon.png" />
<title>HONEYPOINT, 나의 맛집 로드</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/vendor/main/bootstrap/css/bootstrap.css">



<!-- Custom styles for this template -->
<style>
body {
	padding-top: 56px;
	margin: 0;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
	overflow: auto;
}

.fadein {
	-webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
	-moz-animation: fadein 2s; /* Firefox < 16 */
	-ms-animation: fadein 2s; /* Internet Explorer */
	-o-animation: fadein 2s; /* Opera < 12.1 */
	animation: fadein 2s;
}



Strong {
	font-size: 25px;
	color: #2483ff;
}

.search-result-text1 {
	margin: 0px;
	font-size: 25px;
	padding: 0px;
	white-space: nowrap;
}

.search-result-text2 {
	margin: 0px;
	color: #66666e
}

img {
	width:300px;
	height:300px;
}
</style>
</head>

<body>

	<jsp:include page="../common/menubar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="mt-4">
			<span class="search-result-text1"><strong>'${ search.searchValue }'</strong>
				맛집 검색 결과</span>
			<!-- Filter -->
			<button type="button" class="btn btn-primary float-right"
				data-toggle="modal" data-target="#exampleModal">Filter!</button>


			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Filter!</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<form name="searchForm" method="get" action="search.do">
						<input type="hidden" name="searchValue" value="${ search.searchValue }">

							<div class="modal-body">
								<div class="card card-body">
									 	<label class="m-auto">가격대</label>

											<div class="form-group w-100">
												<input type="range" class="form-control-range"
													id="formControlRange1" name="price" min="0"
													max="100000" step="10000" value="${search.price}"
													> <span id="range1"></span>
											</div>
											
											<!-- search.searchValue로 하지말기!!! -->
									<br> <label class="m-auto">맛집종류&nbsp;</label>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
									
										<label class="btn btn-secondary active" id="category"> <input
											type="radio" name="category" id="option1" value="한식"
											<c:if test="${search.category == '한식'}">selected
											</c:if>>
											
											한식
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option2" value="중식"
											<c:if test="${search.category == '중식'}">selected
											</c:if>>
											
											중식
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option3" value="일식"
											<c:if test="${search.category == '일식'}">selected
											</c:if>>
											
											일식
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option4" value="양식"
											<c:if test="${search.category == '양식'}">selected
											</c:if>>
											
											양식
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option5" value="세계음식"
											<c:if test="${search.category == '세계음식'}">selected
											</c:if>>
											
											세계음식
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option6" value="뷔페"
											<c:if test="${search.category == '뷔페'}">selected
											</c:if>>
											
											뷔페
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option7" value="주점"
											<c:if test="${search.category == '주점'}">selected
											</c:if>>
											주점
										</label> <label class="btn btn-secondary" id="category"> <input
											type="radio" name="category" id="option8" value="카페"
											<c:if test="${search.category == '카페'}">selected
											</c:if>>
											카페
										</label>
									</div>
									<label class="m-auto">주차여부</label>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary active" id="parking"> <input
											type="radio" name="parking" id="option9" value="Y"
											<c:if test="${search.category == 'Y'}">selected
											</c:if>>
											주차가능
										</label> <label class="btn btn-secondary" id="parking"> <input
											type="radio" name="parking" id="option10" value="N"
											<c:if test="${search.category == 'N'}">selected
											</c:if>>
											주차불가
										</label>
									</div>
									
								</div>
							</div>
							<div class="modal-footer">
								<div class="form-row align-items-center">
									<div class="col-auto my-1">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
										<button type="submit" class="btn btn-primary">SEARCH</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div></div>
		<div>
			<p class="search-result-text2">${ listCount }개의검색결과</p>
			<c:forEach items="${ imgList }" var="img">
				<a href="${ rdetail }"><img
					src="${contextPath}/resources/img/main/cafe2.jpeg"
					class="card-img-top"></a>
			</c:forEach>
		</div>

		<br> <br>

	

		<!-- Content Row -->
		<div class="container">
			<div class="row add">
				<c:forEach var="r" items="${ list }">
					<c:url var="rdetail" value="detail.do">
						<c:param name="rNo" value="${ r.rNo }" />
					</c:url>
					<div class="col-md-4 mb-5">
						<div OnClick="${ rdetail }" style="cursor: pointer;"
							class="card h-100">
							<a href="${ rdetail }"><img
								src="${contextPath}/resources/img/detailview/${r.plist[0].streFileName}" 
								class="card-img-top"></a>
							<div class="card-body">
								<h5 class="card-title">${ r.rName }</h5>
								<p1>${ r.rType }</p1>
								<br> <small>${ r.rAddress }</small>

							</div>

						</div>
					</div>

				</c:forEach>

			</div>


		</div>



		
	
			</div>
	

		<jsp:include page="../common/footer.jsp" />

		<!-- Bootstrap core JavaScript -->
		<script
			src="${contextPath}/resources/vendor/main/jquery/jquery.min.js"></script>


		<!-- 페이지 무한 스크롤 ajax, js -->

				<!-- 페이지 무한 스크롤 ajax, js -->
		
		<script>
		
		var loading = false;    //중복실행여부 확인 변수
	    var startPage = 1;   // 불러올 첫번째 페이지 변수
	  
	    var pageControll = 0;
	    var searchValue = '${search.searchValue}';
	    
	    

	    function next_load()
	    {
	    	startPage += 1;
	    	console.log('동작');
	             $.ajax({
	                    url:"${contextPath}/searchscroll.do",
	                    type:"POST",
	                    data : {"page":startPage, "searchValue": searchValue},
	                    dataType : "json", // ? json?? 
	                    success: function(data)
	                    
	                    {
	                    	console.log(data);
	                    	console.log(data.list);
	                    	
	                            if(data != "") { // 불러올 데이터가 있다면?!
	                            // 화면상에 추가할 값 
	                                var str = "";
	                                for(var i in data) {
	                                	console.log(data[i]);
	                                	console.log(data[i].plist[0].streFileName);
		                                str += "<div class=" + "'col-md-4 mb-5'" +  "'>"
										+  "<div OnClick='${ rdetail }' style=" + "'cursor: pointer'" + " class=" + "'card h-100'" + "'>"
										+  "<a href='${ rdetail }'>"
										+  "<img src='${ contextPath }/resources/img/detailview/" + data[i].plist[0].streFileName + "' class=" + "'card-img-top'" +"'>" + "</a>"
										+  "<div class=" + "'card-body'" + "'>"
										+  "<h5 class=" + "'card-title'" + "'>" + data[i].rName + "</h5>"
										+  "<p1>" + data[i].rType + "</p1>"
										+  "<br>"
										+  "<small>" + data[i].rAddress + "</small>"
										+ "</div>"
										+ "</div>"
										+ "</div>";                                 

	                                }
		          					console.log(str);
									$(".add").append(str);
 	                                startPage++;
	                            
	                            loading = false;    //실행 가능 상태로 변경
	                            }
	                            else {
	            	                alert('더 이상 불러올 데이터가 없습니다.');  
									loading = true;
		                            
	                            }
	                         
	                    },
	                    error : function(e){
							alert("error code : " + e.status + "\n"
									+ "message " + e.responseText);
						}
	             }); 
	                    
	    
	    }
	    // js
	    $(window).scroll(function(){
	        if($(window).scrollTop()+200>=$(document).height() - $(window).height())
	        {
	            if(!loading)    //실행 가능 상태라면?
	            {
	                loading = true; //실행 불가능 상태로 변경
	                next_load(); 
	            }
	            /* else            //실행 불가능 상태라면?
	            {
	                alert('다음페이지를 로딩중입니다.');  
	            } */
	        }
	    });  
		
		</script>
		<script>
			$(function() {
				// 레인지바에서 선택한 값 표시
				$("#range1").text($("#formControlRange1").val() + "원 대");
				$("#formControlRange1").change(function() {
					$("#range1").text($(this).val() + "원 대");
				});
			});
		</script>


</body>

</html>

