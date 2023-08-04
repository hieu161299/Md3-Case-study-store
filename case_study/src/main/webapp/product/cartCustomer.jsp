<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/3/2023
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="http://localhost:8080/view?action=findAll">Trờ về</a>
<p>Chi tiết giỏ hàng</p>
<table border="1">
    <tr>
        <th>Ảnh</th>
        <th>Tên</th>
        <th>giá</th>
        <th>Số lượng</th>
        <th>Thành tiền</th>
        <th colspan="">Action</th>
    </tr>

    <c:forEach items="${cartList}" var="cart">

        <tr>
            <input type="hidden" name="pId" value="${cart.product.id}">
            <input type="hidden" name="cartId" value="${cart.id}">
            <td><img src="${cart.product.image}" style="width: 150px ; height:  150px" alt="sv"></td>
            <td>${cart.product.name}</td>
            <td>${cart.product.price}</td>
            <td>${cart.quantity}</td>

            <td>${cart.quantity * cart.product.price}</td>
            <td>Thanh toán</td>
        </tr>

    </c:forEach>

</table>

</body>
</html>
