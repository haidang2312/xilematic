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

@WebServlet(name = "AuthenticateServlet", urlPatterns = {"/authenticate"})
public class AuthenticationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String source = request.getParameter("sourcePage");
        if ("login".equals(source)) {
            processLogin(request, response);
        } else if ("register".equals(source)) {
            processRegister(request, response);
        } else {
            processForgotPassword(request, response);
        }
    }

    //process login
    private void processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserDAO userDao = new UserDAO();
        var user = userDao.getUserByUsername(username);

        if (user == null) {
            request.setAttribute("errorMsg", "This user does not exist!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else if (!password.equals(user.getPassword())) {
            request.setAttribute("errorMsg", "Wrong password!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("user", user);
            request.setAttribute("flag", "old");
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
    }

    //process register
    private void processRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        UserDAO udao = new UserDAO();
        if (udao.getUserByUsername(username) != null) {
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

    //process forgot password
    private void processForgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flag = request.getParameter("action");
        switch (flag) {
            case "none" ->
                getNewPassword(request, response);
            case "existed" -> {
                updateNewPassword(request, response);
            }
        }
    }

    //get new password from user
    private void getNewPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("input");
        int isExist = 0;

        User o = new UserDAO().getUserByUsername(username);

        if (o != null) {
            isExist = 1;
        } else {
            isExist = -1;
        }
        request.setAttribute("username", username);
        request.setAttribute("isExist", isExist);
        request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
    }

    //update new password into DB
    private void updateNewPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("input");
        String newPassword = request.getParameter("password");

        User newU = new User();
        newU.setPassword(newPassword);
        newU.setUsername(username);

        if (new UserDAO().updateUser(newU) != -1) {
            request.setAttribute("msg", "Changed new password successfully!");
            request.getRequestDispatcher("forgot_password.jsp").forward(request, response);
        }

    }

}
