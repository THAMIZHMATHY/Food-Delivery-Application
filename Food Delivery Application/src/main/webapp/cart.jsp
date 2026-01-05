<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.model.Cart" %>
<%@ page import="com.model.CartItem" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<style>
    body {
        background: #2f2f2f;
        font-family: Arial, sans-serif;
        color: #fff;
    }

    h1 {
        text-align: center;
        color: #ff6b6b;
        margin-top: 30px;
    }

    .cart-container {
        width: 70%;
        margin: 30px auto;
        background: #1f1f1f;
        padding: 25px;
        border-radius: 8px;
    }

    .cart-item {
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #444;
        padding: 15px 0;
    }

    .cart-item-details h3 {
        margin: 0;
        color: #ff6b6b;
    }

    .cart-item-details p {
        margin: 5px 0;
        color: #ccc;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .quantity-btn {
        background: #ff6b6b;
        color: white;
        border: none;
        padding: 5px 12px;
        font-size: 18px;
        cursor: pointer;
        border-radius: 5px;
    }

    .quantity-btn:disabled {
        background: #555;
        cursor: not-allowed;
    }

    .remove-btn {
        background: #ff4d4d;
        border: none;
        color: white;
        padding: 6px 12px;
        border-radius: 5px;
        cursor: pointer;
    }

    .total-section {
        text-align: right;
        margin-top: 20px;
        font-size: 18px;
        color: #ff6b6b;
    }

    .action-buttons {
        text-align: center;
        margin-top: 25px;
    }

    .btn {
        background: #ff6b6b;
        border: none;
        padding: 12px 20px;
        color: white;
        font-size: 16px;
        border-radius: 6px;
        cursor: pointer;
        margin: 10px;
        text-decoration: none;
        display: inline-block;
    }

    .btn-outline {
        background: transparent;
        border: 1px solid #ff6b6b;
    }
</style>

</head>
<body>

<h1>Your Cart</h1>

<div class="cart-container">

<%
    Cart cart = (Cart) session.getAttribute("cart");
    Integer restaurantId = (Integer) session.getAttribute("oldRestaurantId");

    if (cart != null && !cart.getItems().isEmpty()) {
        for (CartItem item : cart.getItems().values()) {
%>

    <div class="cart-item">

        <div class="cart-item-details">
            <h3><%= item.getName() %></h3>
            <p>Price: ₹<%= item.getPrice() %></p>
            <p>Total: ₹<%= item.getTotalPrice() %></p>
        </div>

        <div>
            <div class="quantity-controls">

                <!-- Increase -->
                <form action="cart" method="get">
                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="quantity" value="<%= item.getQuantity() + 1 %>">
                    <button class="quantity-btn">+</button>
                </form>

                <strong><%= item.getQuantity() %></strong>

                <!-- Decrease -->
                <form action="cart" method="get">
                    <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                    <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                    <button class="quantity-btn"
                        <%= item.getQuantity() == 1 ? "disabled" : "" %>>-</button>
                </form>

            </div>

            <!-- Remove -->
            <form action="cart" method="get" style="margin-top: 10px;">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
                <input type="hidden" name="action" value="remove">
                <button class="remove-btn">Remove</button>
            </form>
        </div>

    </div>

<%
        }
%>

    <div class="total-section">
        <strong>Grand Total: ₹<%= cart.getTotalPrice() %></strong>
    </div>

    <div class="action-buttons">
        <a href="menu?restaurantId=<%= restaurantId %>" class="btn btn-outline">Add More Items</a>
        <a href="checkout.jsp" class="btn">Proceed to Checkout</a>
    </div>

<%
    } else {
%>

    <p style="text-align:center; color:#ccc;">Your cart is empty.</p>

    <div class="action-buttons">
        <a href="restaurants" class="btn">Add Items</a>
    </div>

<%
    }
%>

</div>

</body>
</html>
