<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
	
<style>
    .wrap{
        width:700px;
        margin:auto;
    }
     ul{
        margin: 0;
        padding:0;
        list-style: none;
        text-align: center;
     }
     ul li{
        margin: 0;
        padding:0;
        width: 80px;
        height: 25px;
        line-height: 25px;
        background-color: white;
        float:left;
     }
    li.current{
        background : rgb(255, 217, 0);
        color: white;
    }
    table{
        width: 100%;
    }
    td{
        width: 100%;
    }
    #title{
        height: 25px;
    }
    #category{
        height: 30px;
    }
    .imageBox{
        border-top: 1px solid lightgrey;
        border-bottom: 1px solid lightgrey;
        padding:10px;
    }
    #imageBox{
        width: 60%;
        border:1px solid black;
        display: inline-block;
    }
     .boardinsert{
        display: none;
        width:100%;
        border: 1px solid black;
        clear: both;
    }
    .boardinsert.current{
	display: block;
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
    background-image: url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/plus_icon.svg);
    background-size: cover;
}
table{
	border : 1px solid black;
	padding : 10px;
}
td{
	padding-bottom : 5px;
	padding-left : 5px;
}

.boardImgFile{
	box-sizing: border-box;
	width: 100%;
	text-align : center;
}
.boardImgFile img{
	max-width: 100%;
  	height: auto;
  	margin-top: 10px;
}
#title{
	font-weight : 600;
}
#nickname{
	font-size:14px;
	color:grey;
	border-bottom: 1px solid lightgrey;
}
#btnList{
	float:right;
	margin: 5px;
}
#contentArea{
	padding : 10px;
}
#bContent{
	margin-top:10px;
}
#boardBtm{
	border-bottom: 1px solid lightgrey;
}
#commentAreaTop{
	border-bottom: 1px solid lightgrey;
	font-weight : 500;
	padding:5px;
}
#commentInsert textarea{
	width: 88%;
    min-height: 50px;
}
</style>
</head>
<body>

    <div class="wrap">
        <h1 onclick="location.href ='blist.do'">커뮤니티 게시판</h1>
        <ul class="boardTabs">
            <li class="" data-tab="locBoard" value="1">지역별</li>
            <li class="" data-tab="topBoard" value="2">주제별</li>
            <li class="" data-tab="freeBoard" value="3">자유게시판</li>
        </ul>
        <div class="boardDetail" id="Board">
        <table id="boardTable">
         <tr>
            <td id="title">
            <c:if test="${ board.bCategory eq 'null' }">
				&nbsp;
				</c:if>
				<c:if test="${ board.bCategory != 'null' }">
				[${ board.bCategory }] &nbsp;
				</c:if>
            ${ board.bTitle }
            </td>
         </tr>
         <tr>
            <td id="nickname">${ board.mNickname }&nbsp;&nbsp;&nbsp;
             <jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
				 <fmt:formatDate value="${ board.bEnrollDate }" pattern="yy.MM.dd HH:mm"/>
             &nbsp;&nbsp;&nbsp;조회수:${ board.bCount }</td>
         </tr>
         <tr>
            <td id="contentArea">
            <div class="boardImgFile">
        <c:forEach var="img" items="${ boardFile }" varStatus="vs">
    	
    		<c:if test="${ boardFile eq null }">
    			&nbsp;
    		</c:if>
    		<c:if test="${ vs.index <= 15 }">
		        <img src="${ contextPath }/resources/img/board/${img.streFileName}" />
		    </c:if>
		</c:forEach>
		</div>
			<div id="bContent">
            ${ board.bContent }
            </div>
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
               <c:if test="${ loginUser.id eq board.mId }">
                  <button onclick="location.href='${ bupview }'">수정하기</button>
                  <button onclick="location.href='${ bdelete }'">삭제하기</button>
               </c:if>
               </div>
            </td>
         </tr>
         <tr>
         	<td id="commentAreaTop">댓글 [1]
         	</td>
         </tr>
         <tr>
         <td id="commentInsert">
         <textarea id="cmtContent" placeholder="로그인 후 이용하실 수 있습니다."></textarea>
         <button id="cmtSubmit">댓글등록</button>
         </td>
         </tr>
      </table>
      
      <table id="commentTable">
      
      </table>
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
   
   
/*    $(function(){
       getReplyList();   // 페이지 로드 시 댓글 리스트 불러오기
       
       
       // 댓글이 입력되는 내용을 실시간으로 반영해서 보여주고 싶다면
       setInterval(function(){
          getReplyList();
       }, 10000);
    
    // 댓글 등록하는 이벤트
    $("#cmtSubmit").on("click", function(){
       var rContent = $("#rContent").val();
       var refBid = ${ board.bId };
       
       $.ajax({
          url: "addReply.do",
          data : {rContent:rContent, refBid:refBid},
          type : "post",
          success : function(data){
             if(data =="success"){
                // 1. 등록 성공 시 다시 댓글 리스트 불러오기
                getReplyList();
                // 2. textarea의 글 없애기
                $("#rContent").val("");
             }
          },
          error : function(e){
             console.log(e);
          }
       });
    });
    
    });
    
    // 댓글 리스트를 불러오는 함수
    function getReplyList(){
       var bId = ${ board.bId };
       
       $.ajax({
          url : "rList.do",
          data : {bId:bId},
          dataType : "json",
          success : function(data){
             console.log(data);
             
             $tableBody = $("#replyTable tbody");
             $tableBody.html("");
             
             $("#rCount").text("댓글("+data.length+")");
             
             if(data.length >0){ // 댓글이 있는경우
                for(var i in data){
                   var $tr = $("<tr>");
                   
                   var $rWriter = $("<td width='100'>").text(data[i].rWriter);
                   var $rContent = $("<td>").text(data[i].rContent);
                   var $rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
                   
                   $tr.append($rWriter);
                   $tr.append($rContent);
                   $tr.append($rCreateDate);
                   
                   $tableBody.append($tr);
                }
             }else{   // 댓글이 없는 경우
                var $tr = $("<tr>");
                var $rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
                
                $tr.append($rContent);
                $tableBody.append($tr);
             }
          },
          error : function(e){
             console.log(e);
          }
       });
    } */
   
    </script>
</body>
</html>