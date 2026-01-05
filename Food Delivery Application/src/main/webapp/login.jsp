<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Login | GourmetExpress</title>
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
                padding: 0;
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
                padding: 20px;
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
                max-width: 400px;
                font-size: 0;
                /* Hide original HTML text */
                font-weight: 800;
                margin-bottom: 2rem;
                text-align: center;
                letter-spacing: -1.5px;
            }

            h2::before {
                content: "Login to place your orders!";
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
                padding: 45px 40px;
                border-radius: 32px;
                border: 1px solid var(--glass-border);
                box-shadow: var(--shadow);
                width: 100%;
                max-width: 400px;
                transition: var(--transition);
                text-align: center;
            }

            form:hover {
                border-color: rgba(255, 82, 82, 0.25);
                transform: translateY(-3px);
            }

            .input-group {
                margin-bottom: 25px;
                position: relative;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 15px 20px;
                background: rgba(255, 255, 255, 0.05);
                border: 1px solid var(--glass-border);
                border-radius: 14px;
                font-size: 16px;
                color: white;
                outline: none;
                transition: var(--transition);
                margin-bottom: 0;
                /* Override default */
            }

            input::placeholder {
                color: var(--text-dim);
                opacity: 0.7;
            }

            input:focus {
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
                margin-top: 10px;
            }

            button:hover {
                background: #ff3333;
                transform: scale(1.02);
                box-shadow: 0 8px 25px rgba(255, 82, 82, 0.4);
            }

            button:active {
                transform: scale(0.98);
            }

            /* Error message */
            p[style*="color:red"] {
                background: rgba(255, 82, 82, 0.1);
                color: #FF5252 !important;
                padding: 12px;
                border-radius: 10px;
                font-size: 14px;
                text-align: center;
                margin-top: 20px;
                border: 1px solid rgba(255, 82, 82, 0.2);
                width: 100%;
            }

            /* Register link */
            p:last-of-type {
                margin-top: 30px;
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

            /* Responsive Adjustments */
            @media (max-width: 480px) {
                form {
                    padding: 35px 25px;
                }

                h2 {
                    font-size: 2rem;
                }
            }
        </style>


    </head>

    <body>

        <h2>User Login</h2>


        <form action="login" method="post">

            <input type="text" name="username" placeholder="Username" required /><br><br>

            <input type="password" name="password" placeholder="Password" required /><br><br>

            <button type="submit">Login</button>

        </form>

        <% if (request.getAttribute("error") !=null) { %>
            <p style="color:red;">
                <%= request.getAttribute("error") %>
            </p>
            <% } %>


                <p>New user? <a href="<%=request.getContextPath()%>/register.jsp">Register</a></p>

    </body>

    </html>