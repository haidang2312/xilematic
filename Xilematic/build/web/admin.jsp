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
    </head>
    <body>
        <!-- header -->
        <header>
            <div class="logo"><img src="asset/image/LOGO.png" width="50px" alt=""></div>
            <div class="search-container">
                <input type="text" placeholder="search" class="search" />
                <span class="search-icon"><ion-icon name="search"></ion-icon></span>
            </div>
            <div class="avatar">Hello, ${requestScope.alias}</div>
        </header>


        <!-- main -->
        <div class="main">

            <nav class="nav-bar">
                <a href="#" class="nav-link"><span><ion-icon name="home"></ion-icon></span></a>
                <a href="#" class="nav-link"><span><ion-icon name="person"></ion-icon></span></a>
                <a href="#" class="nav-link"><span><ion-icon name="film"></ion-icon></span></a>
            </nav>


            <div class="data">
                <button class="add-new-btn" id="btnAddNew">Add New</button>
                <table>
                    <thead>
                        <c:choose>
                            <c:when test="${requestScope.type == 'movies'}">
                                <tr>
                                    <th>Movie name</th>
                                    <th>Release Date</th>
                                    <th>Rate</th>
                                    <th>Hot</th>
                                    <th>Status</th>
                                    <th>More </th>
                                </tr>
                            </c:when>
                            <c:when test="${requestScope.type == 'users'}">
                                <tr>
                                    <th>Username</th>
                                    <th>Fullname</th>
                                    <th>Email</th>
                                    <th>Phone number</th>
                                    <th>Type</th>
                                    <th>More </th>
                                </tr>
                            </c:when>
                        </c:choose>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${requestScope.type == 'movies'}">
                                <c:forEach var="movie" items="${requestScope.list}">
                                    <tr>
                                        <td>Date 1</td>
                                        <td>Data 2</td>
                                        <td>Data 3</td>
                                        <td>Data 4</td>
                                        <td>Data 5</td>
                                        <td>
                                            <a href="" class="detail">Detail</a>
                                        </td>
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
                                        <td>
                                            <a href="" class="detail">Detail</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                    </tbody>
                </table>


                <div class="pagination">
                    <c:if test="${currentPage > 1}">
                        <a href="paging?type=${type}&page=${currentPage - 1}">Previous</a>
                    </c:if>

                    <c:if test="${totalPages < 5}">
                        <c:forEach  begin="1" end="${totalPages}" >
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
        <div id="popupOverlay">
            <form id="popupForm">
                <h2>Add New Movie</h2>
                <button type="button" id="popupClose">&times;</button>
                <div class="popup-content">
                    <input type="text" name="movieName" placeholder="Movie name" required />
                    <input type="text" name="trailer" id="" placeholder="Trailer">
                    <input type="text" name="image" id="" placeholder="Image">
                    <textarea name="description" placeholder="Description"></textarea>
                    <input type="date" name="releaseDate" required />
                    <input type="number" name="rate" placeholder="Rate" min="0" max="10" step="0.1" required />
                    <div class="checkbox-group">
                        <label for="hot">Hot</label>
                        <input type="checkbox" id="hot" name="hot" />
                    </div>
                    <select name="status" required>
                        <option value="" disabled selected>Status</option>
                        <option value="coming_soon">Coming Soon</option>
                        <option value="now_showing">Now Showing</option>
                    </select>
                    <input type="text" name="mainCharacter" id="" placeholder="Main character">
                    <input type="text" name="director" id="" placeholder="Director">
                </div>
                <button type="submit">Save</button>
            </form>
        </div>




        <!-- popup này sẽ xuất hiện khi ấn nút Detail -->
        <div id="popupDetailOverlay">
            <form id="popupDetail">
                <h2>Movie Details</h2>
                <button type="button" id="popupDetailClose">&times;</button>

                <div class="popup-content">
                    <div class="infor">
                        <div id="movieDetailsContent">
                            <input type="hidden" name="id" value="">
                            <div>
                                <label for="">Movie name</label>
                                <input required type="text" value="" name="movieName">
                            </div>
                            <div>
                                <label for="">Trailer</label>
                                <input required type="text" value="" name="trailer">
                            </div>
                            <div>
                                <label for="">Image</label>
                                <input required type="text" value="" name="image">
                            </div>
                            <div>
                                <label for="">Description</label>
                                <textarea name="description" placeholder="Description"></textarea>
                            </div>
                            <div>
                                <label for="">Release date</label>
                                <input required type="date" value="" name="releaseDate">
                            </div>
                            <div>
                                <label for="">Rate</label>
                                <input required type="text" value="" name="rate">
                            </div>
                            <div>
                                <label for="">Hot</label>
                                <input required type="checkbox" value="" name="hot">
                            </div>
                            <label for="">Status</label>
                            <select name="status" required>
                                <option value="" disabled selected></option>
                                <option value="coming_soon">Coming Soon</option>
                                <option value="now_showing">Now Showing</option>
                            </select>
                            <div>
                                <label for="">Main character</label>
                                <input required type="text" value="" name="mainCharacter">
                            </div>
                            <div>
                                <label for="">Director</label>
                                <input required type="text" value="" name="director">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="detail-actions">
                    <button type="submit" id="updateBtn" value="update">Update</button>
                    <button type="submit" id="deleteBtn" value="delete">Delete</button>
                </div>
            </form>
        </div>

        <!-- script để tương tác với popup -->
        <script>
            // Script để mở popup khi ấn nút "Add New"
            document.getElementById('btnAddNew').addEventListener('click', function () {
                document.getElementById('popupOverlay').style.display = 'flex';
            });

            // Script để mở popup khi ấn nút "Detail"
            document.querySelectorAll('.detail').forEach(function (detailBtn) {
                detailBtn.addEventListener('click', function () {
                    event.preventDefault();
                    document.getElementById('popupDetailOverlay').style.display = 'flex';
                });
            });

            // Đóng popup khi ấn nút đóng (×) ở popup "Add New"
            document.getElementById('popupClose').addEventListener('click', function () {
                document.getElementById('popupOverlay').style.display = 'none';
            });

            // Đóng popup khi ấn nút đóng (×) ở popup "Detail"
            document.getElementById('popupDetailClose').addEventListener('click', function () {
                document.getElementById('popupDetailOverlay').style.display = 'none';
            });

            // Đóng popup khi nhấn bên ngoài popup
            window.addEventListener('click', function (event) {
                if (event.target === document.getElementById('popupOverlay')) {
                    document.getElementById('popupOverlay').style.display = 'none';
                }
                if (event.target === document.getElementById('popupDetailOverlay')) {
                    document.getElementById('popupDetailOverlay').style.display = 'none';
                }
            });

        </script>


        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
    </body>
</html>
