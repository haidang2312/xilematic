/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBConnect {

    //CRUD
    private static final String GET_ALL_USER = "SELECT * FROM NguoiDung";
    private static final String GET_USER_BY_USERNAME = "SELECT * FROM NguoiDung WHERE ten_tai_khoan = ?";
    private static final String INSERT_USER = """
                                              INSERT INTO [dbo].[NguoiDung]
                                                         ([ten_tai_khoan]
                                                         ,[ho_ten]
                                                         ,[email]
                                                         ,[so_dt]
                                                         ,[mat_khau]
                                                         ,[loai_nguoi_dung])
                                                   VALUES
                                                         (?,?,?,?,?,?)""";
    private static final String UPDATE_USER = """
                                              UPDATE [dbo].[NguoiDung]
                                                 SET [mat_khau] = ?
                                               WHERE ten_tai_khoan = ?""";
    private static final String DELETE_USER = "DELETE FROM NguoiDung WHERE ma_nguoi_dung = ?";

    //method
    public List<User> getAllUsers() {
        try {
            List<User> result = new ArrayList();

            PreparedStatement ps = c.prepareStatement(GET_ALL_USER);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                result.add(new User(rs.getInt("ma_nguoi_dung"),
                        rs.getString("ten_tai_khoan"),
                        rs.getString("ho_ten"),
                        rs.getString("email"),
                        rs.getString("so_dt"),
                        rs.getString("mat_khau"),
                        rs.getString("loai_nguoi_dung")
                ));
            }
            return result;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public User getUserByUsername(String username) {

        try {
            PreparedStatement ps = c.prepareStatement(GET_USER_BY_USERNAME);

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

            PreparedStatement ps = c.prepareStatement(INSERT_USER);

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

    public int updateUser(User o) {
        try {
            PreparedStatement ps = c.prepareStatement(UPDATE_USER);

            ps.setString(1, o.getPassword());
            ps.setString(2, o.getUsername());

            return ps.executeUpdate();
        } catch (SQLException ex) {
            return -1;
        }
    }

    public int deleteUser(int id) {
        try {
            PreparedStatement ps = c.prepareStatement(DELETE_USER);

            ps.setInt(1, id);

            return ps.executeUpdate();
        } catch (SQLException ex) {
            return -1;
        }
    }

}
