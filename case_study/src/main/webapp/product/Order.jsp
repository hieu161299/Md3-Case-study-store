<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 03/08/2023
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Order</title>
</head>
<body>
<table border="1">
  <tr>
    <th>Mã đơn hàng</th>
    <th>Tên khách hàng</th>
    <th>tên sản phẩm</th>
    <th>Loại Sản Phẩm</th>
    <th>Trị giá đơn hàng</th>
    <th>Ngày đặt hàng</th>
  </tr>

  <c:forEach items="${saveBills}" var="saveBill">
    <tr>
      <td>${saveBill.id}</td>
      <td>${saveBill.nameCustomer}</td>
      <td>${saveBill.nameProduct}</td>
      <td>${saveBill.category}</td>
      <td>${saveBill.total}</td>
      <td>${saveBill.time}</td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
