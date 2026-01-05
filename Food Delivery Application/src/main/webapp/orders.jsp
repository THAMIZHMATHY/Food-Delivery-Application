<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Order Confirmed | GourmetExpress</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #FF5252;
                --success: #2ecc71;
                --bg-dark: #0F0F0F;
                --card-bg: rgba(26, 26, 26, 0.95);
                --text-main: #FFFFFF;
                --text-dim: #A0A0A0;
                --glass-border: rgba(255, 255, 255, 0.1);
                --shadow: 0 15px 45px rgba(0, 0, 0, 0.5);
                --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            * {
                box-sizing: border-box;
                font-family: 'Outfit', sans-serif;
            }

            body {
                margin: 0;
                padding: 0;
                min-height: 100vh;
                background: linear-gradient(rgba(15, 15, 15, 0.7), rgba(15, 15, 15, 0.9)),
                    url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1920&q=80');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                display: flex;
                justify-content: center;
                align-items: center;
                color: var(--text-main);
                overflow-x: hidden;
                padding: 20px;
            }

            .container {
                background: var(--card-bg);
                backdrop-filter: blur(25px);
                padding: 60px 40px;
                border-radius: 32px;
                border: 1px solid var(--glass-border);
                box-shadow: var(--shadow);
                width: 100%;
                max-width: 500px;
                text-align: center;
                animation: slideUp 0.8s ease-out;
            }

            @keyframes slideUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .success-icon {
                width: 100px;
                height: 100px;
                background: rgba(46, 204, 113, 0.1);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 30px;
                color: var(--success);
                font-size: 3rem;
                animation: scaleIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) 0.3s both;
            }

            @keyframes scaleIn {
                from {
                    transform: scale(0);
                }

                to {
                    transform: scale(1);
                }
            }

            h2 {
                font-size: 2.2rem;
                font-weight: 800;
                margin-bottom: 1rem;
                letter-spacing: -1px;
                background: linear-gradient(45deg, #fff, var(--primary));
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
            }

            p {
                color: var(--text-dim);
                font-size: 1.1rem;
                line-height: 1.6;
                margin-bottom: 2.5rem;
            }

            .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                padding: 16px 32px;
                background: var(--primary);
                color: #fff;
                text-decoration: none;
                font-weight: 700;
                border-radius: 14px;
                transition: var(--transition);
                box-shadow: 0 5px 20px rgba(255, 82, 82, 0.3);
                gap: 10px;
                width: 100%;
            }

            .btn:hover {
                background: #ff3333;
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(255, 82, 82, 0.4);
            }

            .btn:active {
                transform: scale(0.98);
            }

            @media (max-width: 480px) {
                .container {
                    padding: 40px 25px;
                }

                h2 {
                    font-size: 1.8rem;
                }
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="success-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h2>Order Successful!</h2>
            <p>Thank you for your order. Your delicious meal is being prepared and will be with you shortly.</p>
            <a href="restaurants" class="btn">
                <i class="fas fa-utensils"></i>
                Back to Restaurants
            </a>
        </div>
    </body>

    </html>