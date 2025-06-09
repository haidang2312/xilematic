/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;
import model.Seat;

/**
 *
 * @author DELL
 */
public interface ISeatDAO {

    public List<Seat> selectSeatsByCinemaId(int cinemaId);
    
}
