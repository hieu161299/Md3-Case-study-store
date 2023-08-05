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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="../css/index.css" type="text/css">
    <style>
        image {
         width: 150px;
         height: 150px;
        }
    </style>
</head>

<body>
<%--<a href="http://localhost:8080/Users?action=information">thông tin cá nhân</a>
<a href="http://localhost:8080/Users?action=login">Đăng xuất</a>
<form action="/view" method="get">
    <input type="hidden" name="action" value="search">
    <input type="text" placeholder="search by name" name="nameSearch">
    <button>Tìm</button>
</form>
<a href="http://localhost:8080/view?action=showCart&idUser=${user.id}">Giỏ hàng của tôi</a>
<table border="1">
    <tr>
        <th>Ảnh</th>
        <th>Tên</th>
        <th>giá</th>

        <th colspan="2">Action</th>
    </tr>

    <c:forEach items="${productList}" var="product">

        <tr>
            <input type="hidden" name="pId" value="${product.id}">
            <td><img src="${product.image}" style="width: 150px ; height:  150px" alt="sv"></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>
                <form action="http://localhost:8080/oder">
                    <input type="hidden" name="action" value="addToCart">
                    <input type="hidden" name="idProduct" value="${product.id}">
                    <input type="hidden" name="idUser" value="${idUser}">
                    <button>Thêm vào giỏ hàng</button>
                </form>
            </td>
            <td>mua ngay</td>
        </tr>

    </c:forEach>

</table>--%>

<div class="container-fluid">
    <div class="col-12">
        <nav class="navbar navbar-expand-lg nav-bg" style="padding: 0 16px">
            <a href="/view?action=findAll">
                <img class="navbar-brand color-white" src="https://file.hstatic.net/1000129940/file/msi-gaming-logo-horizontal_grande.png" style="height: 60px"></img>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse d-flex justify-content-between " style=": white" id="navbarSupportedContent">
                <div class="dropdown">
                    <a class="btn btn-info dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
                        Thương hiệu
                    </a>

                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </div>
                <form class="form-inline my-2 my-lg-0 " action="/view" method="get">
                        <input type="hidden" name="action" value="search">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" name="nameSearch" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Tìm kiếm</button>
                </form>

            </div>
            <div class="ml-5">
                <a href="http://localhost:8080/view?action=showCart&idUser=${user.id}"><i class="fa-solid fa-cart-shopping" style="color: white ;font-size: 24px"></i></a>

            </div>
            <div class="ml-5">
                <a href="http://localhost:8080/Users?action=information"> <i class="fa-solid fa-user" style="color: white ;font-size: 24px"></i></a>

            </div>
            <div class="ml-5">
                <a href="http://localhost:8080/Users?action=login"><i class="fa-solid fa-right-from-bracket" style="color: white ;font-size: 24px">></i></a>
            </div>
        </nav>
    </div>

    <div class="col-12 mt-5 d-flex flex-wrap d-flex  d-flex justify-content-start">  <%--justify-content-between--%>
<c:forEach items="${productList}" var="product">
        <div class="card mb-3 " style="width: 25%;">
            <img src="${product.image}" class="card-img-top" alt="image.jpg">
            <div class="card-body">
                <h5 class="card-title">${product.name}</h5>
                <p class="card-text">${product.price}</p>
                <form action="http://localhost:8080/oder">
                        <input type="hidden" name="action" value="addToCart">
                        <input type="hidden" name="idProduct" value="${product.id}">
                        <input type="hidden" name="idUser" value="${idUser}">
                        <button class="btn btn-primary">Đặt hàng</button>
                </form>
            </div>
        </div>
</c:forEach>
    </div>
</div>

</body>
</html>
