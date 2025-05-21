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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO udao = new UserDAO();
        if (udao.selectByUsername(username) != null) {
            request.setAttribute("errorMsg", "This username existed!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            String password = request.getParameter("password");
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phoneNum = request.getParameter("phoneNum");
            User o = new User(0, username, fullname, email, phoneNum, password, "user");
            new UserDAO().insertUser(o);
            request.setAttribute("user", o);
            request.setAttribute("flag", "new");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

}
