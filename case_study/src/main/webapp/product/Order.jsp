<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 03/08/2023
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Invoice</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .invoice {
      margin: 0 auto;
      max-width: 800px;
      padding: 20px;
      border: 1px solid #ccc;
    }
    .invoice header {
      border-bottom: 1px solid #ccc;
      padding-bottom: 20px;
      margin-bottom: 20px;
    }
    .invoice header h1 {
      font-size: 2.4em;
      margin: 0;
    }
    .invoice header p {
      font-size: 1.2em;
      color: #777;
      margin: 0;
    }
    .invoice .company-details {
      float: left;
      width: 50%;
    }
    .invoice .company-details h2 {
      margin: 0;
    }
    .invoice .client-details {
      float: right;
      width: 50%;
      text-align: right;
    }
    .invoice .client-details h2 {
      margin: 0;
    }
    .invoice .client-details p {
      margin: 0;
      color: #777;
    }
    .invoice table {
      width: 100%;
      border-collapse: collapse;
      border-spacing: 0;
      margin-bottom: 20px;
    }
    .invoice table td {
      padding: 10px;
      background: #eee;
      border-bottom: 1px solid #fff;
    }
    .invoice table th {
      padding: 10px;
      background: #ccc;
      border-bottom: 1px solid #fff;
    }
    .invoice table th:last-child, .invoice table td:last-child {
      border-right: 1px solid #fff;
    }
    .invoice table th.text-left {
      text-align: left;
    }
    .invoice table th.text-right, .invoice table td.text-right {
      text-align: right;
    }
    .invoice table th.text-center, .invoice table td.text-center {
      text-align: center;
    }
    .invoice table.total {
      border-top: 2px solid #ccc;
      border-bottom: 2px solid #ccc;
    }
    .invoice table.total td {
      font-weight: bold;
    }
    .invoice table.balance {
      margin-top: 40px;
    }
    .invoice table.balance td {
      padding: 10px;
      background: #eee;
      border-bottom: none;
    }
    @media print {
      .invoice {
        box-shadow: none;
        border: none;
        margin: 0;
        padding: 0;
      }
    }
  </style>
</head>
<body>
<div class="invoice">
  <header>
    <h1>Show Bill</h1>
  </header>
  <div class="company-details">
    <h2>TTSH</h2>
    <p>Ha Noi, Viet Nam</p>
    <p>Phone: (+84)3456-7890</p>
    <p>Email: Group2TTSH@gmail.com</p>
  </div>

  <table>
    <thead>
    <tr>
      <th class="text-left">Id bill</th>
      <th class="text-right">Name Customer</th>
      <th class="text-right">Name Product</th>
      <th class="text-right">Category</th>
      <th class="text-right">Total</th>
      <th class="text-right">Time</th>
    </tr>
    </thead>
    <c:forEach items="${saveBills}" var="saveBill">
      <tr>
        <td>${saveBill.id}</td>
        <td>${saveBill.nameCustomer}</td>
        <td>${saveBill.nameProduct}</td>
        <td>${saveBill.category}</td>
        <td>${saveBill.total} USD</td>
        <td>${saveBill.time}</td>
      </tr>
    </c:forEach>
</div>
</body>
</html>