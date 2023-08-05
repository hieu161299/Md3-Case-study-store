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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            display: flex;
            justify-content: space-between;
        }

        nav {
            background-color: #444;
            color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-around;
        }

        nav a {
            color: #fff;
            text-decoration: none;
            padding: 5px 10px;
        }

        .container {
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
        .action-button {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 3px;
            text-align: center;
            text-decoration: none;
            color: #fff;
            background-color: #2E8B57; /* Change this color to your preferred color */
            border: none;
            cursor: pointer;
        }

        .action-button:hover {
            background-color: #3CB371; /* Change this color to the hover color you want */
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<header>
    <div style="display: flex; align-items: center; width: 30%">
        <a href="http://localhost:8080/Users?action=information" style="text-decoration: none; color: whitesmoke;">
            <h3>Information</h3>
        </a>
        <a href="http://localhost:8080/Users?action=registeradmin" class="delete-link">
            <i class="fas fa-user-plus" style="color: white; font-size: 30px; margin-left: 20px;"></i>
        </a>
    </div>
    <div style="width: 40%; text-align: center;">
        <h1>Admin Dashboard</h1>
    </div>
    <div style="display: flex; align-items: center; width: 30%">
        <div style="width: 50%; text-align: right;">
            <a href="http://localhost:8080/Users?action=login" style="text-decoration: none; color: white; margin-left: 350px">
                <i class="fas fa-sign-out-alt" style="font-size: 30px; margin-left: 20px;"></i>
            </a>
        </div>
    </div>
</header>
<nav>
    <a href="#products">Products</a>
    <a href="#categories">Categories</a>
    <a href="#income">Income</a>
    <a href="#invoices">Invoices</a>
</nav>
<div class="container">
    <section id="products">
        <div style="display: flex">
            <div>
                <form action="/view" method="post">
                    <input type="hidden" name="action" value="revenue">
                    <h3>Search Monthly Revenue</h3>
                    <input type="text" placeholder="search " name="revenue" style="height: 25px ; border-radius: 15px">
                    <button type="submit" class="action-button" style="background-color: #252585 ; color: white;padding: 5px 10px; height: 30px ; border-radius: 4px">
                        <i class="fas fa-search"></i> Search
                    </button>
                </form>
            </div>
            <div style="margin-left: 50px">
                <form action="/view" method="get">
                    <h3>Search Product</h3>
                    <input type="hidden" name="action" value="search">
                    <input type="text" placeholder="Search" name="nameSearch" style="width: 150px; height: 25px; border-radius: 15px;">
                    <button style="background-color: #252585 ; color: white;padding: 5px 10px; height: 30px ; border-radius: 4px ">
                        <i class="fas fa-search"></i> Search
                    </button>
                </form>
            </div>

        </div>

        <div style="display: flex; align-items: center;">
            <h2 style="flex: 1;">Product Management</h2>
            <a href="http://localhost:8080/view?action=findbill" class="delete-link" style="margin-right: 50px;background-color: #252585 ; color: white ; text-decoration: none;padding: 5px 10px;border-radius: 4px">
                <i class="fas fa-file-invoice-dollar"></i> Show Bill
            </a>
            <a href="http://localhost:8080/view?action=create" class="delete-link" style="margin-right: 900px ;background-color: #252585 ; color: white ; text-decoration: none;padding: 5px 10px;border-radius: 4px">
                <i class="fas fa-plus"></i> Add Product
            </a>
        </div>
        <table border="1">
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th colspan="2">Action</th>
            </tr>
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td><img src="${product.image}" style="width: 150px; height: 150px;" alt="Product"></td>
                    <td>${product.name}</td>
                    <td>${product.price}</td>
                    <td>${product.quantity}</td>
                    <td>
                        <a href="http://localhost:8080/view?action=edit&idProduct=${product.id}" class="edit-link"
                           style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #252585;">
                            <i class="fas fa-edit"></i>Edit
                        </a>
                    </td>
                    <td>
                        <a href="http://localhost:8080/view?action=delete&idProduct=${product.id}" class="delete-link"
                           style="display: inline-block; padding: 5px 10px; border-radius: 3px; text-align: center; text-decoration: none; color: #fff; background-color: #b80000;">
                            <i class="fas fa-trash-alt"></i>Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </section>
</div>
</body>
</html>

