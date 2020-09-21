<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application" />
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<style>
    body{
        background-image: url("${contextPath}/resources/img/main/login.jpg");
        background-repeat: no-repeat;
        background-size: cover;
    }
    .wrap{
        width:350px;
        margin:auto;
        margin-top:8%;
        padding:auto;
        text-align: center;
        background-color: rgba(255, 255, 255, 0.8);
        color:black;
    }
    .wrap h1{
        padding-top: 60px;
        padding-bottom: 10px;
    }
    .input_box input{
        width: 250px;
        height: 30px;
        margin:5px;
    }
    .loginBtn{
        width: 258px;
        height: 30px;
        font-size: medium;
        background-color: rgb(255, 217, 0);
        border: 1px solid rgb(163, 163, 163);
        margin:5px;
    }
    .findInfo a, .findInfo span{
        text-decoration: none;
        color:#8E8E8E;
        font-size: small;
    }
    .findInfo{
        width: 260px;
        margin: auto;
        padding-top: 5px;
        padding-bottom: 50px;

    }

</style>
</head>
<body>
<jsp:include page="../common/menubar2.jsp" />
    <div class="wrap" align="center">
        <h1>HONEY POINT</h1>
        <div class="id_area">
        <form action="login.do" method="post">
            <div class="input_row" id="id_area">
                <span class="input_box">
                    <input type="text" id="mId" name="mId" placeholder=" 아이디" class="int" maxlength="41" value="">
                </span>
            </div>
        </div>

        <div class="pw_area">
            <div class="input_row" id="pw_area">
                <span class="input_box">
                    <input type="password" id="mPwd" name="mPwd" placeholder=" 비밀번호" class="int" maxlength="16">
                </span>
            </div>
        </div>
        <button class="loginBtn">로그인</button>
        <div class="findInfo">
            <a id="idinquiry" href="<c:url value="findId.do" />">아이디 찾기</a> 
            <span class="bar" aria-hidden="true">|</span> 
            <a id="pwinquiry" href="<c:url value="findPwd.do" />">비밀번호 찾기</a>
            <span class="bar" aria-hidden="true">|</span> 
            <a id="join" href="<c:url value="joinPage.do" />">회원가입</a>
        </div>
		</form>
    </div>
</body>
</html>