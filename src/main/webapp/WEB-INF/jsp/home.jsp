<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-05-30
  Time: 오후 1:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>K-BASEBALL</title>

    <%@ include file="/WEB-INF/include/headerLink.jsp"%>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".menu_1>a").click(function () {
                $(this).next("ul").toggleClass("menu_1_content");
            });
        });
    </script>
    <style>
        .menu_1 a{cursor:pointer;}
        .menu_1 .hide{display:none;}
    </style>

</head>
<body>
<header class="p-3 bg-black text-black">
        <div class="header_container">
            <div class="logo_container">
                <span class="logo"><a href="#"><img alt="홈 로고" src="../../static/img/kbb-logo.jpg" width="200" height="200" /> </a></span>
            </div>
            <div class="nav_container" id="nav_menu">
                <div class="menu_container">
                    <ul class="menu">
                        <li class="menu_1">
                            <a class="menu_title">야 구</a>
                            <ul class="menu_1_content">
                                <li><a class="menu_index" href="./tigers_list">기아 타이거즈</a></li>
                                <li><a class="menu_index" href="./tigers_list">롯데 자이언츠</a></li>
                                <li><a class="menu_index" href="./tigers_list">삼성 라이온즈</a></li>
                                <li><a class="menu_index" href="./tigers_list">엔씨 다이노스</a></li>
                                <li><a class="menu_index" href="./tigers_list">한화 이글스</a></li>
                                <li><a class="menu_index" href="./tigers_list">SSG 랜더스</a></li>
                                <li><a class="menu_index" href="./tigers_list">두산 베어스</a></li>
                                <li><a class="menu_index" href="./tigers_list">엘지 트윈스</a></li>
                                <li><a class="menu_index" href="./tigers_list">키움 히어로즈</a></li>
                                <li><a class="menu_index" href="./tigers_list">케이티 위즈</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</header>
<div>
    home style
</div>


</body>
</html>