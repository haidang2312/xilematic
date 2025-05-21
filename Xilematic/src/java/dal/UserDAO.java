/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBConnect {

    public User selectByUsername(String username) {

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

            ps.setString(1, username);
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

    public int insertUser(User o) {
        try {
            String sql = "INSERT INTO [dbo].[NguoiDung]\n"
                    + "           ([ten_tai_khoan]\n"
                    + "           ,[ho_ten]\n"
                    + "           ,[email]\n"
                    + "           ,[so_dt]\n"
                    + "           ,[mat_khau]\n"
                    + "           ,[loai_nguoi_dung])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?,?,?)";

            PreparedStatement ps = c.prepareStatement(sql);

            ps.setString(1, o.getUsername());
            ps.setString(2, o.getFullname());
            ps.setString(3, o.getEmail());
            ps.setString(4, o.getPhoneNumber());
            ps.setString(5, o.getPassword());
            ps.setString(6, o.getTypeOfUser());

            return ps.executeUpdate();
        } catch (SQLException ex) {
            return -1;
        }
    }

}
