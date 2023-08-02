<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"> <!-- Đường dẫn tới tệp CSS Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

        .logo {
            width: 100px;
            height: 100px;
            margin: 0 auto;
            display: block;
            background-image: url("data:image/png;base64,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"); /* Đường dẫn tới hình ảnh logo */
            background-size: contain;
            background-repeat: no-repeat;
            margin-bottom: 20px;
        }

        .register-icon {
            width: 20px;
            height: 20px;
            margin-right: 5px;
            display: inline-block;
            background-image: url("https://img.freepik.com/premium-vector/register-sign-logo-template-illustration-design-vector-eps-10_822766-9488.jpg?w=360"); /* Đường dẫn tới biểu tượng đăng ký */
            background-size: cover;
            background-position: center;
            vertical-align: middle;
        }

        .register-link {
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
        }

        .register-link i {
            margin-right: 5px;
        }

        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container mt-5"> <!-- Sử dụng lớp "container" của Bootstrap để căn giữa nội dung -->
    <div class="logo"></div> <!-- Hiển thị logo -->
    <form action="http://localhost:8080/Users?action=login" method="post">
        <div class="mb-3">
            <label for="username">Tên đăng nhập:</label>
            <input type="text" id="username" name="username" required>
        </div>

        <div class="mb-3">
            <label for="password">Mật khẩu:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" name="checkuser">Đăng nhập</button>
    </form>
    <p>Chưa có tài khoản? <a href="RegisterServlet.jsp" class="register-link"><i class="fas fa-user-plus"></i>Đăng ký ngay</a></p>
</div>

<script src="js/bootstrap.min.js"></script> <!-- Đường dẫn tới tệp JavaScript Bootstrap (tùy chọn) -->
</body>
</html>
