<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="http://localhost:8080/Users?action=information">thông tin cá nhân</a>
<a href="http://localhost:8080/Users?action=login">Đăng xuất</a>
<form action="/view" method="get">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="search" name="nameSearch">
    <button>Tìm</button>
</form>
</body>
</html>
