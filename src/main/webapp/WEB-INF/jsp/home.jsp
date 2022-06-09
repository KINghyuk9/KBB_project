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

    <style>
        .menu_1 a{cursor:pointer;}
        .menu_1 .hide{display:none;}
    </style>

</head>
<body>
<header class="p-3 bg-dark text-white" >
        <div class="header_container">
            <div class="logo_container">
<%--                <span class="logo"><a href="#"><img alt="홈 로고" src="../../static/img/kbb-logo2.png" width="150" height="60" /> </a></span>--%>
                <span class="logo" ><a href="#"> K-BB </a></span>
            </div>
            <div class="nav_container" id="nav_menu">
                <div class="menu_container">
                    <ul class="menu">
                        <li class="menu_1">
                            <a class="menu_title_1"><i class="fa-solid fa-baseball"></i> 야 구</a>
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
                                <li><a class="menu_index" href="./tigers_list">MLB</a></li>
                            </ul>
                        </li>
                        <li class="menu_2">
                            <a class="menu_title_2"><i class="fa-solid fa-futbol"></i> 축 구</a>
                            <ul class="menu_2_content">
                                <li><a class="menu_index" href="./tigers_list">국내 축구</a></li>
                                <li><a class="menu_index" href="./tigers_list">해외 축구</a></li>
                            </ul>
                        </li>
                        <li class="menu_3">
                            <a class="menu_title_3"><i class="fa-solid fa-basketball"></i> 농 구</a>
                            <ul class="menu_3_content">
                                <li><a class="menu_index" href="./tigers_list">국내 농구</a></li>
                                <li><a class="menu_index" href="./tigers_list">해외 농구</a></li>
                            </ul>
                        </li>
                        <li class="menu_4">
                            <a class="menu_title_4">뉴스</a>
                        </li>
                        <li class="menu_5">
                            <a class="menu_title_4">이슈</a>
                        </li>
                        <li class="menu_6">
                            <a class="menu_title_4">토론</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</header>

<div class="main_container">
    home style
</div>
<footer>
    <div class="footer_container">
        <div class="footA">
            HYUK9
        </div>
        <div class="footB">
            Copyright &copy; 2022. HYUK9 All rights reserved.
        </div>
    </div>
</footer>


<script type="text/javascript">


</script>

</body>
</html>