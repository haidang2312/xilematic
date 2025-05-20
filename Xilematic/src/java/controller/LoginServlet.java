/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        UserDAO userDao = new UserDAO();
        var user = userDao.selectByUsername(u);
        if (user != null && u.getPassword().equals(user.getPassword())) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            request.setAttribute("errMsg", "Wrong username or password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}
