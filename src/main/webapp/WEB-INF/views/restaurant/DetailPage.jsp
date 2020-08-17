<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>디테일 페이지</title>

    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
    <link href="../finalProject/css/default.css" rel="stylesheet" type="text/css" media="all" />
    <link href="../finalProject/css/fonts.css" rel="stylesheet" type="text/css" media="all" />
    <style>
        body {
            box-sizing: border-box;
            margin: auto;
        }

        .list-photo-wrap {
            /* border: 1px solid red; */
            height: 300px;
            background-color: white;
            padding: 0;
            display: flex;
            overflow: hidden;
        }

        .photo-wrap {
            float: left;
            margin: 0;
            width: 300px;
            height: 100%;

        }

        .photo-centered {
            margin: 0;
            float: left;
            width: 97%;
            height: 100%;
            overflow: hidden;
            position: relative;
        }

        .photo-wrap .photo-centered .photo {
            position: absolute;
            margin: auto;
            min-height: 100%;
            min-width: 100%;
            object-fit: cover;
            width: 300px;
            height: 300px;


            
            left: -100%;
            right: -100%;
            top: -100%;
            bottom: -100%;
        }

        .cnt:before {
            content: '';
            display: inline-block;
            margin: -4px 4px 0 0;
            vertical-align: middle;
        }

        .hit:before {
            background-image: url(https://mp-seoul-image-develop-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png?fit=around|*:*&crop=*:*;*,*&output-format=png&output-quality=80);
            background-position: -974px -817px;
            width: 19px;
            height: 13px;
        }

        .review:before {
            background-image: url(https://mp-seoul-image-develop-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png?fit=around|*:*&crop=*:*;*,*&output-format=png&output-quality=80);
            background-position: -800px -648px;
            width: 12px;
            height: 13px;
        }

        .favorite:before {
            background-image: url(https://mp-seoul-image-develop-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png?fit=around|*:*&crop=*:*;*,*&output-format=png&output-quality=80);
            background-position: -828px -774px;
            width: 14px;
            height: 13px;
        }

        .title_wrap {
            display: flex;
        }

        .action_button_wrap {
            display: flex;
            margin-left: auto;
        }

        .review_writing_button {
            display: -moz-flex;
            display: -ms-flexbox;
            display: flex;
            display: -webkit-box;
            display: -webkit-flex;
            -moz-flex-direction: column;
            -ms-flex-direction: column;
            flex-direction: column;
            -webkit-flex-direction: column;
            -webkit-box-direction: normal;
            -webkit-box-orient: vertical;
            -moz-align-items: center;
            align-items: center;
            -webkit-align-items: center;
            -webkit-box-align: center;
            -ms-flex-align: center;
            margin: 0 19px 0 0;
        }

        button {
            appearance: none;
            cursor: pointer;
            border: 0px;
            border-radius: 0;
            background-color: transparent;
        }

        .review_writing_button_icon {
            display: block;
            width: 32px;
            height: 32px;
            background-image: url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/review_writing_icon.png);
            background-size: cover;
            background-repeat: no-repeat;
            margin: auto;
        }

        .review_writing_button_text {
            margin-top: 12px;
            font-size: 0.8rem;
            line-height: 1.3;
            color: #9B9B9B;
        }

        .info th {
            width: 110px;
            font-size: .9rem;
            color: rgba(79, 79, 79, 0.6);
            line-height: 1.7;
            text-align: left;
            vertical-align: top;
            padding-right: 10px;
            padding-bottom: 5px;

        }

        ol,
        ul,
        ul li {
            list-style: none;
        }

        .Restaurant_MenuItem {
            border-bottom: 1px solid #e9e9e9;
            margin-bottom: 4px;
            display: flex;

        }

        .Restaurant_Menu {
            flex: 1;
            display: inline-block;
            margin-right: 30px;
            white-space: normal;
        }

        .Restaurant_MenuPrice {
            margin-left: auto;
        }

        .restaurant-detail {
            border-bottom: 1px solid rgb(194, 194, 194);
        }
    </style>
</head>

<body>
    <div class="list-photo-wrap">
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="images/캡처.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="images/캡처1.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="images/캡처2.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="images/캡처3.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="images/캡처.JPG">
            </div>
        </figure>
        <figure class="photo-wrap">
            <div class="photo-centered">
                <img class="photo" src="images/캡처.JPG">
            </div>
        </figure>
    </div>


    <div id="wrapper">

        <div id="three-column" class="container" style="text-align: left;">

            <div class="restaurant-detail">
                <header class="title"
                    style="text-align: left; border-bottom: 1px solid rgb(194, 194, 194); padding-bottom: 10px;">
                    <div class="title_wrap">
                        <span>
                            <h2>스타쉐프 하이 후남<span style="color: rgb(255, 183, 50); font-size: 22px;">&nbsp;★ 4.5</span>
                            </h2>
                        </span>
                        <div class="action_button_wrap">
                            <button class="review_writing_button">
                                <i class="review_writing_button_icon"></i>
                                <span class="review_writing_button_text">
                                    리뷰쓰기
                                </span>
                            </button>
                        </div>
                    </div>

                    <span class="byline cnt hit">36,125</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt review">1,445</span>&nbsp;&nbsp;&nbsp;
                    <span class="byline cnt favorite">525</span>
                </header>
                <div>
                    <table class="info no_menu">
                        <tbody>
                            <tr>
                                <th>주소</th>
                                <td>경상북도 포항시 북구 칠성천길 108-1</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td>054-247-0764</td>
                            </tr>
                            <tr>
                                <th>음식 종류</th>
                                <td>탕 / 찌개 / 전골</td>
                            </tr>
                            <tr>
                                <th>영업시간</th>
                                <td>08:00 - 20:30</td>
                            </tr>
                            <tr>
                                <th>휴일</th>
                                <td>첫째/셋째 일</td>
                            </tr>
                            <tr>
                                <th>메뉴</th>
                                <td>
                                    <ul class="Restaurant_MenuList">
                                        <li class="Restaurant_MenuItem">
                                            <span class="Restaurant_Menu">곰탕(소)</span>
                                            <span class="Restaurant_MenuPrice">15,000원</span>
                                        </li>
                                        <li class="Restaurant_MenuItem">
                                            <span class="Restaurant_Menu">수육</span>
                                            <span class="Restaurant_MenuPrice">35,000원</span>
                                        </li>
                                        <li class="Restaurant_MenuItem">
                                            <span class="Restaurant_Menu">순대국</span>
                                            <span class="Restaurant_MenuPrice">8,000원</span>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <br>
            </div>

            <div style="width:auto; height:800px; border-bottom: 1px solid rgb(194, 194, 194);">
            
                <div class="advertisement_wrap" style="width:1000px; height:200px; border: 1px solid red; margin: auto; margin-top: 50px;"></div>

                <div class="map_wrap" style="margin-top: 50px;">
                    <h2>지도1</h2>
                    <br>
                    <div id="map" style="width:auto; height:400px; border: 1px solid red;"></div>
                </div>

            </div>
            <h2>리뷰</h2>
        </div>
    </div>

</body>

</html>