<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<!-- CSS only -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<style>
body{
padding-top:80px;
font-size:14px !important;
}
.wrap {
	width: 70%;
	margin: auto;
	padding-bottom:30px;
}

ul {
	margin: 0;
	padding: 0;
	list-style: none;
	text-align: center;
}

ul li {
	margin: 0;
	padding: 0;
	width: 80px;
	height: 25px;
	line-height: 25px;
	background-color: white;
	float: left;
}

li.current {
	background: rgb(255, 217, 0);
	color: white;
}

table {
	width: 100%;
}

#title {
	height: 25px;
}

#category {
	height: 30px;
}

.imageBox {
	border-top: 1px solid lightgrey;
	border-bottom: 1px solid lightgrey;
	padding: 10px;
}

#imageBox {
	width: 60%;
	border: 1px solid black;
	display: inline-block;
}

.draggable_image_wrapper {
	position: relative;
	/* border: 1px solid red; */
	margin-bottom: 10px;
}

.draggable_image_wrapper_pictureList {
	display: flex;
	flex-wrap: wrap;
	min-height: 100px;
}

.draggable_image_wrapper_pictureItem {
	/* position: absolute;
    left: 0px;
    top: 0px; */
	margin-right: 9px;
	margin-bottom: 9px;
}

.draggable_image_wrapper_lastPictureItem {
	position: relative;
}

.Board_ImageCountStateBox {
	position: absolute;
	/* top: 90px;  메뉴바 푸터 넣기전*/
	top: 60px;
	left: 52px;
	font-size: 12px;
	line-height: normal;
	color: #7F7F7F;
	width: 50px;
}

.draggable_image_wrapper_pictureItem_hover {
	position: relative;
	width: 89px;
	height: 89px;
	cursor: pointer;
}

.draggable_image_wrapper_pictureItem_hover_close {
	width: 14px;
	height: 14px;
	margin-left: 5px;
}

.draggable_image_wrapper_pictureButton {
	width: 89px;
	height: 89px;
	line-height: 89px;
	text-align: center;
	border: 1px dashed rgb(202, 202, 202);
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: center;
}

.draggable_image_wrapper_pictureItem_images {
	position: absolute;
	width: 89px;
	height: 89px;
	line-height: 89px;
	text-align: center;
	cursor: pointer;
	/* display: flex;
    align-items: center;
    justify-content: center; */
}

.draggable_image_wrapper_plus {
	width: 27px;
	height: 27px;
	background-image:
		url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/plus_icon.svg);
	background-size: cover;
}
.boardDetail{
	width:100%;
	border: 1px solid black;
	padding:10px;
	margin:0;
	margin-bottom:50px;
	float:left;
	
}
button{
  	color:black;
  	background-color:white;
  	border:1px solid black;
  }

#boardTable {
	
	padding: 20px;
}

#boardTable>td {
	padding-bottom: 5px;
	padding-left: 5px;
}

.boardImgFile {
	box-sizing: border-box;
	width: 100%;
	text-align: center;
}

.boardImgFile img {
	max-width: 100%;
	height: auto;
	padding-top: 10px;
}

#title {
	font-weight: 600;
}

#nickname {
	font-size: 14px;
	color: grey;
	border-bottom: 1px solid lightgrey;
}

.cmtdate{
	font-size: 14px;
	color: grey;
	}
#btnList {
	float: right;
	margin: 5px;
}

#contentArea {
	padding: 10px;
}

#bContent {
	margin-top: 10px;
}

#boardBtm {
	border-bottom: 1px solid lightgrey;
}

#commentAreaTop {
	border-bottom: 1px solid lightgrey;
	font-weight: 500;
	padding: 5px;
}

#commentInsert textarea {
	min-height: 50px;
}
#commentInsert{
	padding:10px;
}

#cmtContent {
	width: 90%;
}
.cmtTr td{
	border-bottom: 1px solid lightgrey;
	border-top: 1px solid lightgrey;
	padding : 10px;
}
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<div class="wrap">
		<br>
		<h1 onclick="location.href ='blist.do'">커뮤니티 게시판</h1>
		<br>
		<ul class="boardTabs">
			<li class="" data-tab="locBoard" value="1">지역별</li>
			<li class="" data-tab="topBoard" value="2">주제별</li>
			<li class="" data-tab="freeBoard" value="3">자유게시판</li>
		</ul>
		<div class="boardDetail" id="Board">
			<table id="boardTable">
				<tr>
					<td id="title"><c:if test="${ board.bCategory eq 'null' }">
				&nbsp;
				</c:if> <c:if test="${ board.bCategory != 'null' }">
				<font color="red">[${ board.bCategory }]</font> &nbsp;
				</c:if> ${ board.bTitle }</td>
				</tr>
				<tr>
					<td id="nickname">${ board.mNickname }&nbsp;<span class="bar"
						aria-hidden="true">|</span>&nbsp; <jsp:useBean id="today"
							class="java.util.Date"></jsp:useBean> <fmt:formatDate
							value="${ board.bEnrollDate }" pattern="yy.MM.dd HH:mm" /> &nbsp;
						<span class="bar" aria-hidden="true">|</span> &nbsp; 조회수:${ board.bCount }
					</td>
				</tr>
				<tr>
					<td id="contentArea">
						<div class="boardImgFile">
							<c:forEach var="img" items="${ boardFile }" varStatus="vs">

								<c:if test="${ boardFile eq null }">
    			&nbsp;
    		</c:if>
								<c:if test="${ vs.index <= 15 }">
									<img
										src="${ contextPath }/resources/img/board/${img.streFileName}" />
								</c:if>
							</c:forEach>
						</div>
						<div id="bContent">${ board.bContent }</div>
					</td>
				</tr>
				<%-- <tr>
            <td colspan="3"><c:if test="${ !empty boardFile.originFileName }">
                  <a
                     href="${ contextPath }/resources/buploadFiles/${ boardFile.streFileName }"
                     download>${ boardFile.originFileName }</a>
               </c:if></td>
         </tr> --%>
				<tr>
					<td id="boardBtm">
						<div id="btnList">
							<c:url var="bupview" value="bupView.do">
								<c:param name="bNo" value="${ board.bNo }" />
								<c:param name="page" value="${ currentPage }" />
							</c:url>
							<c:url var="bdelete" value="bdelete.do">
								<c:param name="bNo" value="${ board.bNo }" />
							</c:url>
							<c:url var="blist" value="blist.do">
								<c:param name="page" value="${ currentPage }" />
							</c:url>
							<button onclick="location.href='${ blist }'">목록으로</button>
							<c:if test="${ loginUser.mNo eq board.mNo }">
								<button onclick="location.href='${ bupview }'">수정하기</button>
								<button onclick="delBoard();">삭제하기</button>
							</c:if>
						</div>
					</td>
				</tr>
				<tr id="cmtCount">
					<td id="cmtAreaTop"></td>
				</tr>
				<tr>
					<td id="cmtInsert"><textarea id="cmtContent" name="cmtContent"
							placeholder="로그인 후 이용하실 수 있습니다."></textarea>
						<button id="cmtSubmit">댓글등록</button></td>
				</tr>
			</table>
			<c:url var="cdelete" value="cdelete.do">
				<c:param name="bNo" value="${ board.bNo }" />
			</c:url>
			<c:url var="cupview" value="cupView.do">
				<c:param name="bNo" value="${ board.bNo }" />
			</c:url>
			<table id="cmtTable">

			</table>
		</div>
	</div>
		<%-- 댓글 수정 모달 --%>
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">댓글 수정</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea id="updateCmt" cols="55" rows="3"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" data-dismiss="modal" id="updateCmtBtn">확인</button>
								</div>
							</div>
						</div>
					</div>

		<%-- 신고용 모달창 --%>
			<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel2">신고하기</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<textarea id="updateCmt" cols="55" rows="3"></textarea>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" data-dismiss="modal" id="insertReport">확인</button>
								</div>
							</div>
						</div>
					</div>
			<script>
	var bType = ${bType};
    
    window.onload  = function() {
	   if(bType == 1){
		   $('ul.boardTabs li').removeClass('current');
		   $('ul.boardTabs li:nth-child(1)').addClass('current');
	   }else if(bType == 2){
		   $('ul.boardTabs li').removeClass('current');
		   $('ul.boardTabs li:nth-child(2)').addClass('current');
	   }else if(bType == 3){
		   $('ul.boardTabs li').removeClass('current');
		   $('ul.boardTabs li:nth-child(3)').addClass('current');
	   }
   };
   
   $(function(){
       getCmtList();   // 페이지 로드 시 댓글 리스트 불러오기
       
       <%--
       // 댓글이 입력되는 내용을 실시간으로 반영해서 보여주고 싶다면
       setInterval(function(){
          getCmtList();
       }, 10000); --%>
    
    // 댓글 등록하는 이벤트
    $("#cmtSubmit").on("click", function(){
       var cmtContent = $("#cmtContent").val();
       var bNo = ${ board.bNo };
       
       $.ajax({
          url: "addCmt.do",
          data : {cmtContent:cmtContent, bNo:bNo},
          type : "post",
          success : function(data){
             if(data =="success"){
                // 1. 등록 성공 시 다시 댓글 리스트 불러오기
                getCmtList();
                // 2. textarea의 글 없애기
                $("#cmtContent").val("");
             }
          },
          error : function(e){
             console.log(e);
          }
       });
    });
   });

   function delBoard(){
	 if(confirm("게시글을 삭제하시겠습니까?") == true) {
		location.href='${ bdelete }';
	 }
   };
   	
    // 댓글 리스트를 불러오는 함수
    function getCmtList(){
       var bNo = ${ board.bNo };
       
       $.ajax({
          url : "cmtList.do",
          data : {bNo:bNo},
          dataType : "json",
          success : function(data){
             
             $tableBody = $("#cmtTable");
             $tableBody.html("");
             $tableCmt = $("#cmtTable");
             var cmtcount = "";
             	cmtcount += "댓글 <font color='red'>["+data.length+"]</font>"
             $("#cmtAreaTop").html(cmtcount);
             
             
             if(data.length >0){ // 댓글이 있는경우
                for(var i in data){
                   var $tr = $("<tr class='cmtTr'>");
                   
                   var $mNo = $("<td width=80>").text(data[i].mNickname);
                   
                   var cno =""
                   cno += '<input type="hidden" class="cmtNo" value="' + data[i].cmtNo + '">';
                   
                   var $cmtNo = $("<td width=1>").html(cno);
                   
                   var $cmtContent = $("<td>").text(data[i].cmtContent);
                   var $cmtEnrollDate = $("<td  class='cmtdate' width=80>").text(data[i].cmtEnrollDate);
                   var str = "";
                   if(data[i].mNo == '${loginUser.mNo}'){
             		str += '<button onclick="upCmt(this);" data-toggle="modal" data-target="#exampleModal" style="background-color:white"  class="cupBtn" data-cmtno="' + data[i].cmtNo + '">수정</button>';
         		    str += '<button onclick="delCmt(this);" class="cdelBtn" data-cmtno="' + data[i].cmtNo + '">삭제</button>';
                   }
      			   var $cmtUp = $("<td>").html(str);
                  
                   $tr.append($mNo);
                   $tr.append($cmtNo);
                   $tr.append($cmtContent);
                   $tr.append($cmtEnrollDate);
                   $tr.append($cmtUp);
                   
                   $tableCmt.append($tr);
                }
             }else{   // 댓글이 없는 경우
                var $tr = $("<tr>");
                var $cmtContent = $("<td colspan='4'>").text("등록된 댓글이 없습니다.");
                
                
                $tr.append($cmtContent);
                $tableCmt.append($tr);
             }
          },
          error : function(e){
             console.log(e);
          }
       });
    } 
    
       
  	function delCmt(obj){
  		var bNo = ${ board.bNo };
  	    var cmtNo = obj.dataset.cmtno;
  	  if(confirm("댓글을 삭제하시겠습니까?") == true) {
  	    $.ajax({
  	       url: "cdelete.do",
  	       data : {bNo:bNo, cmtNo:cmtNo},
  	       type : "post",
  	       success : function(data){
  	          if(data =="success"){
  	             // 1. 등록 성공 시 다시 댓글 리스트 불러오기
  	             getCmtList();
  	          }
  	       },
  	       error : function(e){
  	          console.log(e);
  	       }
  	});
  	  }
  	}
  	
	function upCmt(obj){
  		var bNo = ${ board.bNo };
  	    var cmtNo = obj.dataset.cmtno;
  	    
	$("#updateCmtBtn").click(function(){
		var cmtContent = $("#updateCmt").val();
		
		$.ajax({
	  	       url: "cupdate.do",
	  	       data : {cmtNo:cmtNo, cmtContent:cmtContent},
	  	       type : "post",
	  	       success : function(data){
	  	          if(data =="success"){
	  	             // 1. 등록 성공 시 다시 댓글 리스트 불러오기
	  	             getCmtList();
	  	          }
	  	       },
	  	       error : function(e){
	  	          console.log(e);
	  	       }
	  	});
	});
  	}
	
	<%-- 신고용 함수 
	function upCmt(obj){
  		var bNo = ${ board.bNo };
  	    var cmtNo = obj.dataset.cmtno;
  	    
	$("#updateCmtBtn").click(function(){
		var cmtContent = $("#updateCmt").val();
		
		$.ajax({
	  	       url: "cupdate.do",
	  	       data : {cmtNo:cmtNo, cmtContent:cmtContent},
	  	       type : "post",
	  	       success : function(data){
	  	          if(data =="success"){
	  	             // 1. 등록 성공 시 다시 댓글 리스트 불러오기
	  	             getCmtList();
	  	          }
	  	       },
	  	       error : function(e){
	  	          console.log(e);
	  	       }
	  	});
	});
  	} --%>
  	
  	 $(function(){
     	$("ul.boardTabs li").on('click',function(){
     			var bType = $(this).val();  //버튼이 클릭 되었을 때 그 버튼의 value를 var btype로 가져와서	
     			$.ajax({
     				 url : 'bTab.do', // 이 주소로 
     	              type : "post", // 포스트 방식으로 보내는데
     	              cache: false,
     	              data : {"bType" : bType}, // btype를 btype로 명명하여 보내겠다
     	              success : function(data){ 
     	                 console.log(data);
     	                 
     	                 $('body').html(data); //성공할시에 body부분에 data라는 html문장들을 다 적용시키겠다
     	                 
     	                 if(bType == 1){
     	          		   $('ul.boardTabs li').removeClass('current');
     	          		   $('ul.boardTabs li:nth-child(1)').addClass('current');
     	          		 	$('.boardList').removeClass('current');
     	          		 	$('#locBoard').addClass('current');
     	          	   }else if(bType == 2){
     	          		   $('ul.boardTabs li').removeClass('current');
     	          		   $('ul.boardTabs li:nth-child(2)').addClass('current');
     	          		 	$('.boardList').removeClass('current');
  	          		 		$('#topBoard').addClass('current');
     	          	   }else if(bType == 3){
     	          		   $('ul.boardTabs li').removeClass('current');
     	          		   $('ul.boardTabs li:nth-child(3)').addClass('current');
     	          			 $('.boardList').removeClass('current');
  	          		 		$('#freeBoard').addClass('current');
     	          	   }
      	                
     	              },
     	              error : function(data){
     	            	 alert('error');
     	               
     	              }//error
     			})//ajax
     		});//click
     });//ready
  	
    </script>
</body>
</html>