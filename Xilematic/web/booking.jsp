<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Đặt Vé Xem Phim</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        /* CSS đơn giản để kết quả trông đẹp hơn */
        #lichChieuResult { margin-top: 20px; border-top: 1px solid #ccc; padding-top: 10px; }
        .suat-chieu-item { border: 1px solid #eee; padding: 10px; margin-bottom: 10px; border-radius: 5px; display: flex; justify-content: space-between; align-items: center; }
        .btn-chon-ghe { background-color: #007bff; color: white; padding: 5px 10px; text-decoration: none; border-radius: 4px; }
        .gio-chieu { color: #dc3545; font-size: 1.2em; }
    </style>
</head>
<body>

<h1>Đặt Vé Xem Phim</h1>
<p>Ngày hiện tại: <%= new java.text.SimpleDateFormat("dd/MM/yyyy").format(new java.util.Date()) %></p>

<%-- BỘ LỌC --%>
<div>
    <%-- 1. Chọn Hệ Thống Rạp --%>
    <select id="heThongRapSelect">
        <option value="">Chọn hệ thống rạp</option>
        <c:forEach items="${listHeThongRap}" var="htr">
            <option value="${htr.maHeThongRap}">${htr.tenHeThongRap}</option>
        </c:forEach>
    </select>

    <%-- 2. Chọn Cụm Rạp (sẽ được load bằng AJAX) --%>
    <select id="cumRapSelect">
        <option value="">Vui lòng chọn hệ thống rạp trước</option>
    </select>

    <%-- 3. Chọn Phim --%>
    <select id="phimSelect">
        <option value="">Chọn phim</option>
        <c:forEach items="${listPhim}" var="p">
            <option value="${p.id}">${p.movieName}</option>
        </c:forEach>
    </select>
    
    
    <%-- THÊM DÒNG NÀY VÀO (với ngày mặc định là hôm nay) --%>
    <input type="date" id="ngayChieuInput" value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>">

    <button id="btnXemLichChieu">Xem Lịch Chiếu</button>
</div>

<%-- KHU VỰC HIỂN THỊ LỊCH CHIẾU --%>
<div id="lichChieuResult">
    <%-- Kết quả lịch chiếu sẽ được hiển thị ở đây --%>
</div>


<script>
    $(document).ready(function() {
        // Bắt sự kiện khi người dùng thay đổi Hệ Thống Rạp
        $('#heThongRapSelect').change(function() {
            var heThongRapId = $(this).val();
            // Xóa kết quả lịch chiếu cũ
            $('#lichChieuResult').empty();
            if (heThongRapId) {
                $.ajax({
                    url: 'bookingServlet', // SỬA Ở ĐÂY
                    type: 'GET',
                    data: {
                        action: 'getCumRap',
                        heThongRapId: heThongRapId
                    },
                    success: function(data) {
                        $('#cumRapSelect').empty().append('<option value="">Chọn cụm rạp</option>');
                        $.each(data, function(index, cumRap) {
                            $('#cumRapSelect').append('<option value="' + cumRap.ma + '">' + cumRap.ten + '</option>');
                        });
                    },
                    error: function() {
                        alert('Lỗi khi tải cụm rạp.');
                    }
                });
            } else {
                $('#cumRapSelect').empty().append('<option value="">Vui lòng chọn hệ thống rạp trước</option>');
            }
        });
        
        // Bắt sự kiện khi click nút "Xem Lịch Chiếu"
        $('#btnXemLichChieu').click(function() {
            var maCumRap = $('#cumRapSelect').val();
            var maPhim = $('#phimSelect').val();
            var ngayChieu = $('#ngayChieuInput').val(); // Lấy ngày từ input

            if(!maCumRap || !maPhim || !ngayChieu) {
                alert("Vui lòng chọn đầy đủ Hệ thống rạp, Cụm rạp, Phim và Ngày chiếu!");
                return;
            }
            
            // Hiển thị loading...
            $('#lichChieuResult').html("<p>Đang tải lịch chiếu...</p>");

            $.ajax({
                url: 'bookingServlet', // SỬA Ở ĐÂY
                type: 'GET',
                data: {
                    action: 'getLichChieu',
                    maCumRap: maCumRap,
                    maPhim: maPhim,
                    ngayChieu: ngayChieu
                },
                success: function(responseHtml) {
                    $('#lichChieuResult').html(responseHtml);
                },
                error: function() {
                    $('#lichChieuResult').html("<p>Lỗi khi tải lịch chiếu.</p>");
                }
            });
        });
    });
</script>

</body>
</html>