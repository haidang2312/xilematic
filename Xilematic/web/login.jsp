<%-- Document : login Created on : May 18, 2025, 1:27:57 AM Author : ADMIN --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="stylesheet" href="style/login_style.css">
            <title>JSP Page</title>
        </head>

        <body>
            <div class="container">
                <form action="" method="POST">
                    <p>LOGIN</p>
                    <div><input type="text" name="username"></div>
                    <div><input type="text" name="password"></div>
                    <div>
                        <div>
                            <input type="checkbox" name="remember" id="">
                            <label for="">Remember me</label>
                        </div>

                        <div>
                            <a href="">Forgot passord?</a>
                        </div>
                    </div>

                    <div>
                        <input type="submit" value="Login">
                        <div>
                            <div><img src="" alt=""></div>
                            <div><img src="" alt=""></div>
                        </div>
                    </div>
                    <div>
                        <label for="register">Don't have an account?</label>
                        <a href="">Register</a>
                    </div>
                </form>
            </div>
        </body>

        </html>