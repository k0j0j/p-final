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
	margin:0;
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select:none;
	overflow:auto;
}

.fadein
{
	-webkit-animation: fadein 2s; /* Safari, Chrome and Opera > 12.1 */
	-moz-animation: fadein 2s; /* Firefox < 16 */
	-ms-animation: fadein 2s; /* Internet Explorer */
	-o-animation: fadein 2s; /* Opera < 12.1 */
	animation: fadein 2s;
}
@keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Firefox < 16 */
@-moz-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Safari, Chrome and Opera > 12.1 */
@-webkit-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Internet Explorer */
@-ms-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }
/* Opera < 12.1 */
@-o-keyframes fadein { from { opacity: 0; } to { opacity: 1; } }


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
</style>
</head>

<body>

	<jsp:include page="../common/menubar.jsp" />

	<!-- Page Content -->
	<div class="container">
		<div class="mt-4">
			<span class="search-result-text1"><strong>'${ search.searchValue }'</strong> 맛집 검색
				결과</span>
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
						<form id="form1" method="post" action="search.do">
							<input type="hidden" value="1" name="currentPage"> <input
								type="hidden" value="2" name="searchType">
							<div class="modal-body">
								<div class="card card-body">
									<label class="m-auto">가격&nbsp;</label>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">

										<label class="btn btn-secondary active" id="price"> <input
											type="radio" name="price" id="option1" value="만원이하">
											만원이상
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="price" id="option2" value="1만원대">
											1만원대
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="price" id="option3" value="2만원대">
											2만원대
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="price" id="option3" value="3만원대">
											3만원대
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="price" id="option3" value="기타"> 기타
										</label>
									</div>
									<br> <label class="m-auto">맛집종류&nbsp;</label>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">

										<label class="btn btn-secondary active" id="price"> <input
											type="radio" name="category" id="option4" value="한식">
											한식
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option5" value="중식">
											중식
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option6" value="일식">
											일식
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option7" value="양식">
											양식
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option8" value="세계음식">
											세계음식
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option9" value="뷔페">
											뷔페
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option10" value="주점">
											주점
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="category" id="option11" value="카페">
											카페
										</label>
									</div>
									<label class="m-auto">주차여부</label>
									<div class="btn-group btn-group-toggle" data-toggle="buttons">
										<label class="btn btn-secondary active" id="price"> <input
											type="radio" name="parking" id="option12" value="Y">
											주차가능
										</label> <label class="btn btn-secondary" id="price"> <input
											type="radio" name="parking" id="option13" value="N">
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
			<p class="search-result-text2">${ listCount}개의 검색결과</p>
			<c:forEach items="${ imgList }" var="img">
				<a href="${ rdetail }"><img
					src="${contextPath}/resources/img/main/cafe2.jpeg"
					class="card-img-top"></a>
			</c:forEach>
		</div>

		<br>
		<br>



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
								src="${contextPath}/resources/img/main/${r.plist[0].originFileName}"
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
			
			
			
					 	<!-- 페이징 처리 -->
	 
				<!-- [이전] -->
				<!-- 
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="search.do">
						<c:param name="searchValue" value="${ search.searchValue }"/>					 
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>


				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="search.do">
						<c:param name="searchValue" value="${ search.searchValue }"/>					 
						<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>


				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="search.do">
											<c:param name="searchValue" value="${ search.searchValue }"/>					 
					
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>				
	
			</div>
			-->
			<!-- /.col-md-4 -->

		<!-- /.row -->

		<!-- /.container -->

		<jsp:include page="../common/footer.jsp" />

		<!-- Bootstrap core JavaScript -->
		<script
			src="${contextPath}/resources/vendor/main/jquery/jquery.min.js"></script>
		<script
			src="${contextPath}/resources/vendor/main/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		
		
		
		
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
	                                	console.log(data[i].plist[0].originFileName);
		                                str += "<div class=" + "'col-md-4 mb-5'" +  "'>"
										+  "<div OnClick='${ rdetail }' style=" + "'cursor: pointer'" + " class=" + "'card h-100'" + "'>"
										+  "<a href='${ rdetail }'>"
										+  "<img src='${ contextPath }/resources/img/main/" + data[i].plist[0].originFileName + "' class=" + "'card-img-top'" +"'>" + "</a>"
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
		
		
		
			
		<!-- <script>
		$(window).scroll(function(){
			var lastScrollTop = 0;
			var easeEffect = 'easeInQuint';
			
			// 1. 스크롤 이벤트 발생
			$(window).scroll(function(){ // ① 스크롤 이벤트 최초 발생
				
				var currentScrollTop = $(window).scrollTop();
				
				/*  
					=================	다운 스크롤인 상태	================
				*/
				if( currentScrollTop - lastScrollTop &gt; 0 ){
					// down-scroll : 현재 게시글 다음의 글을 불러온다.
					console.log("down-scroll");
					
					// 2. 현재 스크롤의 top 좌표가  &gt; (게시글을 불러온 화면 height - 윈도우창의 height) 되는 순간
					if ($(window).scrollTop() &gt;= ($(document).height() - $(window).height()) ){ //② 현재스크롤의 위치가 화면의 보이는 위치보다 크다면
			            
						// 3. class가 scrolling인 것의 요소 중 마지막인 요소를 선택한 다음 그것의 data-bno속성 값을 받아온다.
						//		즉, 현재 뿌려진 게시글의 마지막 bno값을 읽어오는 것이다.( 이 다음의 게시글들을 가져오기 위해 필요한 데이터이다.)
						
					var lastrno = $(".scrolling:last").attr("data-rno");
					
					// 4. ajax를 이용하여 현재 뿌려진 게시글의 마지막 bno를 서버로 보내어 그 다음 20개의 게시물 데이터를 받아온다. 
					$.ajax({
						type : 'post',	// 요청 method 방식 
						url : 'infiniteScrollDown',// 요청할 서버의 url
						headers : { 
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},
						dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
						data : JSON.stringify({ // 서버로 보낼 데이터 명시 
							rNo : lastrno
						}),
						success : function(data){// ajax 가 성공했을시에 수행될 function이다. 이 function의 파라미터는 서버로 부터 return받은 데이터이다.
							
							var str = "";
				});
			}
		});
		
		
		// 4. ajax
		$.ajax({
			type : 'post',
			url : 'search.do',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			data : JSON.stringify({
				rNo : lastrno
			}),
			success : function(data){
				var str = "";
				
				if(data != "") {
					$(data).each(
						function(){
							console.log(this);
							str += "<div class=" + "'col-md-4 mb-5 scrolling'" + " data-rno='" + this.rNo +"'>"
								+  "<div OnClick=" + rdetail + " style=" + "'cursor: pointer'" + " class=" + "'card h-100'" + "'>"
								+  "<a href=" + rdetail + "'>"
								+  "<img src=" + contextPath/resources/img/main/this.plist[0].originFileName + " class=" + "'card-img-top'" +"'>" + "</a>"
								+  "<div class=" + "'card-body'" + "'>"
								+  "<h5 class=" + "'card-title'" + "'>" + this.rName + "</h5>"
								+  "<p1>" + this.rType + "</p1>"
								+  "<br>"
								+  "<small>" + this.rAddress + "</small>"
								+ "</div>"
								+ "</div>"
								+ "</div>";
								
						});
					$(".row").empty();
					$(".scrollLoaction").after(str);
					
			}
				else {
					alert("더 불러올 데이터가 없습니다.");	
				}
				}
		});
		</script>
		-->
		<!-- <script>
		var loading = false;
		var startPage = 1;
		
		function next_load()
		{
		var searchValue = ${ search.searchValue };
		$.ajax({
			type:"GET",
			url:"search.do",
			data : {'page':page, 'restaurant' : searchValue},
			dataType: "text",
			success : function(data) {
				 
					console.log(page+' page load');
					
					for(var x=1; x<10; x++){
						var str = "";
						str += "<div class=" + "'col-md-4 mb-5 scrolling'" + " data-rno='" + data.rNo +"'>"
						+  "<div OnClick=" + rdetail + " style=" + "'cursor: pointer'" + " class=" + "'card h-100'" + "'>"
						+  "<a href=" + rdetail + "'>"
						+  "<img src=" + '${contextPath}' + '/resources/img/main/' + data.plist[0].originFileName + " class=" + "'card-img-top'" +"'>" + "</a>"
						+  "<div class=" + "'card-body'" + "'>"
						+  "<h5 class=" + "'card-title'" + "'>" + this.rName + "</h5>"
						+  "<p1>" + data.rType + "</p1>"
						+  "<br>"
						+  "<small>" + data.rAddress + "</small>"
						+ "</div>"
						+ "</div>"
						+ "</div>";
						
					}
					
				 }
				 }
			}
			});
		}
		</script> -->
</body>

</html>

