// autosize
autosize($('textarea'));


// counting
$('.ReviewEditor_Editor').keyup(function (e) {
    var content = $(this).val();
    $('.ReviewEditor__CurrentTextLength').html(content.length); //글자수 실시간 카운팅

    if (content.length > 4000) {
        alert("최대 4000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 4000));
        $('.ReviewEditor__CurrentTextLength').html("4000");
    }
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
                    $(".Review_CurrentImages").html(imgCount);
                }else{
                    count++;
                    imgCount++;
                    $(".draggable_image_wrapper_lastPictureItem").before("<li class=\"draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_" + count + " draggable_image_wrapper_uploadPics\"></li>");
                    $(".draggable_image_wrapper_pictureItem_" + count).append("<img id=\"imgPrev_" + count + "\"src=\"" + e.target.result + "\" class=\"draggable_image_wrapper_pictureItem_images\">");
                    $(".draggable_image_wrapper_pictureItem_" + count).append("<div class=\"draggable_image_wrapper_pictureItem_hover hover_mouse\"></div>");
                    $(".Review_CurrentImages").html(imgCount);
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
        
        $(".Review_CurrentImages").html(imgCount);
    }

// recommend choice

    $(function(){
        $(".RestaurantRecommendPicker_button_ok").click(function() {
            $(".RestaurantRecommendPicker_likeLabel_ok").css("color", "#ff7100");
            $(".RestaurantRecommendPicker_image_ok").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_ok_active_face.png");
            $(".RestaurantRecommendPicker_likeLabel_recommend").css("color", "");
            $(".RestaurantRecommendPicker_image_recommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_recommend_face.png");
            $(".RestaurantRecommendPicker_likeLabel_unRecommend").css("color", "");
            $(".RestaurantRecommendPicker_image_unRecommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_unRecommend_face.png");
          });

        $(".RestaurantRecommendPicker_button_recommend").click(function() {
            $(".RestaurantRecommendPicker_likeLabel_ok").css("color", "");
            $(".RestaurantRecommendPicker_image_ok").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_ok_face.png");
            $(".RestaurantRecommendPicker_likeLabel_unRecommend").css("color", "");
            $(".RestaurantRecommendPicker_image_unRecommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_unRecommend_face.png");
            $(".RestaurantRecommendPicker_likeLabel_recommend").css("color", "#ff7100");
            $(".RestaurantRecommendPicker_image_recommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_recommend_active_face.png");
          });

        $(".RestaurantRecommendPicker_button_unRecommend").click(function() {
            $(".RestaurantRecommendPicker_likeLabel_recommend").css("color", "");
            $(".RestaurantRecommendPicker_image_recommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_recommend_face.png");
            $(".RestaurantRecommendPicker_likeLabel_ok").css("color", "");
            $(".RestaurantRecommendPicker_image_ok").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_ok_face.png");
            $(".RestaurantRecommendPicker_likeLabel_unRecommend").css("color", "#ff7100");
            $(".RestaurantRecommendPicker_image_unRecommend").attr("src","/honeypoint/resources/img/detailview/faces/restaurant_unRecommend_active_face.png");
          });
    });