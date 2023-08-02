<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 01/08/2023
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Đăng ký</title>
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
  <form action="RegisterServlet" method="post" enctype="multipart/form-data">
    <div class="mb-3">
      <label for="username">Tên đăng nhập:</label>
      <input type="text" class="form-control" id="username" name="username" required>
    </div>

    <div class="mb-3">
      <label for="password">Mật khẩu:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>

    <div class="mb-3">
      <label for="confirmPassword">Xác nhận mật khẩu:</label>
      <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
    </div>

    <!-- New fields for name, age, and image -->
    <div class="mb-3">
      <label for="name">Họ và tên:</label>
      <input type="text" class="form-control" id="name" name="name" required>
    </div>

    <div class="mb-3">
      <label for="age">Tuổi:</label>
      <input type="number" class="form-control" id="age" name="age" required>
    </div>

    <div class="mb-3">
      <label for="image">Ảnh đại diện:</label>
      <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
    </div>

    <button type="submit" class="btn btn-primary">Đăng ký</button>
  </form>
</div>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
