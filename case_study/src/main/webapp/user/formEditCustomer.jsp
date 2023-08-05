<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Đường dẫn tới tệp CSS Bootstrap -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 40px 20px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="password"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 16px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        p {
            font-size: 16px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <form action="http://localhost:8080/Users?action=editCustomer" method="post">
        <div class="mb-3">
            <label for="name">ID:</label>
            <input type="text" class="form-control" id="id" name="id" value="${user.id}" readonly required>
        </div>
        <div class="mb-3">
            <label for="name">Họ và tên:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="mb-3">
            <label for="age">Tuổi:</label>
            <input type="text" class="form-control" id="age" name="age" required>
        </div>
        <div class="mb-3">
            <label for="age">Địa chỉ:</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>
        <div class="mb-3">
            <label for="image">Ảnh đại diện:</label>
            <input type="text" class="form-control" id="image" name="image" required>
        </div>

        <button  class="btn btn-primary">Cập nhật</button>
    </form>
</div>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
