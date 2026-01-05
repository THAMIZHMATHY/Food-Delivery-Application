<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Food Delivery Application</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f8f9fa;
        margin: 0;
        padding: 0;
        text-align: center;
    }
    header {
        background: #ff5722;
        color: white;
        padding: 20px;
    }
    .container {
        margin-top: 60px;
    }
    .btn {
        display: inline-block;
        padding: 15px 30px;
        margin: 15px;
        text-decoration: none;
        color: white;
        background: #28a745;
        border-radius: 5px;
        font-size: 18px;
    }
    .btn:hover {
        background: #218838;
    }
    footer {
        margin-top: 80px;
        padding: 10px;
        background: #343a40;
        color: white;
    }
</style>

</head>
<body>

<header>
    <h1>🍔 Food Delivery Application</h1>
    <p>Order food from your favorite restaurants</p>
</header>

<div class="container">
    <h2>Welcome!</h2>
    <p>Please login or register to continue</p>

    <a href="login.jsp" class="btn">Login</a>
    <a href="register.jsp" class="btn">Register</a>
</div>

<footer>
    <p>© 2026 Food Delivery App | Built with JSP & Servlets</p>
</footer>

</body>
</html>
