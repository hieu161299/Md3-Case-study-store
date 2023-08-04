<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 03/08/2023
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Revenue statistics</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .revenue-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            border-bottom: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .revenue-info .label {
            font-weight: bold;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<header>
    <h1>Revenue statistics</h1>
</header>
<div class="container">
    <a class="back-link" href="http://localhost:8080/view?action=findAll">Back to homepage</a>
    <h1>Revenue for the month ${month}: ${revenueMonth} USD $</h1>
    <div class="revenue-info">
        <span class="label">Turnover:</span>
        <span class="value">${revenueMonth} USD $ </span>
    </div>
    <!-- Các thông tin khác về doanh thu cho tháng có thể thêm ở đây -->
</div>
</body>
</html>
