package com.servlets;

import com.dao.userDao;
import com.daoimplementation.userDaoImplementation;
import com.model.User;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {

	    String username = req.getParameter("username");
	    String password = req.getParameter("password");

	    userDaoImplementation dao = new userDaoImplementation();
	    User user = dao.getUserByUsernameAndPassword(username,password);

	    if (user != null && user.getPassword().equals(password)) {

	        HttpSession session = req.getSession(true);
	        session.setAttribute("user", user);

	        // 🔥 resume previous action
	        String redirect = (String) session.getAttribute("redirectAfterLogin");

	        if (redirect != null) {
	            session.removeAttribute("redirectAfterLogin");
	            resp.sendRedirect(redirect);
	        } else {
	            resp.sendRedirect("restaurant");
	        }

	    } else {
	        req.setAttribute("error", "Invalid username or password");
	        req.getRequestDispatcher("login.jsp").forward(req, resp);
	    }
	}

}
