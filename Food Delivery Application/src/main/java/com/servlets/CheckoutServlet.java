package com.servlets;

import com.daoimplementation.OrderDaoImplementation;
import com.daoimplementation.OrderItemDaoImplementation;
import com.model.Cart;
import com.model.CartItem;
import com.model.Order;
import com.model.OrderItem;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Map;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(true);

        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null) {
            // 🔥 save redirect path
            session.setAttribute("redirectAfterLogin", "checkout.jsp");
            resp.sendRedirect("login.jsp");
            return;
        }


        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect("cart.jsp");
            return;
        }

        int restaurantId = (Integer) session.getAttribute("oldRestaurantId");
        String paymentMethod = req.getParameter("paymentMethod");

        // ---- ORDER LOGIC (UNCHANGED) ----
        Order order = new Order();
        order.setUserId(user.getUserId());
        order.setRestaurantId(restaurantId);
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setStatus("Pending");
        order.setPaymentMode(paymentMethod);

        double totalAmount = 0.0;
        for (CartItem item : cart.getItems().values()) {
            totalAmount += item.getTotalPrice();
        }
        order.setTotalAmount(totalAmount);

        OrderDaoImplementation orderDao = new OrderDaoImplementation();
        int orderId = orderDao.addOrder(order);

        OrderItemDaoImplementation orderItemDao = new OrderItemDaoImplementation();
        for (CartItem item : cart.getItems().values()) {
            OrderItem oi = new OrderItem();
            oi.setOrderId(orderId);
            oi.setMenuId(item.getItemId());
            oi.setTotalAmount(item.getTotalPrice());
            orderItemDao.addOrderItem(oi);
        }

        // cleanup
        session.removeAttribute("cart");
        session.removeAttribute("oldRestaurantId");

        // ✅ FINAL REDIRECT
        resp.sendRedirect("orders.jsp");
    }
}
