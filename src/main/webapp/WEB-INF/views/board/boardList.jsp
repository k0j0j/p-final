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
<style>
    body{
        background-color: white;
    }
    .wrap{
        width:70%;
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
    .board a{
    text-decoration : none;
    }
    li.current{
        background : rgb(255, 217, 0);
        color: white;
    }
    .boardList{
        display: none;
        width:100%;
        border: 1px solid black;
        clear: both;
    }
    .boardList.current{
	display: block;
}
    .boardList table{
        width:100%;
    }
  table, td, tr{
  border: 1px solid black;
  }
</style>
</head>
<body>

    <div class="wrap">
        <h1 onclick="location.href ='blist.do'">커뮤니티 게시판</h1>
        <ul class="boardTabs">
            <li class="current" data-tab="locBoard" value="1">지역별</li>
            <li class="" data-tab="topBoard" value="2">주제별</li>
            <li class="" data-tab="freeBoard" value="3">자유게시판</li>
        </ul>
        <div class="boardList current" id="locBoard">
        <table class="board">
         <c:forEach var="b" items="${ list }">
			<tr>
				<td>${ b.bNo }</td>
				<td>
				<c:if test="${ b.bCategory eq 'null' }">
				&nbsp;
				</c:if>
				<c:if test="${ b.bCategory != 'null' }">
				[${ b.bCategory }]
				</c:if>
				</td>
				<td>
					<c:url var="bdetail" value="bDetail.do">
						<c:param name="bNo" value="${ b.bNo }"/>
						<c:param name="bType" value="1"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ bdetail }">${ b.bTitle }</a>
					<%-- <c:if test="${ !empty b.originalFileName }">
					◎
					</c:if>
					<c:if test="${ empty b.originalFileName }">
					&nbsp;
					</c:if> --%>
				</td>
				<td>${ b.mNickname }</td>
				<td>${ b.bCount }</td>
				<td>
				<jsp:useBean id="today" class="java.util.Date"></jsp:useBean>
				  <fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />      
				  <fmt:parseNumber value="${b.bEnrollDate.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
				  <c:set value="${nowDays - regDays }" var="dayDiff" />
				  <c:choose>
				    <c:when test="${dayDiff == 0 }">
				        <fmt:formatDate value="${ b.bEnrollDate }" pattern="HH:mm"/>
				    </c:when>
				    <c:otherwise>
				        <fmt:formatDate value="${ b.bEnrollDate }" pattern="yy.MM.dd"/>
				    </c:otherwise>
				  </c:choose>
				</td>
			</tr>
			</c:forEach>
        </table>
        <div class="boardBtm" align="center">
        <c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.do">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
			<c:if test="${ !empty loginUser }">
				<button onclick="location.href='binsertView.do?bType=1'">글쓰기</button>
			</c:if>
							<!-- 검색하기 -->
	<div id="searchArea" align="center">
		<form action="bsearch.do" name="searchForm" method="get">
			<select id="searchCondition" name="searchCondition">
				<option value="all" 
				<c:if test="${ search.searchCondition == 'all' }">selected
				</c:if>>전체</option>
				<option value="writer" 
				<c:if test="${ search.searchCondition == 'writer' }">selected
				</c:if>>작성자</option>
				<option value="title"
				<c:if test="${ search.searchCondition == 'title' }">selected
				</c:if>>제목</option>
				<option value="content"
				<c:if test="${ search.searchCondition == 'content' }">selected
				</c:if>>내용</option>
			</select>
			<input type="search" name="searchValue" value="${ search.searchValue }">
			<input type="hidden" name="bType" value="1">
			<button>검색</button><br>
		</form>
	</div>
			</div>
        </div>
        
        
        <div class="boardList" id="topBoard">
        <table class="board">
            <c:forEach var="b" items="${ list }">
			<tr>
				<td>${ b.bNo }</td>
				<td>
				<c:if test="${ b.bCategory eq 'null' }">
				&nbsp;
				</c:if>
				<c:if test="${ b.bCategory != 'null' }">
				[${ b.bCategory }]
				</c:if>
				</td>
				<td>
					<c:url var="bdetail" value="bDetail.do">
						<c:param name="bNo" value="${ b.bNo }"/>
						<c:param name="bType" value="2"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ bdetail }">${ b.bTitle }</a>
					<%-- <c:if test="${ !empty b.originalFileName }">
					◎
					</c:if>
					<c:if test="${ empty b.originalFileName }">
					&nbsp;
					</c:if> --%>
				</td>
				<td>${ b.mNickname }</td>
				<td>${ b.bCount }</td>
				<td>
				<jsp:useBean id="today2" class="java.util.Date"></jsp:useBean>
				  <fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />      
				  <fmt:parseNumber value="${b.bEnrollDate.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
				  <c:set value="${nowDays - regDays }" var="dayDiff" />
				  <c:choose>
				    <c:when test="${dayDiff == 0 }">
				        <fmt:formatDate value="${ b.bEnrollDate }" pattern="HH:mm:ss"/>
				    </c:when>
				    <c:otherwise>
				        <fmt:formatDate value="${ b.bEnrollDate }" pattern="yy.MM.dd"/>
				    </c:otherwise>
				  </c:choose>
				</td>
			</tr>
			</c:forEach>
			</table>
			
			<div class="boardBtm" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.do">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
			<c:if test="${ !empty loginUser }">
				<button onclick="location.href='binsertView.do?bType=2'">글쓰기</button>
			</c:if>
						<!-- 검색하기 -->
	<div id="searchArea2" align="center">
		<form action="bsearch.do" name="searchForm" method="get">
			<select id="searchCondition2" name="searchCondition">
				<option value="all" 
				<c:if test="${ search.searchCondition == 'all' }">selected
				</c:if>>전체</option>
				<option value="writer" 
				<c:if test="${ search.searchCondition == 'writer' }">selected
				</c:if>>작성자</option>
				<option value="title"
				<c:if test="${ search.searchCondition == 'title' }">selected
				</c:if>>제목</option>
				<option value="content"
				<c:if test="${ search.searchCondition == 'content' }">selected
				</c:if>>내용</option>
			</select>
			<input type="search" name="searchValue" value="${ search.searchValue }">
			<input type="hidden" name="bType" value="2">
			<button>검색</button><br>
		</form>
	</div>
			</div>
        </div>
        
        
        <div class="boardList" id="freeBoard">
        <table class="board">
            <c:forEach var="b" items="${ list }">
			<tr>
				<td>${ b.bNo }</td>
				<td>
					<c:url var="bdetail" value="bDetail.do">
						<c:param name="bNo" value="${ b.bNo }"/>
						<c:param name="bType" value="3"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ bdetail }">${ b.bTitle }</a>
					<%-- <c:if test="${ !empty b.originalFileName }">
					◎
					</c:if>
					<c:if test="${ empty b.originalFileName }">
					&nbsp;
					</c:if> --%>
				</td>
				<td>${ b.mNickname }</td>
				<td>${ b.bCount }</td>
				<td>
				<jsp:useBean id="today3" class="java.util.Date"></jsp:useBean>
				  <fmt:parseNumber value="${today.time / (1000 * 60 * 60 * 24)}" var="nowDays" integerOnly="true" />      
				  <fmt:parseNumber value="${b.bEnrollDate.time / (1000 * 60 * 60 * 24)}" var="regDays" integerOnly="true" />
				  <c:set value="${nowDays - regDays }" var="dayDiff" />
				  <c:choose>
				    <c:when test="${dayDiff == 0 }">
				        <fmt:formatDate value="${ b.bEnrollDate }" pattern="HH:mm:ss"/>
				    </c:when>
				    <c:otherwise>
				        <fmt:formatDate value="${ b.bEnrollDate }" pattern="yy.MM.dd"/>
				    </c:otherwise>
				  </c:choose>
				</td>
			</tr>
			</c:forEach>
			</table>
			
			<div class="boardBtm" align="center">
			<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.do">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				<!-- 페이지 숫자 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4">[ ${ p } ]</font>
					</c:if>
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.do">
							<c:param name="page" value="${ p }" />
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.do">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ after }">[다음]</a>
				</c:if>
			<c:if test="${ !empty loginUser }">
				<button onclick="location.href='binsertView.do?bType=3'">글쓰기</button>
			</c:if>
			        	<!-- 검색하기 -->
	<div id="searchArea3" align="center">
		<form action="bsearch.do" name="searchForm" method="get">
			<select id="searchCondition3" name="searchCondition">
				<option value="all" 
				<c:if test="${ search.searchCondition == 'all' }">selected
				</c:if>>전체</option>
				<option value="writer" 
				<c:if test="${ search.searchCondition == 'writer' }">selected
				</c:if>>작성자</option>
				<option value="title"
				<c:if test="${ search.searchCondition == 'title' }">selected
				</c:if>>제목</option>
				<option value="content"
				<c:if test="${ search.searchCondition == 'content' }">selected
				</c:if>>내용</option>
			</select>
			<input type="search" name="searchValue" value="${ search.searchValue }">
			<input type="hidden" name="bType" value="3">
			<button>검색</button><br>
		</form>
	</div>
			</div>
        </div>
    </div>
    
    <script> 
   
 
    window.onload  = function() {
    	if('${search.bType == null}'){
    	    var bType = '${bType}';
    	   	}else if('${search.bType ne null}'){
    	   	var bType = '${search.bType}';
    	   	}
    	   	console.log(bType);
    	   	
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