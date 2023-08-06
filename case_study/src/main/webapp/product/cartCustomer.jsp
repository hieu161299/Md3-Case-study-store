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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/index.css" type="text/css">
    <style>
        img {
            width: 80px;
            height: 80px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-12">
            <nav class="navbar navbar-expand-lg nav-bg">
                <div class="col-4 d-flex justify-content-start">
                    <a class="navbar-brand color-white" href="http://localhost:8080/view?action=findAll">Home</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>
               <div class=" col-4 collapse navbar-collapse d-flex justify-content-end">
                   <a class="navbar-brand color-white" href="http://localhost:8080/oder?action=billCustomer">My Bill</a>
               </div>
                <div class=" col-4 collapse navbar-collapse d-flex justify-content-end" id="navbarSupportedContent">
                    <a class="navbar-brand color-white" href="http://localhost:8080/Users?action=information">MyAccount</a>

                </div>
            </nav>

            <table class="table" style="margin-top: 10px">
                <thead>
                <tr>
                    <div class="">
                        <th scope="col" class="d-flex justify-content-center">Ảnh</th>
                    </div>
                    <th scope="col">Tên sản phẩm</th>
                    <th scope="col">Giá</th>
                    <th scope="col">Số lượng</th>
                    <th scope="col">Thành tiền</th>
                    <th scope="col " colspan="2">Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${productList}" var="product">

                    <tr>

                        <th scope="row">
                            <div class="input-group ">
                                <div class=" input-group-prepend">

                                    <div >
                                        <img src="${product.image}" alt="image">

                                    </div>
                                </div>

                            </div>
                        </th>
                        <td>${product.name}</td>
                        <td>${product.price}$</td>
                        <td>${product.quantity}</td>
                        <td>${product.quantity * product.price}$</td>
                        <td>
                            <form action="/bill">
                                <input type="hidden" name="action" value="paymentProduct">
                                <input type="hidden" name="pId" value="${product.id}">
                                <button>thanh toán</button>
                            </form>
                        </td>
                        <td>
                            <form action="/delete-from-cart">
                                <input type="hidden" name="idProduct" value="${product.id}">
                                <button>Hủy</button>
                            </form>
                        </td>

                    </tr>

                </c:forEach>

                </tbody>
            </table>
            <div class="d-flex justify-content-end align-items-center">
                <div style="font-size: 20px">Tổng tiền</div>
                <div style="margin-left: 30px ; font-size: 20px ; font-weight: 600">${sum}$</div>
                <form action="/bill">
                    <input type="hidden" name="action" value="paymentAll">
                    <button class="btn btn-primary btn-lg" style="margin-left: 30px">Thanh toán</button>
                </form>


            </div>

        </div>


    </div>
</div>


</body>
</html>
