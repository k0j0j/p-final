<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	background-image: url("${contextPath}/resources/img/main/back.jpg");
	background-repeat: no-repeat;
}

.wrap {
	width: 450px;
	margin: auto;
	margin-top: 4%;
	padding: auto;
	padding-top:30px;
	padding-bottom:30px;
	text-align: center;
	background-color: rgba(0, 0, 0, 0.7);
	color: white;
}
    .goBtn{
        width: 80px;
        height: 25px;
        border:0;
        outline: 0;
        margin:10px;
    }
</style>
</head>
<body>
	<div class="wrap" align="center">
	 	<h1>HONEY POINT</h1>
		<h3>환영합니다!</h3>
		<h5>성공적으로 회원가입이 완료되었습니다.
		<br>로그인 후 다양한 서비스를 이용하실 수 있습니다.</h5>
	</div>
	<div class="submit" align="center">
	<input type="button" class="goBtn" value="메인으로" onClick="location.href='index.jsp'">
	<input type="button" class="goBtn" value="로그인" onClick="location.href='<c:url value="loginPage.do" />'">
	</div>
</body>
</html>