package Models;

import DataBase.DbConnetion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HallModel {
    private int id;
    private String name;
    private String address;
    private String photo;
    private String timeOpen;
    private String timeClose;

    HallModel(){}
    private HallModel(int id,String name , String address , String photo , String timeOpen ,String timeClose){
        this.id = id;
        this.name = name;
        this.address = address;
        this.photo = photo;
        this.timeOpen = timeOpen;
        this.timeClose = timeClose;
    }

    public static HallModel getHallById(int id){
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("Select * from halls where Id = ?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return new HallModel(
                        resultSet.getInt("Id"),
                        resultSet.getString("Name"),
                        resultSet.getString("Address"),
                        resultSet.getString("PhotoPath"),
                        resultSet.getString("TimeOpen"),
                        resultSet.getString("TimeClose"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhoto() {
        return photo;
    }

    public String getTimeOpen() {
        return timeOpen;
    }

    public String getTimeClose() {
        return timeClose;
    }
}
