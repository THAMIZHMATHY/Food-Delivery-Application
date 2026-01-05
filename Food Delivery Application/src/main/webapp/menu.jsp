<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List" %>
<%@ page import="com.model.Menu" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu | GourmetExpress | Premium Chennai Dining</title>
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

        .nav-links a:hover,
        .nav-links a.active {
            color: var(--primary);
            transform: translateY(-2px);
        }

        .nav-links .cart-btn {
            background: var(--primary);
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            box-shadow: 0 4px 15px rgba(255, 82, 82, 0.3);
            color: white;
        }

        .nav-links .cart-btn:hover {
            background: #ff3333;
            box-shadow: 0 6px 20px rgba(255, 82, 82, 0.5);
        }

        /* --- Menu Hero --- */
        .menu-hero {
            padding: 12rem 5% 4rem;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(15, 15, 15, 1)), url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            text-align: center;
        }

        .menu-hero h1 {
            font-size: 4rem;
            font-weight: 800;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #fff, #ff5252);
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .menu-hero p {
            font-size: 1.2rem;
            color: var(--text-dim);
            max-width: 600px;
            margin: 0 auto;
        }

        /* --- Container & Grid --- */
        .container {
            padding: 4rem 5% 8rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 3.5rem;
        }

        .section-header h2 {
            font-size: 2.2rem;
            position: relative;
        }

        .section-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60px;
            height: 4px;
            background: var(--primary);
            border-radius: 2px;
        }

        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2.5rem;
        }

        /* --- Menu Card --- */
        .menu-card {
            background: var(--card-bg);
            border-radius: 24px;
            overflow: hidden;
            border: 1px solid var(--glass-border);
            transition: var(--transition);
        }

        .menu-card:hover {
            transform: translateY(-10px);
            border-color: var(--primary);
            box-shadow: 0 15px 40px rgba(255, 82, 82, 0.1);
        }

        .card-img-container {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .card-img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: var(--transition);
        }

        .menu-card:hover .card-img {
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
            font-size: 1.3rem;
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

        .card-desc {
            font-size: 0.95rem;
            color: var(--text-dim);
            margin-bottom: 1.5rem;
            height: 60px;
            overflow: hidden;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 1rem;
            border-top: 1px solid var(--glass-border);
        }

        .price {
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--primary);
        }

        .add-to-cart {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.8rem 1.2rem;
            border-radius: 12px;
            cursor: pointer;
            font-weight: 600;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .add-to-cart:hover {
            background: #ff3333;
            transform: scale(1.05);
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

            .menu-hero h1 {
                font-size: 2.8rem;
            }
        }
    </style>
</head>

<body>

    <nav>
        <a href="index.html" class="logo">
            <i class="fas fa-utensils"></i> GourmetExpress
        </a>
        <div class="nav-links">
            <a href="restaurants"><i class="fas fa-home"></i> Home</a>
            <a href="menu.html" class="active"><i class="fas fa-utensils"></i> Menu</a>
            <a href="<%=request.getContextPath()%>/cart?action=view" class="cart-btn"><i class="fas fa-shopping-cart"></i> Cart</a>
            <a href="#"><i class="fas fa-sign-in-alt"></i> Login</a>
        </div>
    </nav>

    <header class="menu-hero">
        <div class="hero-content">
            <h1>Our Exquisite Menu</h1>
            <p>Savor the finest selection of global cuisines, curated for the discerning palate.</p>
        </div>
    </header>

    <main class="container">
        <div class="section-header">
            <h2>Chef's Recommendations</h2>
            <div class="filter-btns">
                <button class="filter-btn active" data-filter="all">All Items</button>
            </div>
        </div>

        <div class="menu-grid">
        
        <%
           List<Menu> menuList =(List<Menu>)request.getAttribute("menuList");
            		for(Menu menu:menuList){
            			
            			%>
            			<!-- 1. Classic Margherita Pizza -->
            <div class="menu-card">
                <div class="card-img-container">
                    <img src="<%=menu.getImagePath() %>"
                        alt="<%=menu.getItemName() %>" class="card-img">
                    
                </div>
                <div class="card-content">
                    <div class="card-header">
                        <h3 class="card-title"><%=menu.getItemName() %></h3>
                        <div class="rating"><i class="fas fa-star"></i> 4.8</div>
                    </div>
                    <p class="card-desc"><%=menu.getDescription() %></p>
                    <div class="card-footer">
                        <span class="price">₹<%=menu.getPrice() %></span>
                        
                        
                        <form action="cart">
                        
                            <input type="hidden" name="itemId" value="<%=menu.getMenuId() %>">
                            <input type="hidden" name="restaurantId" value="<%=menu.getRestaurantId() %>">
                            <input type="hidden" name="quantity" value="1">
                            <input type="hidden" name="action" value="add">
                            <input type="submit" 
                                   value="Add to Cart"
                                   style=" background: linear-gradient(135deg, #ff5252, #ff1744);
                                           color: #ffffff;
                                           border: none;
                                           padding: 10px 18px;
                                           border-radius: 14px;
                                           font-size: 14px;
                                           font-weight: 600;
                                           cursor: pointer;
                                           box-shadow: 0 6px 16px rgba(255, 82, 82, 0.4);
                                           transition: all 0.3s ease;"
    
                                   onmouseover="this.style.transform='scale(1.08)';this.style.boxShadow='0 10px 28px rgba(255,82,82,0.6)'"
                                   onmouseout="this.style.transform='scale(1)';this.style.boxShadow='0 6px 16px rgba(255,82,82,0.4)'"/>
            
                        </form>
                        
                        
                    </div>
                </div>
            </div>
           <%
            		}
        
        
        
        
        %>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            
            
        </div>
    </main>

    <footer>
        <p>&copy; 2026 GourmetExpress. All Rights Reserved. Crafted for Taste.</p>
    </footer>

    
</body>

</html>