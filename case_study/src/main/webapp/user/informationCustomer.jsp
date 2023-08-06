<%--
  Created by IntelliJ IDEA.
  User: ACER NITRO 5
  Date: 8/2/2023
  Time: 8:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <title>Profile</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f7f7f7;
      margin: 0;
      padding: 0;
    }

    .container {
      max-width: 1000px;
      margin: 0 auto;
      padding: 20px;
      background-color: #ffffff;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .user {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }

    .user-image {
      width: 150px;
      height: 150px;
      border-radius: 50%;
      object-fit: cover;
      margin-right: 20px;
    }

    .user-info {
      flex: 1;
    }

    .user-name {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .user-age {
      font-size: 18px;
      margin-bottom: 10px;
    }

    .user-address {
      font-size: 18px;
      margin-bottom: 10px;
    }

    .edit-link {
      font-size: 16px;
      color: #007bff;
      text-decoration: none;
    }

    .edit-link:hover {
      color: #0056b3;
    }

    .back-link {
      display: block;
      margin-bottom: 20px;
      font-size: 16px;
      color: #007bff;
      text-decoration: none;
    }

    .back-link:hover {
      color: #0056b3;
    }

    .home-icon {
      margin-right: 8px;
    }
  </style>
</head>
<body>
<div class="container">
  <a href="http://localhost:8080/view?action=findAll" class="back-link"><i class="fas fa-home home-icon"></i>Home Page</a>
  <div class="user">
    <img src="${user.image}" class="user-image" alt="Profile Image">
    <div class="user-info">
      <div class="user-name">${user.name}</div>
      <div class="user-age">Age: ${user.age}</div>
      <div class="user-address">Address: ${user.address}</div>
      <a href="http://localhost:8080/Users?action=editCustomer" class="edit-link">Update Profile</a>
    </div>
  </div>
</div>

<script src="js/bootstrap.min.js"></script>
</body>
</html>
