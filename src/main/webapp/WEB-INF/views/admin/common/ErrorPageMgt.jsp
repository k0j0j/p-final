<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.kh.honeypoint.admin.reportMgt.model.vo.*, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	ArrayList<Report> rlist = (ArrayList<Report>)request.getAttribute("rlist"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<link rel="stylesheet" href="${ contextPath }/resources/css/admin/admin.css" type="text/css"/>

<!-- Font setting -->
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gothic+A1:wght@900&display=swap" rel="stylesheet">

<style>
th, td {
	border-bottom: 0.3px solid #c0c0c0;
	padding: 10px;
	width:15%;
	height: 40%;
	font-weight:normal;
}
</style>
</head>
<body>
	<%@ include file="../../common/menubar.jsp" %>
	<div class="container mt-5">
		<div class="container-second mt-10  float-left" style="border: 0px">			
			<!-- LoginUser & Preview -->
			<div class="w-100 h-25 mt-5 p-3 pt-3 overflow-auto" style="text-align:center">							
				<h3>ERROR-PAGE</h3><br><br><br>
				
				<a style="margin-top:10px !important">${ loginUser.mName }님 죄송합니다.</a><br>
				<a>해당 페이지에 접속할 수 없습니다.</a><br><br>
				<a>다시 이용 부탁드립니다.</a><br><br>
			</div>
			
			<hr>
			
			<div class="w-100 h-25 mt-4 p-3 pt-2 overflow-auto">
				<a style="color:red">발생 원인</a><br>
				<a style="font-size:15px"><%= request.getAttribute("javax.servlet.error.message") %></a>
				<br><br>
			</div>
		</div>
	</div>	
</body>
</html>