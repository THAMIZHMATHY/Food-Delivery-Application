package com.servlets;

import com.dao.RestaurantDao;
import com.daoimplementation.RestaurantDaoImplementation;
import com.model.Restaurant;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/restaurants")
public class RestaurantServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

      	RestaurantDaoImplementation Restaurantdao = new RestaurantDaoImplementation();
        List<Restaurant> allRestaurants=Restaurantdao.getAllRestaurants();
        
        request.setAttribute("allRestaurants", allRestaurants );
        RequestDispatcher rd=request.getRequestDispatcher("restaurants.jsp");
        rd.forward(request, response);
    }
}
