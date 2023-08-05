<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>In</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<a href="http://localhost:8080/view?action=findAll">Quay về trang chủ</a>
<table border="1">
  <tr>
    <th>Ảnh</th>
    <th>Tên</th>
    <th>Tuổi</th>
    <th >Địa chỉ</th>
    <th >Action</th>
  </tr>

    <tr>
      <td><img src="${user.image}" style="width: 150px ; height:  150px" alt="sv"></td>
      <td>${user.name}</td>
      <td>${user.age}</td>
      <td>${user.address}</td>
      <td><a href="http://localhost:8080/Users?action=editCustomer">Sửa</a></td>
    </tr>
</table>
</body>
</html>
