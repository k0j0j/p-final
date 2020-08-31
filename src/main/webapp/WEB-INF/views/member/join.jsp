<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    body{
        background-image: url("${contextPath}/resources/img/main/back.jpg");
    }
    .wrap{
        width:600px;
        margin:auto;
        margin-top:4%; 
        padding:auto;
        text-align: center;
        background-color: rgba(0,0,0, 0.7);
        color:white;
    }
    ul{
        margin: 0;
        padding:0;
        list-style: none;
        height: 32px; /*--Set height of tabs--*/
        text-align: center;
     }
    ul li {
        margin: 0;
        padding: 0;
        width : 300px;
        height: 31px; /*--Subtract 1px from the height of the unordered list--*/
        line-height: 35px; /*--Vertically aligns the text within the tab--*/
        margin-bottom: -1px; /*--Pull the list item down 1px--*/
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
    }
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
    padding-left: 80px;
    }
</style>
</head>
<body>
    <div class="wrap" align="center">
        <ul class="joinTabs">
            <li><a href="#tab1">일반회원</a></li>
            <li><a href="#tab2">맛집회원</a></li>
        </ul>
        <div class="joinTab_container" >
            <div id="tab1" class="joinTab_content" align="center">
            <form method="post" id="memberJoinForm"
        onsubmit="return validate();">
        <br>
        <table width="500" cellspacing="5">
            <tr>
                <td width="200">* 아이디</td>
                <td width="400">
                    <input type="text" name="id" id="userId">
                    <!-- ajax 이후 적용 -->
                    <!-- <span class="guide ok">이 아이디는 사용 가능합니다.</span>
                    <span class="guide error">이 아이디는 사용할 수 없습니다.</span> -->
                    <input type="hidden" name="idDuplicateCheck" 
                    id="idDuplicateCheck" value="0">
                </td>
            </tr>
            <tr>
                <td>* 비밀번호</td> 
                <td><input type="password" name="pwd"></td>
            </tr>
            <tr>
                <td>* 비밀번호확인</td>
                <td><input type="password" name="pwd2"></td>
            </tr>
            <tr>
                <td>* 이름</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <input type="text" size="6" name="year">년 &nbsp;
                    <input type="number" min="1" max="12" name="month">월 &nbsp;
                    <input type="number" min="1" max="31" name="day">일
                </td>				
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input type="text" name="nickname"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="email"></td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td><input type="tel" name="phone"></td>
            </tr>
            <tr>
                <td>우편번호</td>
                <td>
                    <input type="text" name="post" class="postcodify_postcode5" size="6">
                    <!-- form 태그 안의 button은 default로 submit이라는 속성을 가져
                    우편번호 관련 팝업이 뜨는 것이 아니라 form이 submit 되어 minsert.do라는 요청이 가는 현상
                    button 태그에 type="button"을 기재함 -->
                    <button type="button" id="postcodify_search_button">검색</button>
                </td>
            </tr>
            <tr>
                <td>도로명 주소</td>
                <td><input type="text" name="address1" class="postcodify_address"></td>
            </tr>
            <tr>
                <td>상세 주소</td>
                <td><input type="text" name="address2" class="postcodify_details"></td>
            </tr>
            </table>
                </form>
            </div>

            <div id="tab2" class="joinTab_content">
            <form method="post" id="RestaurantJoinForm"
                onsubmit="return validate();">
                <br>
                <table width="500" cellspacing="5">
                    <tr>
                        <td width="200">* 아이디</td>
                        <td width="400">
                            <input type="text" name="id" id="userId">
                            <!-- ajax 이후 적용 -->
                            <!-- <span class="guide ok">이 아이디는 사용 가능합니다.</span>
                            <span class="guide error">이 아이디는 사용할 수 없습니다.</span> -->
                            <input type="hidden" name="idDuplicateCheck" 
                            id="idDuplicateCheck" value="0">
                        </td>
                    </tr>
                    <tr>
                        <td>* 비밀번호</td> 
                        <td><input type="password" name="pwd"></td>
                    </tr>
                    <tr>
                        <td>* 비밀번호확인</td>
                        <td><input type="password" name="pwd2"></td>
                    </tr>
                    <tr>
                        <td>* 업체명</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" name="post" class="postcodify_postcode5" size="6">
                            <!-- form 태그 안의 button은 default로 submit이라는 속성을 가져
                            우편번호 관련 팝업이 뜨는 것이 아니라 form이 submit 되어 minsert.do라는 요청이 가는 현상
                            button 태그에 type="button"을 기재함 -->
                            <button type="button" id="postcodify_search_button">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>도로명 주소</td>
                        <td><input type="text" name="address1" class="postcodify_address"></td>
                    </tr>
                    <tr>
                        <td>상세 주소</td>
                        <td><input type="text" name="address2" class="postcodify_details"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="tel" name="phone"></td>
                    </tr>
                    <tr>
                        <td>* 업종 카테고리</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>* 태그등록</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>* 가격대</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>* 주차여부</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>* 영업시간</td>
                        <td><input type="text" name="name"> ~ <input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>* 정기휴무</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>* 예약여부</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    </table>
                        </form> 
                    </div>
                </form>
                <br>
            </div>
        </div>
    </div>
    <div class="submit" align="center">
        <input type="reset" class="submitBtn" value="취소">
        <button id="submit" class="submitBtn" >가입하기</button>
    </div>
    <script> 
         $(document).ready(function() {
            $(".joinTab_content").hide();
            $("ul.joinTabs li:first").addClass("active").show();
            $(".joinTab_content:first").show();

            $("ul.joinTabs li").click(function() {

                $("ul.joinTabs li").removeClass("active"); 
                $(this).addClass("active"); 
                $(".joinTab_content").hide();
                $(".joinTab_content active").show(); 

                var activeTab = $(this).find("a").attr("href"); 
                $(activeTab).fadeIn();
                return false;
            });

            });

            $("#submit").click(function(){

                if($("#tab1").css("display") == "none"){
                    $("#RestaurantJoinForm").attr("action", "rinsert.do");
                    $("#RestaurantJoinForm").submit();
                } else{
                    $("#memberJoinForm").attr("action", "minsert.do");
                    $("#memberJoinForm").submit();
                }
            });

            function validate(){
                return true;
            }
    </script>
</body>
</html>