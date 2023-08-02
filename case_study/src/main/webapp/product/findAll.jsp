<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 8:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <style>
        image {
         width: 150px;
            height: 150px;
        }
    </style>
</head>

<body>

<table border="1">
    <tr>
        <th>Ảnh</th>
        <th>Tên</th>
        <th>giá</th>

        <th colspan="2">Action</th>
    </tr>

    <c:forEach items="${productList}" var="product">

        <tr>
            <td><img src="${product.image}" style="width: 150px ; height:  150px" alt="sv"></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>Thêm vào giỏ hàng</td>
            <td>mua ngay</td>

        </tr>

    </c:forEach>

</table>

<form action="/view" method="get">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="search" name="nameSearch">
    <button>Tìm</button>
</form>
</body>
</html>
