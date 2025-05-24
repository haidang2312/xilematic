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
                <input type="hidden" name="sourcePage" value="register"/>
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

                <div class="error-message">${requestScope.errorMsg}</div>

                <div class="submit-btn"><button type="submit">Register</button></div>


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