<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<a href="http://localhost:8080/Users?action=information">thông tin cá nhân</a>
<a href="http://localhost:8080/Users?action=login">Đăng xuất</a>
<a href="http://localhost:8080/Users?action=registeradmin" class="delete-link"
   style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #b80000;">
    <i class="fas fa-trash-alt"></i>Thêm Admin
</a>
<a href="http://localhost:8080/view?action=findbill" class="delete-link"
   style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #b80000;">
    <i class="fas fa-trash-alt"></i>xem hóa đơn
</a>
<form action="/view" method="get">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="search" name="nameSearch">
    <button>Tìm</button>
</form>
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
            <td>${product.quantity}</td>
            <td>
                <a href="http://localhost:8080/view?action=edit&id=${product.id}" class="edit-link"
                   style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #252585;">
                    <i class="fas fa-edit"></i>Edit
                </a>
            </td>
            <td>
                <a href="http://localhost:8080/view?action=delete&id=${product.id}" class="delete-link"
                   style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #b80000;">
                    <i class="fas fa-trash-alt"></i>Delete
                </a>
            </td>

        </tr>
    </c:forEach>

</table>


</body>
</html>
