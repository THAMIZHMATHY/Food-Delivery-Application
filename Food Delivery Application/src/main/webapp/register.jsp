<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Register | GourmetExpress</title>
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #FF5252;
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
                padding: 40px 20px;
                min-height: 100vh;
                background: linear-gradient(rgba(15, 15, 15, 0.7), rgba(15, 15, 15, 0.9)),
                    url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1920&q=80');
                background-size: cover;
                background-position: center;
                background-attachment: fixed;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                color: var(--text-main);
                overflow-x: hidden;
                animation: fadeIn 0.8s ease-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(10px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            h2 {
                width: 100%;
                max-width: 450px;
                font-size: 0;
                /* Hide original HTML text */
                font-weight: 800;
                margin-bottom: 2rem;
                text-align: center;
                letter-spacing: -1.5px;
            }

            h2::before {
                content: "Join the GourmetExpress family!";
                font-size: 2.2rem;
                background: linear-gradient(45deg, #fff, var(--primary));
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                display: block;
                line-height: 1.2;
            }

            form {
                background: var(--card-bg);
                backdrop-filter: blur(25px);
                padding: 40px 35px;
                border-radius: 32px;
                border: 1px solid var(--glass-border);
                box-shadow: var(--shadow);
                width: 100%;
                max-width: 450px;
                transition: var(--transition);
            }

            form:hover {
                border-color: rgba(255, 82, 82, 0.25);
                transform: translateY(-3px);
            }

            label {
                display: block;
                text-align: left;
                margin-bottom: 8px;
                font-size: 0.9rem;
                color: var(--text-dim);
                font-weight: 600;
                letter-spacing: 0.5px;
                padding-left: 5px;
            }

            input[type="text"],
            input[type="password"],
            input[type="email"],
            textarea {
                width: 100%;
                padding: 12px 18px;
                background: rgba(255, 255, 255, 0.05);
                border: 1px solid var(--glass-border);
                border-radius: 12px;
                font-size: 15px;
                color: white;
                outline: none;
                transition: var(--transition);
                margin-bottom: 0;
                /* Reset for better control with <br> */
            }

            textarea {
                height: 80px;
                resize: none;
                line-height: 1.5;
            }

            input:focus,
            textarea:focus {
                background: rgba(255, 255, 255, 0.08);
                border-color: var(--primary);
                box-shadow: 0 0 20px rgba(255, 82, 82, 0.15);
            }

            button {
                width: 100%;
                padding: 16px;
                background: var(--primary);
                border: none;
                color: #fff;
                font-size: 17px;
                border-radius: 14px;
                cursor: pointer;
                font-weight: 700;
                transition: var(--transition);
                box-shadow: 0 5px 20px rgba(255, 82, 82, 0.3);
                letter-spacing: 0.5px;
                margin-top: 15px;
            }

            button:hover {
                background: #ff3333;
                transform: scale(1.02);
                box-shadow: 0 8px 25px rgba(255, 82, 82, 0.4);
            }

            button:active {
                transform: scale(0.98);
            }

            /* Spacing for those <br> tags */
            br {
                display: block;
                content: "";
                margin: 5px 0;
            }

            /* Footer link */
            p:last-of-type {
                margin-top: 25px;
                font-size: 15px;
                color: var(--text-dim);
                text-align: center;
            }

            a {
                color: var(--primary);
                font-weight: 600;
                text-decoration: none;
                transition: var(--transition);
                margin-left: 5px;
            }

            a:hover {
                color: white;
                text-decoration: underline;
            }

            /* Hide the hidden role field's impact */
            input[type="hidden"]+br {
                display: none;
            }
        </style>
    </head>

    <body>

        <h2>User Registration</h2>

        <form action="register" method="post">
            <label>Username</label><br>
            <input type="text" name="username" required><br><br>

            <label>Password</label><br>
            <input type="password" name="password" required><br><br>

            <label>Email</label><br>
            <input type="email" name="email" required><br><br>

            <label>Address</label><br>
            <textarea name="address" required></textarea><br><br>

            <input type="hidden" name="role" value="Customer">

            <button type="submit">Register</button>
        </form>

        <p>Already have an account? <a href="login.jsp">Login</a></p>

    </body>

    </html>