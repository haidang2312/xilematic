
package service;

import dao.SeatDAO;
import java.util.List;
import model.Seat;


public class SeatService implements ISeatService{
    private SeatDAO seatDAO = new SeatDAO();
    @Override
    public List<Seat> getSeatsByCinemaId(int cinemaId) {
        return seatDAO.selectSeatsByCinemaId(cinemaId);
    }
    
}
