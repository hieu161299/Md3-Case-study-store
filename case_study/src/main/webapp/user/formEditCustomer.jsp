<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            background: url("https://i.pinimg.com/originals/3d/c4/49/3dc449b04d9ace524a0ecd247e1fdc83.png");

            background-size: cover;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
            display: flex;
        }

        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-size: cover;
            background: url("https://vapa.vn/wp-content/uploads/2022/12/anh-background-001-1.jpg");
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }
        .avatar-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<header>
    <div style="width: 31%">
    </div>
    <div style="width: 31%">
        <h1>Edit Profile</h1>
    </div>
    <div style="width: 31%">
        <a href="http://localhost:8080/Users?action=information" style="text-decoration: none; color: whitesmoke ; float: right">
            <h3>Exit</h3>
        </a>
    </div>

</header>
<div class="container">
    <form action="http://localhost:8080/Users?action=editCustomer" method="post">
        <div class="avatar-container">
            <img src="${user.image}" class="avatar" alt="Profile Image" style="width: 150px;height: 150px;border-radius: 50%;">
        </div>
        <div class="mb-3">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="id" name="id" value="${user.id}" readonly required>
        </div>
        <div class="mb-3">
            <label for="name">Full Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="mb-3">
            <label for="age">Age</label>
            <input type="text" class="form-control" id="age" name="age" required>
        </div>
        <div class="mb-3">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" name="address" required>
        </div>
        <div class="mb-3">
            <label for="image">Image Avatar</label>
            <input type="text" class="form-control" id="image" name="image" required>
        </div>

        <button class="update-button">
            <i class="fas fa-save"></i> Update
        </button>
    </form>
</div>
</body>
</html>
