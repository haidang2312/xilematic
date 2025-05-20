<%-- Document : login Created on : May 18, 2025, 1:27:57 AM Author : ADMIN --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!--link css-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/login_style.css">
        <!--logo WEB-->
        <link rel="icon" type="logo" href="asset/download.png" />
    </head>

    <body>
        <div class="login-box">
            <form action="LoginServlet" method="POST">
                <input type="checkbox" class="input-check" id="input-check">
                <label for="input-check" class="toggle">
                    <span class="text off">off</span>
                    <span class="text on">on</span>
                </label>
                <div class="login-light"></div>

                <h2>Login</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></ion-icon></span>
                    <input type="text" required name="username">
                    <label>Username</label>
                    <div class="input-line"></div>
                </div>
                <div class="input-box">
                    <span class="icon"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" required name="password">
                    <label>Password</label>
                    <div class="input-line"></div>
                </div>

                <div class="remember-forgot">
                    <label><input type="checkbox">Remember me</label>
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit">Login</button>
                <!--<div class="error-message">${requestScope.errMsg}</div>-->
                <div class="register-link">
                    <p>Don't have an account? <a href="#">Register</a></p>
                </div>
            </form>
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        </div>


    </body>

</html>