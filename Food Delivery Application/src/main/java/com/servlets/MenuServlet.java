package com.servlets;

import com.dao.MenuDao;

import com.daoimplementation.MenuDaoImplementation;
import com.model.Menu;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    	int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

    	MenuDao menuDao = new MenuDaoImplementation();
    	List<Menu> menuList = menuDao.getMenuByRestaurantId(restaurantId);

    	request.setAttribute("menuList", menuList);
    	request.getRequestDispatcher("menu.jsp").forward(request, response);

    }
}

