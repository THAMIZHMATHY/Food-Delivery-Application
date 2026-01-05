<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #121212;
            margin: 0;
            padding: 0;
            color: #e0e0e0;
        }

        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: #1e1e1e;
            padding: 30px 40px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
            border-radius: 12px;
        }

        h2 {
            color: #ffffff;
            margin-bottom: 25px;
            font-size: 28px;
            font-weight: 600;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #bbbbbb;
        }

        textarea,
        select,
        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #444;
            background-color: #2b2b2b;
            color: #ffffff;
            font-size: 16px;
        }

        textarea {
            resize: vertical;
            height: 100px;
        }

        input[type="submit"] {
            background-color: #fc8019;
            color: #ffffff;
            border: none;
            cursor: pointer;
            font-weight: 600;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #e76b00;
        }

        @media (max-width: 600px) {
            .container {
                margin: 20px;
                padding: 20px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Checkout</h2>

        <form action="checkout" method="post">

            <label for="address">Delivery Address:</label>
            <textarea id="address" name="address" required></textarea>

            <label for="paymentMethod">Payment Method:</label>
            <select name="paymentMethod" id="paymentMethod" required>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="Cash on Delivery">Cash on Delivery</option>
            </select>

            <input type="submit" value="Place Order">

        </form>
    </div>

</body>
</html>
