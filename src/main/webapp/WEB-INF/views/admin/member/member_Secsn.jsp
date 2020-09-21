<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@100&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">


<!-- GOOGLE CHART -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([
      ['탈퇴 사유', '수치'],
      
      
      ['[일반] 사이트를 자주 이용하지 않습니다.', ${ secsnC }],
      ['[일반] 사이트의 정보가 부족합니다.', ${ secsnC2 }],
      ['[일반] 사이트 관리가 미흡합니다.', ${ secsnC3 }],
      ['[맛집] 맛집을 더이상 운영하지 않습니다.', ${ secsnC4 }],
      ['[일반] 탈퇴 후 다시 가입할 예정입니다.', ${ secsnC5 }]
    ]);

    var options = {
   		legend: "bottom",    		   
      	title: '탈퇴 사유 차트'
    };

    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    chart.draw(data, options);
  }
</script>
    
    
</head>

<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="container mt-3">
		<div class="container-second mt-10 col-2 ml-4 mr-4 float-left">
			<%@ include file="../common/sideMenu.jsp" %>
		</div>
	
		<div class="container-second mt-10 col-9 float-left" style="border: 0px">
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-3 pl-3 pt-3 overflow-auto">
			<h3>MEMBER MANAGEMENT</h3>
				<div class="pb-2 float-right">
					<p class="rstrnt-menu-list pl-2" id="myTabContentTitle1">회원 관리 ▶ 회원 조회</p>
				</div>
			</div>
			
			<!-- Select-Menu-Tab -->
			<div>
				<div class="btn-group btn-group-toggle pl-2 pb-1" data-toggle="buttons">
					<label class="btn btn-light radio-button radio-button-height" onclick="member_Mgt()">회원 조회</label>
					<label class="btn btn-light radio-button radio-button-height active" onclick="member_Secsn()">탈퇴 내역</label>					
				</div>
			</div>
			
			<!-- Board Area -->
			<!-- Tab 2 -->
			<div class="tab-content col-8" style="display:inline-block; padding:0px 0px">
	 			<div class="tab-pane fade show active pl-2" id="home" role="tabpanel" aria-labelledby="home-tab">
				  	<div class="taplist">
					<table class="table table-hover mb-0">
						<colgroup>
							<col width="20%"/>
							<col width="60%"/>
							<col width="20%"/>
						</colgroup>
						<thead class="btn-secondary non-hover">
							<tr>
								<th scope="col" class="th-center-title th-menu">탈퇴 ID</th>
								<th scope="col" class="th-center-title th-menu ">탈퇴 사유</th>
								<th scope="col" class="th-center-title th-menu">탈퇴일</th>
							</tr>
						</thead>
						<tbody>							
							<c:forEach var="list" items="${list}">
								<tr>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MId }"/></td>
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MSecsnCn}"/></td>									
									<td scope="col" class="th-center-txt td-txt"><c:out value="${ list.MSecsnDe }"/></td>
								</tr>			
							</c:forEach>
							
						</tbody>
					</table>
					
					<table class="table">
						<!-- PAGING -->
						<tr align="center" height="20">
							<td colspan="6" class="pt-5 pagin-txt">
							
								<!-- [이전] -->
								<c:if test="${ pi.currentPage eq 1 }">
									<font color="lightgray">[이전] &nbsp;</font>
								</c:if>
								<c:if test="${ pi.currentPage ne 1 }">
									<c:url var="before" value="xMemMgt.do">
										<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
									</c:url>
									<a href="${ before }" style="color:black">[이전]</a> &nbsp;
								</c:if>
								
								<!-- PAGE NUMBER -->
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
									<c:if test="${ p eq pi.currentPage }">
										<font color="orange" size="2"><b>[${ p }]</b></font>
									</c:if>
									
									<c:if test="${ p ne pi.currentPage }">
										<c:url var="pagination" value="xMemMgt.do">
											<c:param name="currentPage" value="${ p }"/>
										</c:url>
										<a href="${ pagination }" style="color:black">${ p }</a> &nbsp;
									</c:if>
								</c:forEach>
								
								<!-- [다음] -->
								<c:if test="${ pi.currentPage eq pi.maxPage }">
									<font color="lightgray">&nbsp;[다음]</font>
								</c:if>
								<c:if test="${ pi.currentPage ne pi.maxPage }">
									<c:url var="after" value="xMemMgt.do">
										<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
									</c:url>
									<a href="${ after }" style="color:black">&nbsp;[다음]</a>
								</c:if>								
							</td>
						</tr>
					</table>
					<div>　</div>
					</div>
				</div>
			</div>
			<div id="piechart" class="col-4 float-right" style="width: 33%; display:inline"></div>
		</div>
	</div>
	</body>
	
	<script>
		function member_Mgt(){
			location.href="memMgt.do";
		}	
		function member_Secsn(){
			location.href="xMemMgt.do";
		}
	</script>
</html>