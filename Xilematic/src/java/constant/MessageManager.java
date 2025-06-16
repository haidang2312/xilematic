/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package constant;

import java.util.Locale;
import java.util.ResourceBundle;

/**
 *
 * @author ADMIN
 */
public class MessageManager {

    private static final ResourceBundle messages = ResourceBundle.getBundle("resources.messages.messages", Locale.getDefault());

    public static String getMessage(String key) {
        return messages.getString(key);
    }

    //test
    public static void main(String[] args) {
        System.out.println(MessageManager.getMessage("login.success"));
    }

}
