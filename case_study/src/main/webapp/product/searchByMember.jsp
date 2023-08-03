<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${searchList.size()  == 0}">
  <p>Không có</p>
</c:if>
<c:if test="${searchList.size()  > 0}">
  <table border="1">
    <tr>
      <th>Ảnh</th>
      <th>Tên</th>
      <th>giá</th>

      <th colspan="2">Action</th>
    </tr>

    <c:forEach items="${searchList}" var="product">

      <tr>
        <td><img src="${product.image}" style="width: 150px ; height:  150px" alt="sv"></td>
        <td>${product.name}</td>
        <td>${product.price}</td>


      </tr>

    </c:forEach>
  </table>

</c:if>

<a href="view?action=findAll">Trở về trang chủ</a>
</body>
</html>
