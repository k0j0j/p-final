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
<style>
    body{
        background-image: url("${contextPath}/resources/img/main/back.jpg");
        background-repeat: no-repeat;
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
                    <input type="text" name="mId" id="userId" required>
                    <!-- ajax 이후 적용 -->
                    <span class="guide id_guide ok" id="id_ok">사용 가능한 아이디</span>
                    <span class="guide id_guide error" id="id_error">사용 불가능한 아이디</span>
                    <input type="hidden" name="idDuplicateCheck" 
                    id="idDuplicateCheck" value="0">
                    <input type="hidden" name="memSort" id="memSort" value="1">
                </td>
            </tr>
            <tr>
                <td>* 비밀번호</td> 
                <td><input type="password" name="mPwd" id="pwd1" required></td>
            </tr>
            <tr>
                <td>* 비밀번호확인</td>
                <td>
                <input type="password" name="pwd2" id="pwd2" required>
                <span class="guide pass_guide ok" id="pass_ok">비밀번호 일치</span>
                <span class="guide pass_guide error" id="pass_error">비밀번호 불일치</span>
                </td>
            </tr>
            <tr>
                <td>* 이름</td>
                <td><input type="text" name="mName" required></td>
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
                <td><input type="text" name="mNickname"></td>
            </tr>
            <tr>
                <td>* 이메일</td>
                <td><input type="email" name="mEmail" required></td>
            </tr>
            <tr>
                <td>* 전화번호</td>
                <td><input type="tel" name="mPhone" required></td>
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
                onsubmit="return validate2();">
                <br>
                <table width="600" cellspacing="5">
                    <tr>
                        <td width="150">* 아이디</td>
                        <td width="450">
                            <input type="text" name="mId" id="userId2" required>
                            <!-- ajax 이후 적용 -->
                            <span class="guide id_guide ok" id="id_ok2">사용 가능한 아이디</span>
                   			<span class="guide id_guide error" id="id_error2">사용 불가능한 아이디</span>
                            <input type="hidden" name="idDuplicateCheck" 
                            id="idDuplicateCheck2" value="0">
                            <input type="hidden" name="memSort" id="memSort2" value="2">
                        </td>
                    </tr>
                    <tr>
                        <td>* 비밀번호</td> 
                        <td><input type="password" name="mPwd" id="pwd12" required></td>
                    </tr>
                    <tr>
                        <td>* 비밀번호확인</td>
                        <td>
                        <input type="password" name="pwd2" id="pwd22" required>
                        <span class="guide pass_guide ok" id="pass_ok2">비밀번호 일치</span>
                		<span class="guide pass_guide error" id="pass_error2">비밀번호 불일치</span>
                        </td>
                    </tr>
                    <tr>
	                	<td>* 이메일</td>
	                	<td><input type="email" name="mEmail" required></td>
            		</tr>
                    <tr>
                        <td>* 업체명</td>
                        <td><input type="text" name="rName"></td>
                    </tr>
                    <tr>
                        <td>우편번호</td>
                        <td>
                            <input type="text" name="post" class="postcodify_postcode5" size="6">
                            <!-- form 태그 안의 button은 default로 submit이라는 속성을 가져
                            우편번호 관련 팝업이 뜨는 것이 아니라 form이 submit 되어 minsert.do라는 요청이 가는 현상
                            button 태그에 type="button"을 기재함 -->
                            <button type="button" id="postcodify_search_button2">검색</button>
                        </td>
                    </tr>
                    <tr>
                        <td>도로명 주소</td>
                        <td><input type="text" name="rAddress" class="postcodify_address"></td>
                    </tr>
                    <tr>
                        <td>상세 주소</td>
                        <td><input type="text" name="rOAddress" class="postcodify_details"></td>
                    </tr>
                    <tr>
                        <td>전화번호</td>
                        <td><input type="tel" name="rTel"></td>
                    </tr>
                    <tr>
                        <td>업종 카테고리</td>
                        <td>
                        <select name="rType">
                        <option value="selected">선택하기</option>
                        <option value="한식">한식</option>
                        <option value="일식">일식</option>
                        <option value="중식">중식</option>
                        <option value="양식">양식</option>
                        <option value="세계음식">세계음식</option>
                        <option value="카페">카페</option>
                        <option value="술집">술집</option>
                        <option value="패스트푸드">패스트푸드</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>태그등록</td>
                        <td><input type="text" name="rTag"></td>
                    </tr>
                    <tr>
                        <td>가격대</td>
                        <td>
                        <select name="rPrice">
                        <option value="selected">선택하기</option>
                        <option value="10000">만원 미만</option>
                        <option value="20000">1-2만원대</option>
                        <option value="30000">3-4만원대</option>
                        <option value="50000">5만원대 이상</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <td>주차여부</td>
                        <td>
                        <label><input type="radio" name="rParking" value="Y" checked >주차가능</label>
                        <label><input type="radio" name="rParking" value="N">주차불가</label>
                        </td>
                    </tr>
                    <tr>
                        <td>영업시간</td>
                        <td><input type="time" name="rStartTime">부터 <input type="time" name="rEndTime">까지</td>
                    </tr>
                    <tr>
                        <td>정기휴무</td>
                        <td>
                        <label><input type="checkbox" name="rRestDay" value="월">월</label>
                        <label><input type="checkbox" name="rRestDay" value="화">화</label>
                        <label><input type="checkbox" name="rRestDay" value="수">수</label>
                        <label><input type="checkbox" name="rRestDay" value="목">목</label>
                        <label><input type="checkbox" name="rRestDay" value="금">금</label>
                        <label><input type="checkbox" name="rRestDay" value="토">토</label>
                        <label><input type="checkbox" name="rRestDay" value="일">일</label>
                        <label><input type="checkbox" name="rRestDay" value="없음">없음</label>
                        </td>
                    </tr>
                    <tr>
                    	<td>업체소개</td>
                    	<td>
                    	<textarea name="rIntro" cols="30" rows="6" placeholder="맛집 소개글을 작성 해 주세요."></textarea>
                    	</td>
                    </tr>
                    <tr>
                        <td>예약여부</td>
                        <td>
                        <label><input type="radio" name="resveYn" value="Y" checked >예약가능</label>
                        <label><input type="radio" name="resveYn" value="N">예약불가</label>
                        </td>
                    </tr>
                    </table>
                        </form>
                  </div>
                <br>
            </div>
        </div>
    <div class="submit" align="center">
        <input type="button" class="submitBtn" value="취소" onClick="location.href='index.jsp'">
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

            
            $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); 
            
            
            $(function(){
               $("#userId").on("keyup", function(){
                  var userId = $(this).val().trim(); // trim() : 공백 제거
                  
                  if(userId.length < 2){
                     $(".id_guide").hide();   // span 태그 숨김
                     $("#idDuplicateCheck").val(0);   // value -> 0  아이디 사용 불가의 의미
                     
                     return;
                  }
                  
                  $.ajax({
                     url : "dupid.do",
                     data : {id:userId},
                     success : function(data){
                        console.log(data);
                      	if(data.isUsable == true){
      						$("#id_error").hide();
      						$("#id_ok").show();
      						$("#idDuplicateCheck").val(1); // value 1 -> 아이디 사용 가능
      					} else {
      						$("#id_error").show();
      						$("#id_ok").hide();
      						$("#idDuplicateCheck").val(0);
      					}
                        
                     },
                     error : function(){
                        console.log('ajax 통신 실패');
                     }
                     
                     
                  });
               });
            });
            
            function validate(){
          	  // 아이디 중복 체크 여부
          	  if($("#idDuplicateCheck").val() == 0){
          		  alert("사용 가능한 아이디를 입력해주세요");
          		  $("#userId").focus();
          		  return false;
          	  }
          	  return true;
            }
             
            $(function(){ 
            	//$("#pass_ok").hide(); $("#pass_error").hide(); 
	            $("#pwd2").keyup(function(){ 
	            	var pwd1=$("#pwd1").val(); 
	            	var pwd2=$("#pwd2").val(); 
	            	if(pwd1 != "" || pwd2 != ""){ 
	            		if(pwd1 == pwd2){ 
	            			$("#pass_ok").show(); 
	            			$("#pass_error").hide(); 
	            		//$("#submit").removeAttr("disabled"); 
	            		}else{ 
	            			$("#pass_ok").hide(); 
	            			$("#pass_error").show(); 
	            			//$("#submit").attr("disabled", "disabled"); 
	            			} 
            		} 
            	}); 
            });
            
            // ---------------- 맛집회원가입용 스크립트 ---------------------------
            $(function() { $("#postcodify_search_button2").postcodifyPopUp(); }); 
            
            $(function(){
               $("#userId2").on("keyup", function(){
                  var userId = $(this).val().trim(); // trim() : 공백 제거
                  
                  if(userId.length < 2){
                     $(".id_guide").hide();   // span 태그 숨김
                     $("#idDuplicateCheck2").val(0);   // value -> 0  아이디 사용 불가의 의미
                     
                     return;
                  }
                  
                  $.ajax({
                     url : "dupid.do",
                     data : {id:userId},
                     success : function(data){
                        console.log(data);
                      	if(data.isUsable == true){
      						$("#id_error2").hide();
      						$("#id_ok2").show();
      						$("#idDuplicateCheck2").val(1); // value 1 -> 아이디 사용 가능
      					} else {
      						$("#id_error2").show();
      						$("#id_ok2").hide();
      						$("#idDuplicateCheck2").val(0);
      					}
                        
                     },
                     error : function(){
                        console.log('ajax 통신 실패');
                     }
                     
                     
                  });
               });
            });
            
            function validate2(){
          	  // 아이디 중복 체크 여부
          	  if($("#idDuplicateCheck2").val() == 0){
          		  alert("사용 가능한 아이디를 입력해주세요");
          		  $("#userId2").focus();
          		  return false;
          	  }
          	  return true;
            }
            
            $(function(){ 
            	//$("#pass_ok").hide(); $("#pass_error").hide(); 
	            $("#pwd22").keyup(function(){ 
	            	var pwd1=$("#pwd12").val(); 
	            	var pwd2=$("#pwd22").val(); 
	            	if(pwd1 != "" || pwd2 != ""){ 
	            		if(pwd1 == pwd2){ 
	            			$("#pass_ok2").show(); 
	            			$("#pass_error2").hide(); 
	            		//$("#submit").removeAttr("disabled"); 
	            		}else{ 
	            			$("#pass_ok2").hide(); 
	            			$("#pass_error2").show(); 
	            			//$("#submit").attr("disabled", "disabled"); 
	            			} 
            		} 
            	}); 
            });

    </script>
</body>
</html>