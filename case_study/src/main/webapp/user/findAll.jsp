<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 8:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Tuổi</th>
        <th>Ảnh</th>
        <th colspan="2">Action</th>
    </tr>

    <%--<c:forEach items="${studentList}" var="student">

        <tr>
            <td>${student.id}</td>
            <td><a href="/students?action=detail&id=${student.id}">${student.name}</a></td>
            <td>${student.age}</td>
            <td><img src="${student.image}" alt="sv"></td>
            <td><a href="http://localhost:8080/students?action=edit&id=${student.id}">Sửa</a></td>
            <td><a href="http://localhost:8080/students?action=delete&id=${student.id}">Xóa</a></td>

        </tr>

    </c:forEach>--%>

</table>

<%--<form action="/students" method="get">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="search" name="nameSearch">
    <button>Tìm</button>
</form>--%>
</body>
</html>
