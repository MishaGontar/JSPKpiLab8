package Models;

import DataBase.DbConnetion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserModel {
    private String phone;
    private String FName;
    private String LName;
    private int role;

    UserModel(){}

    private UserModel(String phone,String FName , String LName , int role){
        this.phone = phone;
        this.FName = FName;
        this.LName = LName;
        this.role = role;
    }
    public static UserModel getUserById(int id){
        try {
            Connection connection = DbConnetion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from users where id = ?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new UserModel(
                        resultSet.getString("Phone"),
                        resultSet.getString("FName"),
                        resultSet.getString("LName"),
                        resultSet.getInt("RoleId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static UserModel getUserByPhone(String phone){
        try {
            Connection connection = DbConnetion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from users where Phone = ?");
            preparedStatement.setString(1,phone);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new UserModel(
                        resultSet.getString("Phone"),
                        resultSet.getString("FName"),
                        resultSet.getString("LName"),
                        resultSet.getInt("RoleId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static void addUser(String email , String name , String lastName,String phone ,String password){
        try {
            Connection connection = DbConnetion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users (Email,FName,LName,Phone,PasswordHash) values (?,?,?,?,?)");
            preparedStatement.setString(1,email);
            preparedStatement.setString(2,name);
            preparedStatement.setString(3,lastName);
            preparedStatement.setString(4,phone);
            preparedStatement.setString(5,password);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static UserModel getUserByPhonePassword(String phone,String password){
        try {
            Connection connection = DbConnetion.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from users where Phone = ? and PasswordHash = ?");
            preparedStatement.setString(1,phone);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new UserModel(
                        resultSet.getString("Phone"),
                        resultSet.getString("FName"),
                        resultSet.getString("LName"),
                        resultSet.getInt("RoleId"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public static

    public String getPhone() {
        return phone;
    }

    public String getFName() {
        return FName;
    }

    public String getLName() {
        return LName;
    }

    public int getRole() {
        return role;
    }
}
