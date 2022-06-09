<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-06-08
  Time: 오후 4:43
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
<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <span class="logo_container">
            <a href="main" class="text-dark">k-BB</a>
        </span>
        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
            <li class="nav-link px-2 ">Home</li>
            <li class="nav-link px-2 ">야 구</li>
            <li class="nav-link px-2 ">축 구</li>
            <li class="nav-link px-2 ">농 구</li>
            <li class="nav-link px-2 ">뉴 스</li>
            <li class="nav-link px-2 ">토 론</li>
        </ul>
        <div class="col-md-3 text-end">
            <button type="button" class="btn btn-outline-primary btn-sm">로그인</button>
            <button type="button" class="btn btn-primary btn-sm">회원가입</button>
        </div>
    </header>
</div>

</body>
</html>
