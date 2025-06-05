/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.PageLink;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import userService.IUserService;
import userService.UserServiceImpl;

@WebServlet(name = "AuthenticateServlet", urlPatterns = {"/authenticate"})
public class AuthenticationServlet extends HttpServlet {

    private final IUserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (action != null) ? action : "";
        switch (action) {
            case "login":
                processLogin(request, response);
                break;
            case "register":
                processRegister(request, response);
                break;
            case "forgotPassword":
//                processForgotPassword(request, response);
                break;
            default:
        }
    }

    //process login
    private void processLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("rememberMe");
        var user = userService.login(username, password);

        if (user == null) {
            request.setAttribute("errorMsg", "Wrong username or password!");
            request.getRequestDispatcher(PageLink.LOGIN_PAGE).forward(request, response);
        } else {
            if (rememberMe != null) {
                processRememberMe(true, username, response);
            } else {
                processRememberMe(false, username, response);
            }
            HttpSession session = request.getSession();
            session.setAttribute("user_session", user);
            String[] namePart = user.getFullname().split(" ");
            String name = namePart[namePart.length - 1];
            request.setAttribute("alias", name);
            if (user.getTypeOfUser().equals("dev")) {
                response.sendRedirect("paging?type=users");
//                request.getRequestDispatcher(PageLink.ADMIN_PAGE).forward(request, response);
            } else {
                request.getRequestDispatcher(PageLink.HOME_PAGE).forward(request, response);
            }
        }
    }

    //process register
    private void processRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNum = request.getParameter("phoneNum");
        String msg = "";

        boolean status = userService.register(new User(username, fullname, email, phoneNum, password, "user"));
        msg = status ? "Register successfully!" : "This username existed!";
        request.setAttribute("msg", msg);
        request.getRequestDispatcher(PageLink.REGISTER_PAGE).forward(request, response);
    }

    //process remember me
    private void processRememberMe(boolean isChecked, String username, HttpServletResponse response) {
        Cookie cookieUsername;
        if (isChecked) {
            cookieUsername = new Cookie("USERNAME", username);
            cookieUsername.setMaxAge(24 * 60 * 60);
        } else {
            cookieUsername = new Cookie("USERNAME", "");
            cookieUsername.setMaxAge(0);
        }
        response.addCookie(cookieUsername);
    }

    //process log out
    private void processLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        session.invalidate();

        response.sendRedirect("login.jsp");
    }

    //process forgot password
//    private void processForgotPassword(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String flag = request.getParameter("action");
//        switch (flag) {
//            case "none" ->
//                getNewPassword(request, response);
//            case "existed" -> {
//                updateNewPassword(request, response);
//            }
//        }
//    }
    //get new password from user
//    private void getNewPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("input");
//        int isExist = 0;
//
//        User o = new UserDAO().getUserByUsername(username);
//
//        if (o != null) {
//            isExist = 1;
//        } else {
//            isExist = -1;
//        }
//        request.setAttribute("username", username);
//        request.setAttribute("isExist", isExist);
//        request.getRequestDispatcher(PageLink.FORGOT_PASSWORD_PAGE).forward(request, response);
//    }
    //update new password into DB
//    private void updateNewPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("input");
//        String newPassword = request.getParameter("password");
//
//        User newU = new User();
//        newU.setPassword(newPassword);
//        newU.setUsername(username);
//
//        if (new UserDAO().updateUser(newU) != -1) {
//            request.setAttribute("msg", "Changed new password successfully!");
//            request.getRequestDispatcher(PageLink.FORGOT_PASSWORD_PAGE).forward(request, response);
//        }
//
//    }
}
