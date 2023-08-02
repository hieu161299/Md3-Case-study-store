<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="Sum.css">
</head>
<body>

<section class="vh-100">
    <div class="container py-5 h-100">
        <div class="row d-flex align-items-center justify-content-center h-100" style="display: flex">
            <div class="col-md-8 col-lg-7 col-xl-6">
                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                     class="img-fluid" alt="Phone image">
            </div>
            <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1" style="margin-top: 150px">
                <form action="http://localhost:8080/Users?action=login" method="post">
                    <!-- username input -->
                    <div class="form-outline mb-4" style="width: 400px ; height: 35px ; display: flex"  >
                        <input type="text" name="username" id="form1Example13" placeholder="User Name" class="form-control form-control-lg" style="width: 70% ; height: 100% ; border-radius: 5px ; border: 0.1px gray solid" />
                        <label class="form-label" for="form1Example13" style="margin-left: 10px ; margin-top: 10px">Email address</label>
                    </div>

                    <!-- Password input -->
                    <div class="form-outline mb-4" style="width: 400px ; height: 35px ; margin-top: 10px ; display: flex" >
                        <input type="password" name="password" id="form1Example23" placeholder="Password" class="form-control form-control-lg" style="width: 70% ; height: 100% ; border-radius: 5px ; border: 0.1px gray solid"/>
                        <label class="form-label" for="form1Example23" style="margin-left: 10px ; margin-top: 10px">Password</label>
                    </div>

                    <div class="d-flex justify-content-around align-items-center mb-4" style="margin-top: 10px ; display: flex">
                        <!-- Checkbox -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" value="" id="form1Example3" checked />
                            <label class="form-check-label" for="form1Example3" > Remember me </label>
                        </div>
                        <a href="user/Register.jsp" style="margin-left: 20px">Forgot password?</a>
                    </div>

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-lg btn-block" style="width: 71% ; height: 37px ; border-radius: 5px ; background-color: #007bff ; color: white ; border: 0px white solid ; margin-top: 15px">Sign in</button>

                    <div class="divider d-flex align-items-center my-4" >
                        <p class="text-center fw-bold mx-3 mb-0 text-muted" style="margin-top: 15px ; width: 71% ; height: 37px ; text-align: center">OR</p>
                    </div>

                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #3b5998  ;color: white ; font-size: 18px ; width: 71% ; height: 37px ; display: block ; border: 0px white solid ; border-radius: 5px ; text-align: center ; text-decoration: none" href="https://www.facebook.com/"
                       role="button">
                        <i class="fab fa-facebook-f me-2" style="margin-top: 10px"></i>Continue with Facebook
                    </a>
                    <a class="btn btn-primary btn-lg btn-block" style="background-color: #55acee ;color: white ; font-size: 18px ; width: 71% ; height: 37px ; display: block ; border: 0px white solid ; border-radius: 5px ; text-align: center ; text-decoration: none ; margin-top: 15px" href="https://twitter.com/"
                       role="button">
                        <i class="fab fa-twitter me-2" style="margin-top: 10px "></i>Continue with Twitter</a>
                </form>
            </div>
        </div>
    </div>
</section>
</body>
</html>