/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import model.CumRap;
import model.HeThongRap;
import model.LichChieu;
import model.RapPhim;

/**
 *
 * @author ASUS
 */
public interface IBookingService {
    public List<HeThongRap> getAllHeThongRap();
    public List<CumRap> getCumRapByHeThongRapId(int heThongRapId);
    public List<RapPhim> getRapByCumRapId(int cumRapId);
    public List<LichChieu> getLichChieu(int maCumRap, int maPhim, String ngayChieu);
}
