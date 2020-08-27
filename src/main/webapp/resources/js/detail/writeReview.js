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

// input draggablefile
var count = 0;

$(function(){
    // input type="file" 태그 숨김
    $(".fileArea").hide();

    // div를 클릭하면 input type="file"이 클릭 되도록 처리
    $(".draggable_image_wrapper_pictureButton").click(function(){
        
        
        $(".fileArea").append("<input type=\"file\" id=\"coverImg_" + (count + 1) + "\" name=\"coverImg_" + (count + 1) + "\" onchange=\"loadImg(this)\" >");
        $("#coverImg_" + (count + 1)).click();
        console.log("add count : " + count);
    });
    
    $("#image-remove").click(function(){
        if(count == 1){
            console.log("remove count : " + count);
            $("#imgPrev_" + count).remove();
            $("#thumPrev_" + count).remove();
            $("#coverImg_" + count).remove();
        }else {
            console.log("remove count : " + count);
            $("#imgPrev_" + count).remove();
            $("#coverImg_" + count).remove();
        }
        count--;
    });
});

function loadImg(value){

    if(value.files && value.files[0]){

        var reader = new FileReader();

        reader.onload = function(e){

                // <li class="draggable_image_wrapper_pictureItem">
                // <button class="draggable_image_wrapper_pictureButton">
                //     <i class="draggable_image_wrapper_plus"></i>
                // </button>
                // </li>
                if(count == 0){
                    count++;
                    $(".draggable_image_wrapper_pictureItem").before("<li class=\"draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_" + count + "\"></li>");
                    $(".draggable_image_wrapper_pictureItem_" + count).append("<img id=\"imgPrev_" + count + "\"src=\"" + e.target.result + "\" class=\"draggable_image_wrapper_pictureItem_images\">");
                }else{
                    count++;
                    $(".draggable_image_wrapper_pictureItem_" + (count - 1)).after("<li class=\"draggable_image_wrapper_pictureItem draggable_image_wrapper_pictureItem_" + count + "\"></li>");
                    $(".draggable_image_wrapper_pictureItem_" + count).append("<img id=\"imgPrev_" + count + "\"src=\"" + e.target.result + "\" class=\"draggable_image_wrapper_pictureItem_images\">");
                }

            }
        }

        reader.readAsDataURL(value.files[0]);
    }