<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GourmetExpress | Premium Food Delivery Chennai</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #FF5252;
            --secondary: #2D3436;
            --accent: #FFD93D;
            --bg-dark: #0F0F0F;
            --card-bg: #1A1A1A;
            --text-main: #FFFFFF;
            --text-dim: #A0A0A0;
            --glass: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
            --transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Outfit', sans-serif;
        }

        body {
            background-color: var(--bg-dark);
            color: var(--text-main);
            overflow-x: hidden;
            line-height: 1.6;
        }

        /* --- Custom Scrollbar --- */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--bg-dark);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 10px;
        }

        /* --- Navigation Bar --- */
        nav {
            position: fixed;
            top: 0;
            width: 100%;
            padding: 1.5rem 5%;
            background: rgba(15, 15, 15, 0.8);
            backdrop-filter: blur(20px);
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid var(--glass-border);
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary);
            letter-spacing: -1px;
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 2.5rem;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-main);
            font-weight: 500;
            font-size: 1.1rem;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .nav-links a:hover {
            color: var(--primary);
            transform: translateY(-2px);
        }

        .nav-links .cart-btn {
            background: var(--primary);
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(255, 82, 82, 0.3);
        }

        .nav-links .cart-btn:hover {
            background: #ff3333;
            color: white;
            box-shadow: 0 6px 20px rgba(255, 82, 82, 0.5);
        }

        /* --- Hero Section --- */
        .hero {
            padding: 12rem 5% 5rem;
            text-align: center;
            position: relative;
        }

        .hero h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #fff, #ff5252);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero p {
            font-size: 1.2rem;
            color: var(--text-dim);
            max-width: 600px;
            margin: 0 auto 2rem;
        }

        /* --- Restaurant Grid --- */
        .container {
            padding: 2rem 5% 5rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3rem;
        }

        .section-header h2 {
            font-size: 2rem;
            position: relative;
        }

        .section-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 50px;
            height: 4px;
            background: var(--primary);
            border-radius: 2px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2.5rem;
        }

        /* --- Restaurant Card --- */
        .card {
            background: var(--card-bg);
            border-radius: 24px;
            overflow: hidden;
            border: 1px solid var(--glass-border);
            transition: var(--transition);
            position: relative;
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .card:hover {
            transform: translateY(-10px);
            border-color: var(--primary);
            box-shadow: 0 15px 40px rgba(255, 82, 82, 0.1);
        }

        .card-img-container {
            position: relative;
            height: 220px;
            width: 100%;
            overflow: hidden;
            background: #111;
            /* Fallback background for loading */
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Placeholder icon while loading or if broken */
        .card-img-container::before {
            content: '\f2e7';
            /* Utensils icon */
            font-family: 'Font Awesome 6 Free';
            font-weight: 900;
            font-size: 3rem;
            color: #222;
            position: absolute;
            z-index: 1;
        }

        .card-img {
            height: 100%;
            width: 100%;
            object-fit: cover;
            position: relative;
            z-index: 2;
            transition: var(--transition);
        }

        .card:hover .card-img {
            transform: scale(1.1);
        }

        .card-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: var(--primary);
            color: white;
            padding: 5px 12px;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 700;
            z-index: 3;
        }

        .card-content {
            padding: 1.5rem;
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.8rem;
        }

        .card-title {
            font-size: 1.4rem;
            font-weight: 700;
        }

        .rating {
            background: #2ECC71;
            color: white;
            padding: 4px 10px;
            border-radius: 8px;
            font-weight: 700;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .card-info {
            display: flex;
            gap: 15px;
            font-size: 0.9rem;
            color: var(--text-dim);
            margin-bottom: 1rem;
        }

        .card-info span {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .card-desc {
            font-size: 0.95rem;
            color: var(--text-dim);
            margin-bottom: 1.5rem;
            height: 45px;
            overflow: hidden;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-top: 1px solid var(--glass-border);
            padding-top: 1rem;
        }

        .location {
            font-size: 0.85rem;
            color: var(--text-dim);
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .order-btn-pseudo {
            color: var(--primary);
            font-weight: 600;
            transition: var(--transition);
        }

        .card:hover .order-btn-pseudo {
            letter-spacing: 1px;
        }

        /* --- Footer --- */
        footer {
            padding: 4rem 5%;
            background: #080808;
            border-top: 1px solid var(--glass-border);
            text-align: center;
            color: var(--text-dim);
        }

        /* --- Responsive --- */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
            }

            .hero h1 {
                font-size: 2.8rem;
            }

            .grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

    <nav>
        <a href="#" class="logo">
            <i class="fas fa-utensils"></i> GourmetExpress
        </a>
        <div class="nav-links">
            <a href="#"><i class="fas fa-home"></i> Home</a>
            <a href="#"><i class="fas fa-user"></i> Profile</a>
            <a href="<%=request.getContextPath()%>/cart.jsp" class="cart-btn"><i class="fas fa-shopping-cart"></i> Cart </a>
            <a href="<%=request.getContextPath()%>/login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
        </div>
    </nav>

    <section class="hero">
        <h1>Chennai's Finest Dining Delivered</h1>
        <p>Experience world-class cuisine from the best restaurants across Chennai, delivered with precision and care to
            your doorstep.</p>
    </section>

    <main class="container">
        <div class="section-header">
            <h2>Popular in Chennai</h2>
        </div>

        <div class="grid">
        
        <%
        List<Restaurant> allRestaurants =(List<Restaurant>)request.getAttribute("allRestaurants");
        
        for(Restaurant restaurant: allRestaurants){
        	%>
        	
        	<a href="menu?restaurantId=<%=restaurant.getRestaurantId() %>" class="card">
        	
        	
        	
        	
        	
            <div class="card-img-container">
                <img src="<%=restaurant.getImagePath() %>"
                    alt="<%=restaurant.getName() %>" class="card-img">
                
            </div>
            <div class="card-content">
                <div class="card-header">
                    <h3 class="card-title"><%=restaurant.getName() %></h3>
                    <div class="rating"><i class="fas fa-star"></i> <%=restaurant.getRating() %></div>
                </div>
                <div class="card-info">
                    <span><i class="fas fa-clock"></i> <%=restaurant.getDeliveryTime() %></span>
                </div>
                <p class="card-desc"><%=restaurant.getCuisineType() %></p>
                <div class="card-footer">
                    <div class="location"><i class="fas fa-map-marker-alt"></i> <%=restaurant.getAddress() %></div>
                    
                </div>
            </div>
        </a>

        	<%     
        }
        
        
        
        
        %>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            
            
            
        </div>
    </main>

    <footer>
        <p>&copy; 2026 GourmetExpress. Chennai's No. 1 Food Delivery. </p>
    </footer>

</body>

</html>