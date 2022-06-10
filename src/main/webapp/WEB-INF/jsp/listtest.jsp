<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 2022-06-10
  Time: 오후 2:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>COVID-19 tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<div class = "container">

    <h1 class="display-4">SSG Lenders</h1>
    <p class="lead">등 말소 명단</p>


    <table class= "table">
        <tr>
            <th>등번호</th>
            <th>이 름</th>
            <th>유 형</th>
            <th>생년월일</th>
            <th>체격</th>

        </tr>
        <tr th:each = "stat : ${PlayerListDTO} ">
            <td th:text = "${stat.BackNumber}"> </td>
            <td th:text = "${stat.Name}">0</td>
            <td th:text = "${stat.Type}">0</td>
            <td th:text = "${stat.Birthday}">0</td>
            <td th:text = "${stat.Size}">0</td>
        </tr>
    </table>
</div>

</body>
</html>