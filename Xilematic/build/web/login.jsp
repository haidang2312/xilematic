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
            <form action="authenticate" method="POST">
                <input type="hidden" name="sourcePage" value="login"/>
                <h2>Login</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></ion-icon></span>
                    <input type="text" required name="username">
                    <label>Username</p></label>
                </div>

                <div class="input-box">
                    <span class="icon" id="togglePassword" style="cursor: pointer;"><ion-icon
                            name="lock-closed"></ion-icon></span>
                    <input type="password" required name="password" id="password">
                    <label>Password</label>
                </div>

                <div class="error-message">${requestScope.errorMsg}</div>

                <div class="remember-forgot">
                    <label><input type="checkbox">Remember me</label>
                    <a href="forgot_password.jsp">Forgot Password?</a>
                </div>

                <button type="submit">Login</button>

                <div class="login-with">
                    <a href=""><img
                            src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png"
                            alt="facebook"></a>
                    <a href=""><img
                            src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Google_Favicon_2025.svg/250px-Google_Favicon_2025.svg.png"
                            alt="google"></a>
                </div>

                <div class="register-link">
                    <p>Don't have an account? <a href="register.jsp">Register</a></p>
                </div>
            </form>
            <script>
                const passwordInput = document.getElementById('password');
                const togglePassword = document.getElementById('togglePassword');

                togglePassword.addEventListener('click', () => {
                    const type = passwordInput.getAttribute('type');
                    if (type === 'password') {
                        passwordInput.setAttribute('type', 'text');
                        togglePassword.innerHTML = '<ion-icon name="lock-open"></ion-icon>';
                    } else {
                        passwordInput.setAttribute('type', 'password');
                        togglePassword.innerHTML = '<ion-icon name="lock-closed"></ion-icon>';
                    }
                });
            </script>
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        </div>
    </body>

</html>