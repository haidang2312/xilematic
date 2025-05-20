/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBConnect {

    public User selectByUsername(User o) {

        try {
            String sql = "SELECT [ma_nguoi_dung]\n"
                    + "      ,[ten_tai_khoan]\n"
                    + "      ,[ho_ten]\n"
                    + "      ,[email]\n"
                    + "      ,[so_dt]\n"
                    + "      ,[mat_khau]\n"
                    + "      ,[loai_nguoi_dung]\n"
                    + "  FROM [dbo].[NguoiDung]\n"
                    + "WHERE ten_tai_khoan = ?";

            PreparedStatement ps = c.prepareStatement(sql);

            ps.setString(1, o.getUsername());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("ma_nguoi_dung"),
                        rs.getString("ten_tai_khoan"),
                        rs.getString("ho_ten"),
                        rs.getString("email"),
                        rs.getString("so_dt"),
                        rs.getString("mat_khau"),
                        rs.getString("loai_nguoi_dung"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }
    
    
    
    
    
    

}
