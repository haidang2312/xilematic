<<<<<<< HEAD
<%-- Document : register Created on : May 21, 2025, 2:28:01 PM Author : ADMIN --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTER</title>
        <link rel="stylesheet" href="style/register_style.css">
    </head>

    <body>
        <div class="login-box">
            <form action="authenticate" method="POST">
                <h2>Register</h2>
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></ion-icon></span>
                    <input type="text" required name="username">
                    <label>Username</p></label>
                </div>

                <div class="input-box">
                    <span class="icon"><ion-icon name="person-circle"></ion-icon></span>
                    <input type="text" required name="fullname">
                    <label>Fullname</label>
                </div>

                <div class="input-box">
                    <span class="icon" id="togglePassword" style="cursor: pointer;"><ion-icon
                            name="lock-closed"></ion-icon></span>
                    <input type="password" required name="password" id="password">
                    <label>Password</label>
                </div>

                <div class="input-box">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <input type="email" required name="email">
                    <label>Email</label>
                </div>

                <div class="input-box">
                    <span class="icon"><ion-icon name="call"></ion-icon></span>
                    <input type="number" required name="phoneNum">
                    <label>PhoneNumber</label>
                </div>

                <div class="error-message">${requestScope.w}</div>
                <div class="success-message">${requestScope.successMsg}</div>

                <div class="submit-btn"><button type="submit" name="action" value="register">Register</button></div>
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
=======
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="constant.PageLink"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REGISTER</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/style/register_style.css">
    </head>
    <body>
        <div class="login-box">
            <form action="<%=request.getContextPath()%>/authenticate" method="POST">
                <h2>Register</h2>
                <!-- Username Field -->
                <div class="input-box">
                    <span class="icon"><ion-icon name="person"></ion-icon></span>
                    <input type="text" required name="username" id="username" autofocus value="${username}">
                    <label>Username</label>
                    <span class="error-message" id="username-error">${errUsername}</span> <!-- Error message for Username -->
                </div>

                <!-- Fullname Field -->
                <div class="input-box">
                    <span class="icon"><ion-icon name="person-circle"></ion-icon></span>
                    <input type="text" required name="fullname" id="fullname" value="${fullname}">
                    <label>Fullname</label>
                    <span class="error-message" id="fullname-error">${errFullname}</span> <!-- Error message for Fullname -->
                </div>

                <!-- Email Field -->
                <div class="input-box">
                    <span class="icon"><ion-icon name="mail"></ion-icon></span>
                    <input type="email" required name="email" id="email" value="${email}">
                    <label>Email</label>
                    <span class="error-message" id="email-error">${errEmail}</span> <!-- Error message for Email -->
                </div>

                <!-- Phone Number Field -->
                <div class="input-box">
                    <span class="icon"><ion-icon name="call"></ion-icon></span>
                    <input type="tel" required name="phoneNum" id="phoneNum" value="${phoneNum}">
                    <label>Phone Number</label>
                    <span class="error-message" id="phoneNum-error">${errPhoneNumber}</span> <!-- Error message for Phone Number -->
                </div>

                <!-- Password Field -->
                <div class="input-box">
                    <span class="icon" id="togglePassword" style="cursor: pointer;"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" required name="password" id="password">
                    <label>Password</label>
                    <span class="error-message" id="password-error">${errPassword}</span> <!-- Error message for Password -->
                </div>

                <!-- Confirm Password Field -->
                <div class="input-box">
                    <span class="icon" id="toggleConfirmPassword" style="cursor: pointer;"><ion-icon name="lock-closed"></ion-icon></span>
                    <input type="password" required name="confirmPassword" id="confirmPassword">
                    <label>Confirm password</label>
                    <span class="error-message" id="password-error">${errConfirmPassword}</span> <!-- Error message for Password -->
                </div>
                <c:choose>
                    <c:when test="${requestScope.msg == null}">
                        <div class="submit-btn"><button type="submit" name="action" value="register">Register</button></div>
                    </c:when>
                    <c:otherwise>
                        <div class="submit-btn"><a href="<%=PageLink.LOGIN_PAGE%>">${msg}</a></div>
                        </c:otherwise>
                    </c:choose>
            </form>
        </div>
    </body>
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</html>
>>>>>>> origin/nguyen
