<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://ionic.io/ionicons">
        <link rel="stylesheet"
              href="<c:url value='/style/booking_style.css' />" />
    </head>
    <body>
        <header>
            <div class="header-logo">
                <div class="logo">
                    <a href="#"><img src="./img/LOGO.png" alt=""></a>
                </div>
                <div class="navbar">
                    <a href="#">Home</a>
                    <a href="#">News</a>
                    <a href="#">Booking</a>
                </div>
            </div>
            <div class="btn-authen">
                <button>Login</button>
                <button>Register</button>
            </div>
        </header>
        <div class="content">
            <div class="booking">
                <div class="screen">SCREEN</div>
                <div class="booking-seats">
                    <div class="row">
                        <button class="seat vip-seat" onclick="selectSeat('A1', 70000)">A1</button>
                        <div class="seat" onclick="selectSeat('A2', 45000)">A2</div>
                        <div class="seat" onclick="selectSeat('A3', 45000)">A3</div>
                        <div class="seat selected-seat" onclick="selectSeat('A4', 45000)">A4</div>
                        <div class="seat" onclick="selectSeat('A5', 45000)">A5</div>
                        <div class="seat" onclick="selectSeat('A6', 45000)">A6</div>
                        <div class="seat" onclick="selectSeat('A7', 45000)">A7</div>
                        <div class="seat" onclick="selectSeat('A8', 45000)">A8</div>
                        <div class="seat" onclick="selectSeat('A9', 45000)">A9</div>
                        <div class="seat" onclick="selectSeat('A10', 45000)">A10</div>
                    </div>
                    <div class="row">
                        <button class="seat vip-seat" onclick="selectSeat('B1', 70000)">B1</button>
                        <div class="seat" onclick="selectSeat('B2', 45000)">B2</div>
                        <div class="seat" onclick="selectSeat('B3', 45000)">B3</div>
                        <div class="seat selected-seat" onclick="selectSeat('B4', 45000)">B4</div>
                        <div class="seat" onclick="selectSeat('A5', 45000)">A5</div>
                        <div class="seat" onclick="selectSeat('B6', 45000)">B6</div>
                        <div class="seat" onclick="selectSeat('B7', 45000)">B7</div>
                        <div class="seat" onclick="selectSeat('B8', 45000)">B8</div>
                        <div class="seat" onclick="selectSeat('B9', 45000)">B9</div>
                        <div class="seat" onclick="selectSeat('B10', 45000)">B10</div>
                    </div>
                    <div class="row">
                        <button class="seat vip-seat" onclick="selectSeat('C1', 70000)">C1</button>
                        <div class="seat" onclick="selectSeat('C2', 45000)">C2</div>
                        <div class="seat" onclick="selectSeat('C3', 45000)">C3</div>
                        <div class="seat selected-seat" onclick="selectSeat('C4', 45000)">C4</div>
                        <div class="seat" onclick="selectSeat('C5', 45000)">C5</div>
                        <div class="seat" onclick="selectSeat('C6', 45000)">C6</div>
                        <div class="seat" onclick="selectSeat('C7', 45000)">C7</div>
                        <div class="seat" onclick="selectSeat('C8', 45000)">C8</div>
                        <div class="seat" onclick="selectSeat('C9', 45000)">C9</div>
                        <div class="seat" onclick="selectSeat('C10', 45000)">C10</div>
                    </div>
                    <div class="row">
                        <button class="seat vip-seat" onclick="selectSeat('D1', 70000)">D1</button>
                        <div class="seat" onclick="selectSeat('D2', 45000)">D2</div>
                        <div class="seat" onclick="selectSeat('D3', 45000)">D3</div>
                        <div class="seat selected-seat" onclick="selectSeat('D4', 45000)">D4</div>
                        <div class="seat" onclick="selectSeat('D5', 45000)">D5</div>
                        <div class="seat" onclick="selectSeat('D6', 45000)">D6</div>
                        <div class="seat" onclick="selectSeat('D7', 45000)">D7</div>
                        <div class="seat" onclick="selectSeat('D8', 45000)">D8</div>
                        <div class="seat" onclick="selectSeat('D9', 45000)">D9</div>
                        <div class="seat" onclick="selectSeat('D10', 45000)">D10</div>
                    </div>

                </div>
                <div class="note">
                    <div class="note-item">
                        <div class="available"></div>
                        <p>: Available</p>
                    </div>
                    <div class="note-item">
                        <div class="available selected"></div>
                        <p>: Selected</p>
                    </div>
                    <div class="note-item">
                        <div class="available selecting"></div>
                        <p>: Selecting</p>
                    </div>
                    <div class="note-item">
                        <div class="available vip"></div>
                        <p>: Vip seat</p>
                    </div>
                </div>
            </div>
            <div class="detail">
                <div class="detail-banner">
                    <img src="https://m.media-amazon.com/images/M/MV5BZWU4NDY0ODktOGI3OC00NWE1LWIwYmQtNmJiZWU3NmZlMDhkXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"
                         alt="Banner">
                </div>
                <h2>Until Dawn</h2>
                <p>Showtimes: <span>20.20.2020</span></p>
                <button onclick="openModal()">
                    <div class="btn-trailer">Trailer <span><ion-icon name="caret-forward-circle-outline"></ion-icon></span>
                    </div>
                </button>
            </div>
            <div class="ticket">
                <p id="selected-seats">Seat: None</p>
                <p id="total-price">Price: 0 VND</p>
                <p id="warning">Please select at least 1 seat to book!</p>
                <button class="btn-book" type="submit" onclick="submitBooking()">Book Now</button>
            </div>
        </div>
        <%@ include file="/components/footer.jsp" %>
        <div id="videoModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <iframe width="560" height="315" data-src="https://www.youtube.com/embed/2b3vBaINZ7w?si=6glL3LDE7O_V6tdV"
                        title="YouTube video player" frameborder="0"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
            <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

            <script src="<c:url value='/script/booking_js.js' />"></script>

    </body>
</html>
