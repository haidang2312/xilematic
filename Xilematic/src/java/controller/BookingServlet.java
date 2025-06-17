package controller;

import BookingService.BookingServiceImp;
import jakarta.servlet.ServletConfig;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CumRap;
import model.HeThongRap;
import model.LichChieu;
import model.Movie;
import movieService.MovieServiceImpl;
import com.google.gson.Gson;

@WebServlet(name="BookingServlet", urlPatterns={"/bookingServlet"})
public class BookingServlet extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(BookingServlet.class.getName());
    private BookingServiceImp bookingService;
    private MovieServiceImpl movieService;

    @Override
    public void init() throws ServletException {
       bookingService = new BookingServiceImp();
       movieService = new MovieServiceImpl();
    }
   
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//        String action = request.getParameter("action");
//        if(action == null){
//          action = ""; // Mặc định là tải trang ban đầu
//        }
//        
//        switch (action) {
//            case "getCumRap":
//                getCumRap(request, response);
//                break;
//            case "getLichChieu":
//                getLichChieu(request, response);
//                break;            
//            default:
//                loadInitialPage(request, response);
//        }
//    }

    private void getCumRap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ... (Phần này của bạn đã đúng, có thể giữ nguyên hoặc dùng thư viện Gson cho sạch hơn)
        int heThongRapId = Integer.parseInt(request.getParameter("heThongRapId")) ;
       
        List<CumRap> listCumRap = bookingService.getCumRapByHeThongRapId(heThongRapId);
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        StringBuilder json = new StringBuilder("[");
//        for (int i = 0; i < listCumRap.size(); i++) {
//            CumRap cr = listCumRap.get(i);
//            json.append("{\"ma\":\"").append(cr.getMaCumRap()).append("\",\"ten\":\"").append(cr.getTenCumRap()).append("\"}");
//            if (i < listCumRap.size() - 1) {
//                json.append(",");
//            }
//        }
//        json.append("]");
//        out.print(json.toString());
//        out.flush();
    String json = new Gson().toJson(listCumRap);

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
    }

    private void getLichChieu(HttpServletRequest request, HttpServletResponse response)    
        throws ServletException, IOException {
   
        response.setContentType("text/html;charset=UTF-8");
   
        try (PrintWriter out = response.getWriter()) {
            int maCumRap = Integer.parseInt(request.getParameter("maCumRap")); 
            int maPhim = Integer.parseInt(request.getParameter("maPhim")); // Đọc đúng tên tham số "maPhim"
            String ngayChieu = request.getParameter("ngayChieu");

            List<LichChieu> listLichChieu = bookingService.getLichChieu(maCumRap, maPhim, ngayChieu);

            StringBuilder htmlBuilder = new StringBuilder();

            if (listLichChieu != null && !listLichChieu.isEmpty()) {
                htmlBuilder.append("<h3>Lịch chiếu có sẵn:</h3>");
                for (LichChieu lc : listLichChieu) {
                    String gioChieu = new java.text.SimpleDateFormat("HH:mm").format(lc.getNgayGioChieu());

                    htmlBuilder.append("<div class='suat-chieu-item'>");
                    // Giả sử LichChieu của bạn đã có tenRap và giaVe sau khi JOIN trong DAO
                    // htmlBuilder.append("<span>Phòng chiếu: <strong>").append(lc.getTenRap()).append("</strong></span>");
                    // htmlBuilder.append("<span>Giá vé: <strong>").append(lc.getGiaVe()).append(" VNĐ</strong></span>");
                    htmlBuilder.append("<span>Suất: <strong class='gio-chieu'>").append(gioChieu).append("</strong></span>");
                    htmlBuilder.append("<a href='seat-selection?lichChieuId=").append(lc.getMaLichChieu()).append("' class='btn-chon-ghe'>Chọn Ghế</a>");
                    htmlBuilder.append("</div>");
                }
            } else {
                htmlBuilder.append("<p>Rất tiếc, không có lịch chiếu phù hợp với lựa chọn của bạn.</p>");
            }
            out.print(htmlBuilder.toString());
       
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error in getLichChieu", e);
            response.getWriter().println("<p>Đã có lỗi xảy ra khi tải lịch chiếu. Vui lòng thử lại.</p>");
        }
    }

//    private void loadInitialPage(HttpServletRequest request, HttpServletResponse response) {
//        try {
//            List<HeThongRap> listHeThongRap = bookingService.getAllHeThongRap();
//            List<Movie> listPhim = movieService.getAllMovies();
//
//            request.setAttribute("listHeThongRap", listHeThongRap);
//            request.setAttribute("listPhim", listPhim);
//            request.getRequestDispatcher("booking.jsp").forward(request, response);
//        } catch (Exception ex) {
//            LOGGER.log(Level.SEVERE, "Error loading initial page", ex);
//        }
//    }
    // Thêm các dòng System.out.println() vào file BookingServlet.java của bạn

@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
    System.out.println("--- 1. doGet() CALLED ---"); // Checkpoint 1

    String action = request.getParameter("action");
    if(action == null){
      action = ""; 
    }
    
    System.out.println("--- 2. Action = '" + action + "' ---"); // Checkpoint 2
    
    switch (action) {
        case "getCumRap":
            getCumRap(request, response);
            break;
        case "getLichChieu":
            getLichChieu(request, response);
            break;            
        default:
            System.out.println("--- 3. Switch -> default case -> calling loadInitialPage() ---"); // Checkpoint 3
            loadInitialPage(request, response);
    }
}

private void loadInitialPage(HttpServletRequest request, HttpServletResponse response) {
    System.out.println("--- 4. INSIDE loadInitialPage() ---"); // Checkpoint 4
    try {
        List<HeThongRap> listHeThongRap = bookingService.getAllHeThongRap();
        List<Movie> listPhim = movieService.getAllMovies();

        // Checkpoint 5: Kiểm tra xem dữ liệu có bị null hoặc rỗng không
        System.out.println("--- 5. Data fetched: listHeThongRap size = " + (listHeThongRap != null ? listHeThongRap.size() : "null"));
        System.out.println("--- 5. Data fetched: listPhim size = " + (listPhim != null ? listPhim.size() : "null"));

        request.setAttribute("listHeThongRap", listHeThongRap);
        request.setAttribute("listPhim", listPhim);
        
        System.out.println("--- 6. Forwarding to booking.jsp... ---"); // Checkpoint 6
        request.getRequestDispatcher("booking.jsp").forward(request, response);
        
    } catch (Exception ex) {
        // Nếu có lỗi ở đây, nó sẽ được in ra
        LOGGER.log(Level.SEVERE, "--- ERROR in loadInitialPage ---", ex);
    }
}

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
    
    
}