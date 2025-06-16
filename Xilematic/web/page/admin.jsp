<%-- 
    Document   : admin
    Created on : Jun 3, 2025, 8:23:52 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style/admin_style.css">
        <link rel="stylesheet" href="style/chart_style.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <!--handle login success-->
        <!--popup này sẽ xuất hiện khi đã đăng nhập thành công-->
        <c:if test="${requestScope.status}">
            <div id="autoPopup" class="popup-overlay">
                <div class="popup-content">
                    <span class="close-btn">&times;</span>
                    <div class="popup-header">
                        <h2>Chào mừng bạn!</h2>
                    </div>
                    <div class="popup-body">
                        <p>LOGIN SUCCESSFULLY</p>
                    </div>
                    <div class="countdown-container">
                        <div class="countdown-bar">
                            <div class="countdown-progress" id="countdownProgress"></div>
                        </div>
                        <div class="countdown-text"><span id="countdownText"></span></div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- header -->
        <header>
            <div class="logo"><img src="asset/image/LOGO.png" width="50px" height="300px" alt=""></div>
            <div class="search-container">
                <input type="text" placeholder="search" class="search" />
                <span class="search-icon"><ion-icon name="search"></ion-icon></span>
            </div>
            <div class="avatar">Hello, ${sessionScope.alias}</div>
        </header>


        <!-- main -->
        <div class="main">

            <nav class="nav-bar">
                <a href="paging?type=stats" class="nav-link"><span><ion-icon name="home"></ion-icon></span></a>
                <a href="paging?type=users" class="nav-link"><span><ion-icon name="person"></ion-icon></span></a>
                <a href="paging?type=movies" class="nav-link"><span><ion-icon name="film"></ion-icon></span></a>
            </nav>


            <div class="data">
                <c:if test="${requestScope.type != 'stats'}">
                    <button class="open-popup-btn" id="openPopupBtn" data-type="${param.type}">Add New</button>
                </c:if>

                <!--TH hien thi thong tin trong bang-->
                <c:choose>
                    <c:when test="${requestScope.type == 'stats'}">
                        <!--TH hien thi thong tin statistic-->
                        <div class="chart-container">
                            <div class="chart-title">Biểu đồ đường động với dữ liệu ngẫu nhiên</div>
                            <canvas id="myChart" style="height: 1000px;"></canvas>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!--TH hien thi thong tin table user , movie-->
                        <table>
                            <c:set var="isMovie" value="${requestScope.type == 'movies'}"/>
                            <thead>
                                <tr>
                                    <th>${isMovie ? "Movie name" : "Username"}</th>
                                    <th>${isMovie ? "Release Date" : "Fullname"}</th>
                                    <th>${isMovie ? "Rate" : "Email"}</th>
                                    <th>${isMovie ? "Hot" : "Phone number"}</th>
                                    <th>${isMovie ? "Status" : "Type"}</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${requestScope.type == 'movies'}">
                                        <c:forEach var="movie" items="${requestScope.list}">
                                            <tr>
                                                <td>${movie.movieName}</td>
                                                <td>${movie.releaseDate}</td>
                                                <td>${movie.rate}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${movie.hot}">
                                                            <input type="checkbox" checked="" disabled=""/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="checkbox" disabled=""/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${movie.status ? "Now showing" : "Coming soon"}</td>
                                                <td><a href="movie?action=showDetail&id=${movie.id}" class="detail">Detail</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:when test="${requestScope.type == 'users'}">
                                        <c:forEach var="user" items="${requestScope.list}">
                                            <tr>
                                                <td>${user.username}</td>
                                                <td>${user.fullname}</td>
                                                <td>${user.email}</td>
                                                <td>${user.phoneNumber}</td>
                                                <td>${user.typeOfUser}</td>
                                                <td><a href="" class="detail">Detail</a></td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>



                <!--Phan trang-->
                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="paging?type=${type}&page=${currentPage - 1}">Previous</a>
                    </c:if>

                    <c:if test="${totalPages < 5}">
                        <c:forEach  var="i" begin="1" end="${totalPages}" >
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <strong>${i}</strong>
                                </c:when>
                                <c:otherwise>
                                    <a href="paging?type=${type}&page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${totalPages >= 5}">                            
                        <c:forEach var="i" begin="${currentPage - 2 > 0 ? currentPage - 2 : 1}" end="${totalPages > currentPage + 2 ? currentPage + 2 : totalPages}" >
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <strong>${i}</strong>
                                </c:when>
                                <c:otherwise>
                                    <a href="paging?type=${type}&page=${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>

                    <c:if test="${currentPage < totalPages}">
                        <a href="paging?type=${type}&page=${currentPage + 1}">Next</a>
                    </c:if>
                </div>
            </div>
        </div>



        <!-- POPUP -->



        <!-- popup này sẽ xuất hiện khi ấn nút Add new -->





        <!-- popup này sẽ xuất hiện khi ấn nút Detail -->

        <script src="script/popup.js"></script>
        <script src="script/chart.js"></script>
        <!-- script để tương tác với popup -->
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
