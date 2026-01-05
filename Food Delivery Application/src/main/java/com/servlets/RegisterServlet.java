package com.servlets;

import com.dao.userDao;
import com.daoimplementation.userDaoImplementation;
import com.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String role = request.getParameter("role");

        User user = new User(username, password, email, address, role);

        userDaoImplementation userDao = new userDaoImplementation();
        userDao.addUser(user);

        response.sendRedirect("login.jsp");
    }
}

