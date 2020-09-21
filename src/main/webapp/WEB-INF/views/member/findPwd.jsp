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
</style>
</head>
<body>
	<div class="wrap">
	 	<h2>비밀번호 찾기</h2>
			<form action="find_Pwd.do" method="post">
				<div>
					<p>
						<label> 아이디</label>
					</p>
					<p>
						<input class="w3-input" type="text" id="id" name="id" placeholder="회원가입시 등록한 아이디를 입력 해 주세요." required>
					</p>
					<p>
						<label> 이메일</label>
					</p>
					<p>
						<input class="w3-input" type="email" id="email" name="email" placeholder="회원가입시 등록한 이메일을 입력 해 주세요." required>
					</p>
					<p class="w3-center">
						<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">찾기</button>
					</p>
				</div>
			</form>
	</div>
	<div class="submit" align="center">
	<input type="button" class="goBtn" value="메인으로" onClick="location.href='index.jsp'">
	<input type="button" class="goBtn" value="로그인" onClick="location.href='<c:url value="loginPage.do" />'">
	</div>
</body>
</html>