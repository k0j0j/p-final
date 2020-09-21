<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<style>
    .wrap{
        width:70%;
        margin:auto;
    }
	ul{
        list-style: none;
     }
    table{
        width: 100%;
    }
    td{
        width: 100%;
    }
    textarea{
        width:99%;
        min-height: 350px;
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
     .boardUpdate{
        width:100%;
        border: 1px solid black;
        clear: both;
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
</style>
</head>
<body>

    <div class="wrap">
        <h1 onclick="location.href ='blist.do'">커뮤니티 게시판</h1>
        <div class="boardUpdate" id="updateBoard">
        <form action="bupdate.do" method="post" enctype="multipart/form-data">
        <input type="hidden" name="page" value="${ currentPage }">
        <input type="hidden" name="bNo" value="${ board.bNo }">

               <table> 
                <tbody>
                <tr>
                    <td colspan="2">
                    <input type="hidden" name="mNo" value="${ loginUser.mNo }" size="50">
                    <input type="hidden" name="bType" value="1">
                    <c:if test="${ board.bType == 1}" >
	                   <select name="bCategory" id="bCategory">
						<option value="null" 
						<c:if test="${ board.bCategory == 'null' }">selected
						</c:if>>카테고리</option>
						<option value="서울" 
						<c:if test="${ board.bCategory == '서울' }">selected
						</c:if>>서울</option>
						<option value="경기"
						<c:if test="${ board.bCategory == '경기' }">selected
						</c:if>>경기</option>
						<option value="지방"
						<c:if test="${ board.bCategory == '지방' }">selected
						</c:if>>지방</option>
						</select>
                     </c:if>
                     <c:if test="${ board.bType == 2}" >
	                   <select name="bCategory" id="bCategory">
						<option value="null" 
						<c:if test="${ board.bCategory == 'null' }">selected
						</c:if>>카테고리</option>
						<option value="데이트" 
						<c:if test="${ board.bCategory == '데이트' }">selected
						</c:if>>데이트</option>
						<option value="먹방"
						<c:if test="${ board.bCategory == '먹방' }">selected
						</c:if>>먹방</option>
						<option value="골목식당"
						<c:if test="${ board.bCategory == '골목식당' }">selected
						</c:if>>골목식당</option>
						</select>
                     </c:if>
                   <c:if test="${ board.bType == 3 }" >
	                   <input type="hidden" name="bType" value="3">
	                    <input type="hidden" name="bCategory" value="null">
                    </c:if>
                    <input type="text" name="bTitle" id="bTitle" size="86" value="${ board.bTitle }">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <textarea name="bContent" id="bContent" style="resize: none;">${ board.bContent }</textarea>
                </td>
                </tr>
                <tr>
                    <td>
                   <!--  <td class="imageBox" colspan="2">
                        <div id="imageBox">이미지 영역</div>
                        <input type="file"></td> -->
   				<div class="draggable_image_wrapper">
	            <!-- 게시판 이미지 들어올 공간 -->
	                <ul class="draggable_image_wrapper_pictureList">
	                	<c:if test="${!empty boardFile }">
	                		<c:forEach var="boardFile" items="${ boardFile }" varStatus="status">
	                			<li class='draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_${ status.count } draggable_image_wrapper_uploadPics' data-index='${ status.index }'>
	                			<img id="imgPrev_${ status.count }" src="${contextPath}/resources/img/board/${ boardFile.streFileName }" class="draggable_image_wrapper_pictureItem_images">
	                			<div class="draggable_image_wrapper_pictureItem_hover hover_mouse_leaving"></div></li>
	                		</c:forEach>
	                	</c:if>
	                    <li class="draggable_image_wrapper_pictureItem draggable_image_wrapper_lastPictureItem">
	                        <button type="button" class="draggable_image_wrapper_pictureButton">
	                            <i class="draggable_image_wrapper_plus"></i>
	                        </button>
	                        <p class="Board_ImageCountStateBox">
	                            <span class="Board_CurrentImages">0</span>
	                            <span class="Board_CountStateDivider">/</span>
	                            <span class="Board_MaxImages">15</span>
	                        </p>
	                    </li>
	                    
	                </ul>
	            </div>
	            <div class="fileArea">
					<!-- 인풋태그들어올자리 -->
	            </div>
	            
				<div class="leavingFileArea" style="">
					
				</div>
                  </td>
                </tr>
                </tbody>
            </table>
            <div class="submit" align="center">
                <input type="reset" class="submitBtn" value="취소" onclick="history.back(-1);">
                <button id="submit" class="submitBtn" >수정하기</button>
            </div>
        </form>
        </div>
    </div>
    
    <script>

 // image counting
 var imgCount = $( '.draggable_image_wrapper_uploadPics' ).length;

 // input draggablefile
 var count = $( '.draggable_image_wrapper_uploadPics' ).length;

 // 클릭했을 때 카운트
 var clickCount = $( '.draggable_image_wrapper_uploadPics' ).length;

 $(function(){
     // input type="file" 태그 숨김
     $(".fileArea").hide();
     $(".leavingFileArea").hide();

     // div를 클릭하면 input type="file"이 클릭 되도록 처리
     $(".draggable_image_wrapper_pictureButton").click(function(){
         
         if(imgCount == 15){
             alert("사진은 최대 15장까지 첨부 가능합니다.");
             
         }else {
             $(".fileArea").append("<input type=\"file\" id=\"coverImg_" + (count + 1) + "\" name=\"coverImg_" + (count + 1) + "\" onchange=\"loadImg(this)\" >");
             $("#coverImg_" + (count + 1)).click();
             // console.log("add count : " + count);
             
         }
     });
     
 });

 function loadImg(value){

     if(value.files && value.files[0]){

         var reader = new FileReader();

         reader.onload = function(e){

                 if(count == 0){
                     count++;
                     imgCount++;
                     $(".draggable_image_wrapper_pictureItem").before("<li class=\"draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_" + count + " draggable_image_wrapper_uploadPics\"></li>");
                     $(".draggable_image_wrapper_pictureItem_" + count).append("<img id=\"imgPrev_" + count + "\"src=\"" + e.target.result + "\" class=\"draggable_image_wrapper_pictureItem_images\">");
                     $(".draggable_image_wrapper_pictureItem_" + count).append("<div class=\"draggable_image_wrapper_pictureItem_hover hover_mouse\"></div>");
                     $(".Board_CurrentImages").html(imgCount);
                 }else{
                     count++;
                     imgCount++;
                     $(".draggable_image_wrapper_lastPictureItem").before("<li class=\"draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_" + count + " draggable_image_wrapper_uploadPics\"></li>");
                     $(".draggable_image_wrapper_pictureItem_" + count).append("<img id=\"imgPrev_" + count + "\"src=\"" + e.target.result + "\" class=\"draggable_image_wrapper_pictureItem_images\">");
                     $(".draggable_image_wrapper_pictureItem_" + count).append("<div class=\"draggable_image_wrapper_pictureItem_hover hover_mouse\"></div>");
                     $(".Board_CurrentImages").html(imgCount);
                 }

                 

             }
         }

         reader.readAsDataURL(value.files[0]);
     }

 // image hover


     $(document).on('mouseenter', '.hover_mouse', function(){
         $(this).css("background-color", "rgba(85, 85, 85, 0.7)");
         $(this).append("<img class=\"draggable_image_wrapper_pictureItem_hover_close\" src=\"/honeypoint/resources/img/detailview/close.png\" onclick=\"removeImg(this)\"></img>")
     });

     $(document).on('mouseleave', '.hover_mouse', function(){
         $(this).css("background-color", "");
         $(".draggable_image_wrapper_pictureItem_hover_close").remove();
     });
     
     $(document).on('mouseenter', '.hover_mouse_leaving', function(){
         $(this).css("background-color", "rgba(85, 85, 85, 0.7)");
         $(this).append("<img class=\"draggable_image_wrapper_pictureItem_hover_close\" src=\"/honeypoint/resources/img/detailview/close.png\" onclick=\"removeLeavingImg(this)\"></img>")
     });

     $(document).on('mouseleave', '.hover_mouse_leaving', function(){
         $(this).css("background-color", "");
         $(".draggable_image_wrapper_pictureItem_hover_close").remove();
     });

     var BoardImgCount = $( '.draggable_image_wrapper_uploadPics' ).length;
 	var keyCount = $('.BoardEditor_Editor').val();
 	var list = new Array();

     <c:forEach items="${boardFile}" var="item">
     	list.push("${item.streFileName}");
     </c:forEach>
 	
 		$(document).ready(function(){
 			$('.BoardEditor__CurrentTextLength').text(keyCount.length);
 			$('.Board_CurrentImages').text(BoardImgCount);
 		});
 		
 		// image remove
 	    
 	    function removeImg(value){
 	        console.log("index : " + index + 1 - BoardImgCount);
 	        var index = $(value).parent().parent().index();
 	        $(value).parent().parent().remove();
 	        $(".fileArea input:nth-child(" + (index + 1 - BoardImgCount) + ")").remove();

 	        imgCount--;
 	        
 	        $(".Board_CurrentImages").html(imgCount);
 	    }
 		
 		// image leaving remove
 		function removeLeavingImg(value){

 	        var index = $(value).parent().parent().data("index");
 	        var bNo = ${ param.bNo };
 	        
 	        console.log(list[index]);
 	        
 	        var addHtml = '<input type="text" name="deleteNames" value="' + list[index] + '">'
 	        
 	        $(".leavingFileArea").append(addHtml);
 			
 	        $(value).parent().parent().remove();
 	        
 			BoardImgCount--;
 	        imgCount--;
 	        
 	        $(".Board_CurrentImages").html(imgCount);
 	    }
 	 
    </script>
</body>
</html>