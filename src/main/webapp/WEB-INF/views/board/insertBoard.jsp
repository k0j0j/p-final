<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div class="boardinsert" id="locBoard">
        <form action="binsert.do" method="post" enctype="multipart/form-data">
            <table>
                <tbody>
                <tr>
                    <td colspan="2">
                    <input type="hidden" name="mNo" value="${ loginUser.mNo }" size="50">
                    <input type="hidden" name="bType" value="1">
                   <select name="bCategory" id="bCategory">
                    <option value="null">카테고리</option>
                    <option value="서울">서울</option>
                    </select>
                    <input type="text" name="bTitle" id="bTitle" size="86" placeholder="제목을 입력 해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <textarea name="bContent" id="bContent" style="resize: none;"></textarea>
                </td>
                </tr>
                <tr>
                    <td>
                   <!--  <td class="imageBox" colspan="2">
                        <div id="imageBox">이미지 영역</div>
                        <input type="file"></td> -->
                  <div class="draggable_image_wrapper">
	                <ul class="draggable_image_wrapper_pictureList">
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
	                <div class="fileArea">
					<!-- 인풋태그들어올자리 -->
	            	</div>
	            </div> 
                  </td>
                </tr>
                </tbody>
            </table>
            <div class="submit" align="center">
                <input type="reset" class="submitBtn" value="취소">
                <button id="submit" class="submitBtn" >작성하기</button>
            </div>
        </form>
        </div>
        
         <div class="boardinsert" id="topBoard">
        <form action="binsert.do" method="post" enctype="multipart/form-data">
            <table>
                <tbody>
                <tr>
                    <td colspan="2">
                    <input type="hidden" name="mNo" value="${ loginUser.mNo }" size="50">
                    <input type="hidden" name="bType" value="2">
                    <select name="bCategory" id="bCategory">
                    <option value="null">카테고리</option>
                    <option value="서울">서울</option>
                    </select>
                    <input type="text" name="bTitle" id="bTitle" size="86" placeholder="제목을 입력 해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <textarea name="bContent" id="bContent" style="resize: none;"></textarea>
                </td>
                </tr>
                <tr>
                <td>
                   <!--  <td class="imageBox" colspan="2">
                        <div id="imageBox">이미지 영역</div>
                        <input type="file"></td> -->
                  <div class="draggable_image_wrapper">
	                <ul class="draggable_image_wrapper_pictureList">
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
	                <div class="fileArea">
					<!-- 인풋태그들어올자리 -->
	            	</div>
	            </div> 
                  </td>
                </tr>
                </tbody>
            </table>
            <div class="submit" align="center">
                <input type="reset" class="submitBtn" value="취소">
                <button id="submit" class="submitBtn" >작성하기</button>
            </div>
        </form>
        </div>
        
         <div class="boardinsert" id="freeBoard">
            <form action="binsert.do" method="post" enctype="multipart/form-data">
            <table>
                <tbody>
                <tr>
                    <td colspan="2">
                    <input type="hidden" name="mNo" value="${ loginUser.mNo }" size="50">
                    <input type="hidden" name="bType" value="3">
                    <input type="hidden" name="bCategory" id="bCategory" value="null">
                    <input type="text" name="bTitle" id="bTitle" placeholder="제목을 입력 해 주세요.">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                    <textarea name="bContent" id="bContent" style="resize: none;"></textarea>
                </td>
                </tr>
                <tr>
					<td>
                   <!--  <td class="imageBox" colspan="2">
                        <div id="imageBox">이미지 영역</div>
                        <input type="file"></td> -->
                  <div class="draggable_image_wrapper">
	                <ul class="draggable_image_wrapper_pictureList">
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
	                <div class="fileArea">
					<!-- 인풋태그들어올자리 -->
	            	</div>
	            </div> 
                  </td>
                </tr>
                </tbody>
            </table>
            <div class="submit" align="center">
                <input type="reset" class="submitBtn" value="취소">
                <button id="submit" class="submitBtn" >작성하기</button>
            </div>
        </form>
        </div>
    </div>
    
    <script>
    var bType = ${bType};
    
    window.onload  = function() {
	   if(bType == 1){
		   $('ul.boardTabs li').removeClass('current');
		   $('ul.boardTabs li:nth-child(1)').addClass('current');
		   $('.boardinsert').removeClass('current');
 		   $('#locBoard').addClass('current');
	   }else if(bType == 2){
		   $('ul.boardTabs li').removeClass('current');
		   $('ul.boardTabs li:nth-child(2)').addClass('current');
		   $('.boardinsert').removeClass('current');
 		   $('#topBoard').addClass('current');
	   }else if(bType == 3){
		   $('ul.boardTabs li').removeClass('current');
		   $('ul.boardTabs li:nth-child(3)').addClass('current');
		   $('.boardinsert').removeClass('current');
 		   $('#freeBoard').addClass('current');
	   }
   };
      
     $(function(){
    	  $('ul.boardTabs li').on('click',function(){
    		  var bType= $(this).val();
      		 if(bType == 1){
        		   $('ul.boardTabs li').removeClass('current');
        		   $('ul.boardTabs li:nth-child(1)').addClass('current');
        		   $('.boardinsert').removeClass('current');
         		   $('#locBoard').addClass('current');
        	   }else if(bType == 2){
        		   $('ul.boardTabs li').removeClass('current');
        		   $('ul.boardTabs li:nth-child(2)').addClass('current');
        		   $('.boardinsert').removeClass('current');
         		   $('#topBoard').addClass('current');
        	   }else if(bType == 3){
        		   $('ul.boardTabs li').removeClass('current');
        		   $('ul.boardTabs li:nth-child(3)').addClass('current');
        		   $('.boardinsert').removeClass('current');
         		   $('#freeBoard').addClass('current');
        	   }
             	});
             });

  // image counting
 	var imgCount = 0;

 	// input draggablefile
 	var count = 0;

 	// 클릭했을 때 카운트
 	var clickCount = 0;

 	$(function(){
 	    // input type="file" 태그 숨김
 	    $(".fileArea").hide();

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

 	// image remove
 	    

 	    function removeImg(value){
 	        
 	        var index = $(value).parent().parent().index();
 	        $(value).parent().parent().remove();
 	        $(".fileArea input:nth-child(" + (index + 1) + ")").remove();

 	        imgCount--;
 	        
 	        $(".Board_CurrentImages").html(imgCount);
 	    }

 	 
    </script>
</body>
</html>