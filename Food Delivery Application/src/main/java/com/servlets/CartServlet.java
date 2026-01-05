package com.servlets;

import com.dao.MenuDao;
import com.daoimplementation.MenuDaoImplementation;
import com.model.Cart;
import com.model.CartItem;
import com.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    HttpSession session = request.getSession();
	    Cart cart = (Cart) session.getAttribute("cart");

	    if (cart == null) {
	        cart = new Cart();
	        session.setAttribute("cart", cart);
	    }

	    String action = request.getParameter("action");

	    // ✅ VIEW CART (from navbar)
	    if (action == null || action.equals("view")) {
	        response.sendRedirect("cart.jsp");
	        return;
	    }

	    // ✅ Now safely read restaurantId (only for add/update/remove)
	    String restaurantIdStr = request.getParameter("restaurantId");
	    if (restaurantIdStr != null) {
	        int restaurantId = Integer.parseInt(restaurantIdStr);
	        Integer oldRestaurantId = (Integer) session.getAttribute("oldRestaurantId");

	        if (oldRestaurantId == null || oldRestaurantId != restaurantId) {
	            cart.clear();
	            session.setAttribute("oldRestaurantId", restaurantId);
	        }
	    }

	    if (action.equals("add")) {
	        addItemToCart(request, cart);
	    } else if (action.equals("update")) {
	        updateItemOfCart(request, cart);
	    } else if (action.equals("remove")) {
	        deleteItemFromCart(request, cart);
	    }

	    response.sendRedirect("cart.jsp");
	}
    


	private void addItemToCart(HttpServletRequest request, Cart cart) {
		int itemId= Integer.parseInt(request.getParameter("itemId"));
		int quantity= Integer.parseInt(request.getParameter("quantity"));
		MenuDaoImplementation menuDaoImplementation=new MenuDaoImplementation();
		Menu menu=menuDaoImplementation.getMenu(itemId);
		String itemName=menu.getItemName();
		Double itemPrice=menu.getPrice();
		CartItem cartItem=new CartItem(itemId, itemName, itemPrice, quantity);
		cart.addItem(cartItem);
		
		
	}


	private void updateItemOfCart(HttpServletRequest request, Cart cart) {
		int itemId= Integer.parseInt(request.getParameter("itemId"));
		int quantity= Integer.parseInt(request.getParameter("quantity"));
		cart.updateItem(itemId, quantity);
		
	}


	private void deleteItemFromCart(HttpServletRequest request, Cart cart) {
		int itemId= Integer.parseInt(request.getParameter("itemId"));
		cart.removeItem(itemId);
	}


}
