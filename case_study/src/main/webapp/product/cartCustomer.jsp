<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/3/2023
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--<html>
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

    <c:forEach items="${productList}" var="product">

        <tr>
            <input type="hidden" name="pId" value="${product.id}">
            <td><img src="${product.image}" style="width: 150px ; height:  150px" alt="sv"></td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.quantity}</td>

            <td>${product.quantity * product.price}</td>
            <td>Thanh toán</td>
        </tr>

    </c:forEach>

</table>

</body>
</html>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        @media screen and (max-width: 600px) {
            table#cart tbody td .form-control {
                width:20%;
                display: inline !important;
            }

            .actions .btn {
                width:36%;
                margin:5.5em 0;
            }

            .actions .btn-info {
                float:left;
            }

            .actions .btn-danger {
                float:right;
            }

            table#cart thead {
                display: none;
            }

            table#cart tbody td {
                display: block;
                padding: .6rem;
                min-width:300px;
            }

            table#cart tbody tr td:first-child {
                background: #00ffe1;
                color: #de8ccd;
            }

            table#cart tbody td:before {
                content: attr(data-th);
                font-weight: bold;
                display: inline-block;
                width: 10rem;
            }

            table#cart tfoot td {
                display:block;
            }
            table#cart tfoot td .btn {
                display:block;
            }
        }
    </style>

</head>
<body>

<h1 class="text-center">Giỏ hàng</h1>
<div class="container">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
        <tr>
            <th style="width:50%">Tên sản phẩm</th>
            <th style="width:10%">Giá</th>
            <th style="width:8%">Số lượng</th>
            <th style="width:22%" class="text-center">Thành tiền</th>
            <th style="width:10%"> </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${productList}" var="product">
            <td data-th="Product">
                <div class="row">
                    <div class="col-sm-2 hidden-xs"><img src="${product.image}" alt="Sản phẩm 1" class="img-responsive" width="300">
                    </div>
                    <div class="col-sm-10">
                        <h4 class="nomargin">${product.name}</h4>
                        <p>Mô tả: ngon bổ rẻ</p>
                    </div>
                </div>
            </td>
            <td data-th="Price">${product.price}</td>
            <td data-th="Quantity"><input class="form-control text-center" value="${product.quantity }" type="number" fdprocessedid="zd1qzs">
            </td>
            <td data-th="Subtotal" class="text-center">${product.quantity * product.price}</td>
            <td class="actions" data-th="">
                <button class="btn btn-info btn-sm" fdprocessedid="1f5nmqh"><i class="fa fa-edit"></i>Thanh toán
                </button>
                <button class="btn btn-danger btn-sm" fdprocessedid="m13h2e"><i class="fa fa-trash-o"></i>
                </button>
            </td>
            </tr>


        </c:forEach>
        <tr>


        </tbody><tfoot>
    <tr class="visible-xs">
        <td class="text-center"><strong>Tổng giá</strong>
        </td>
    </tr>
    <tr>
        <td><a href="" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
        </td>
        <td colspan="2" class="hidden-xs"></td>
        <td class="hidden-xs text-center"><strong>Tổng tiền thanh toán</strong>
        </td>
        <td><a href="" class="btn btn-success btn-block">Thanh toán <i class="fa fa-angle-right"></i></a>
        </td>
    </tr>
    </tfoot>
    </table>
</div>
</body>
</html>