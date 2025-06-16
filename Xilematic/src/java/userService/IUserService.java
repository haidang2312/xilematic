/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package userService;

import java.util.List;
import model.User;

/**
 *
 * @author ADMIN
 */
public interface IUserService {

    public void insertUser(User user);

    public boolean register(User user);

    public User login(String username, String password);

    public User getUser(int id);

    public List<User> getAllUsers();

    public boolean deleteUser(int id);

    public boolean updateUser(User user);

    public boolean isUsernameExist(String username);

    public List<User> getUsersForPage(int currentPage, int pageSize);

    public int getTotalUsersCount();

}
