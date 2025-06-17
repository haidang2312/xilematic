/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package BookingService;

import dao.BookingDAO;
import dao.IBookingService;
import java.util.List;
import model.CumRap;
import model.HeThongRap;
import model.LichChieu;
import model.RapPhim;

/**
 *
 * @author ASUS
 */
public class BookingServiceImp implements IBookingService{
   private BookingDAO bookingDAO;

    public BookingServiceImp() {
        this.bookingDAO = new BookingDAO();
    }
   

    @Override
    public List<HeThongRap> getAllHeThongRap() {
       return bookingDAO.getAllHeThongRap();
    }

    @Override
    public List<CumRap> getCumRapByHeThongRapId(int heThongRapId) {
        return bookingDAO.getCumRapByHeThongRapId(heThongRapId);
    }

    @Override
    public List<RapPhim> getRapByCumRapId(int cumRapId) {
        return bookingDAO.getRapByCumRapId(cumRapId);
    }

    @Override
    public List<LichChieu> getLichChieu(int maCumRap, int maPhim, String ngayChieu) {
        return bookingDAO.getLichChieu(maCumRap, maPhim, ngayChieu);
    }
    
}
