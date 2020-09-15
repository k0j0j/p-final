<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<c:set var="contextPath"
	value="${ pageContext.servletContext.contextPath }" scope="application" />
<style>
    body{
        background-image: url("${contextPath}/resources/img/main/back.jpg");
    }
    .wrap{
        width:600px;
        margin:auto;
        margin-top:4%; 
        padding:auto;
        background-color: rgba(0,0,0, 0.7);
        color:white;
    }
	ul{
        list-style: none;
        padding : 20px;
     }
       /*  ul li {
        margin: 0;
        padding: 0;
        width : 300px;
        height: 31px; 
        line-height: 35px; 
        margin-bottom: -1px; 
        background: #e0e0e0;
        text-align: center;
        float:left;
    }
    ul li a {
        text-decoration: none;
        color:black;
        display: block;
        font-size: 1.2em;
        padding: 0 20px;
    }
    ul li a:hover{
        color: black;
    } */
    .joinTab_container{
        width : 600px;
    }
    .active{
        background : rgb(255, 217, 0);
    }
    .submitBtn{
        width: 80px;
        height: 25px;
        border:0;
        outline: 0;
    }
    #submit{
        background-color:rgb(255, 217, 0);
    }
    .submit{
        margin:10px;
    }
    table{
    border:1px solid white;
    text-align:left;
    }
    td, tr{
    border:1px solid white;
    }
    /* ajax 적용 이후 */
   span.guide{
      display : none;
      font-size : 12px;
      top:12px;
      right : 10px;
   }
   span.ok {
      color: #7CFC00;
   }
   span.error {
      color: #FF4500;
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

.Review_ImageCountStateBox {
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
	  <form action="insertMenu.do" method="post" enctype="multipart/form-data">
	 <h3 align="left">맛집 이미지 등록</h3>
 	 	<div class="draggable_image_wrapper">
	                <ul class="draggable_image_wrapper_pictureList">
	                    <li class="draggable_image_wrapper_pictureItem draggable_image_wrapper_lastPictureItem">
	                        <button type="button" class="draggable_image_wrapper_pictureButton">
	                            <i class="draggable_image_wrapper_plus"></i>
	                        </button>
	                        <p class="Menu_ImageCountStateBox">
	                            <span class="Menu_CurrentImages">0</span>
	                            <span class="Menu_CountStateDivider">/</span>
	                            <span class="Menu_MaxImages">15</span>
	                        </p>
	                    </li>
	                </ul>
	                <div class="fileArea">
					<!-- 인풋태그들어올자리 -->
	            	</div>
	            </div> 
	   <h3 align="left">메뉴 등록</h3>
	   <table id="menuTable">
	   <thead>
	    <tr>
	    	<th width="200px">메뉴명</th>
	    	<th width="100px">가격</th> 
	    </tr>
	    </thead>
	    <tbody>
	    <tr>
	    </tr>
	    </tbody>
	   </table>
	   	<input type="text" name="menuName1" id="menuName1">
	   	<input type="number" name="menuPrice1" id="menuPrice1">
	   	<button type="button" class="addBtn" onclick="addMenu();">메뉴 추가</button>
	   	<button type="submit">신청하기</button>
	   </form>
	 </div>
	 
	 <script>
	 //var menu = [];
	 
	 function addMenu(){
		 
		 var menuName = $("#menuName1").val();
		 var menuPrice = $("#menuPrice1").val();
		 
		 //
		 
		// console.log(menuName);
		// console.log(menuPrice);
		 //console.log(menu);
		 
			 var innerHtml = "";
			 innerHtml += '<tr>';
			 innerHtml += '<td>'+ $("#menuName1").val()+'<input type="hidden" name="menuName" value="'+$("#menuName1").val()+'"></td>';
			 innerHtml += '<td>'+ $("#menuPrice1").val()+'원<input type="hidden" name="menuPrice" value="'+$("#menuPrice1").val()+'"></td>';
			 innerHtml += '</tr>';
			 
			 $('#menuTable > tbody:last').append(innerHtml);
	 }

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
	                    $(".Menu_CurrentImages").html(imgCount);
	                }else{
	                    count++;
	                    imgCount++;
	                    $(".draggable_image_wrapper_lastPictureItem").before("<li class=\"draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_" + count + " draggable_image_wrapper_uploadPics\"></li>");
	                    $(".draggable_image_wrapper_pictureItem_" + count).append("<img id=\"imgPrev_" + count + "\"src=\"" + e.target.result + "\" class=\"draggable_image_wrapper_pictureItem_images\">");
	                    $(".draggable_image_wrapper_pictureItem_" + count).append("<div class=\"draggable_image_wrapper_pictureItem_hover hover_mouse\"></div>");
	                    $(".Menu_CurrentImages").html(imgCount);
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
	        
	        $(".Menu_CurrentImages").html(imgCount);
	    }

	 
	 </script>
</body>
</html>