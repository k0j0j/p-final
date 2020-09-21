<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	background-image: url("${contextPath}/resources/img/main/back.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	padding-top:40px;
    font-size:14px !important;
}

.wrap {
	width: 450px;
	margin: auto;
	margin-top: 4%;
	padding: 30px;
	text-align: left;
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
    .smallTxt{
    font-size: small;
    }
</style>
</head>
<body>
<jsp:include page="../common/menubar2.jsp" />
	<div class="wrap">
	 	<h2>아이디 검색결과</h2>
			<div>
				<br>
				<p class="w3-center">
					<span class="smallTxt">아이디 : </span><strong>${ id }</strong>
				</p>
				<br>
				<p class="smallTxt">비밀번호를 까먹으셨나요?</p>
					<p class="w3-center">
						<input type="button" value="비밀번호 찾기" onClick="location.href='<c:url value="findPwd.do" />'" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">
					</p>
				</div>
	</div>
	<div class="submit" align="center">
	<input type="button" class="goBtn" value="메인으로" onClick="location.href='index.jsp'">
	<input type="button" class="goBtn" value="로그인" onClick="location.href='<c:url value="loginPage.do" />'">
	</div>
</body>
</html>