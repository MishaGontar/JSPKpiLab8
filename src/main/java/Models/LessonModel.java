package Models;

import DataBase.DbConnetion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LessonModel {
    private int id;
    private int hall_id;
    private int trainer_id;
    private int quantity;
    private String dateOfLesson;
    private String duration;
    private int price;
    private int gets;

    LessonModel() {
    }

    private LessonModel(int id, int hall_id, int trainer_id, int quantity, String dateOfLesson, String duration, int price, int gets) {
        this.id = id;
        this.hall_id = hall_id;
        this.trainer_id = trainer_id;
        this.quantity = quantity;
        this.dateOfLesson = dateOfLesson;
        this.duration = duration;
        this.price = price;
        this.gets = gets;
    }

    public static void addLesson(int hall_id, int trainer_id, int quantity, String date, int duration, int price) {
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO lessons (HAllid,TrainerId,Quantity,DateTimeOfLesson,Duration,Price) values (?,?,?,?,?,?)");
            preparedStatement.setInt(1, hall_id);
            preparedStatement.setInt(2, trainer_id);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setString(4, date);
            preparedStatement.setInt(5, duration);
            preparedStatement.setInt(6, price);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void removeLesson(int id) {
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE from lessons where Id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static ArrayList<LessonModel> getAllLessons() {
        ArrayList<LessonModel> lessonModels = new ArrayList<>();
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from lessons");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                lessonModels.add(new LessonModel(
                        resultSet.getInt("Id"),
                        resultSet.getInt("HallId"),
                        resultSet.getInt("TrainerId"),
                        resultSet.getInt("Quantity"),
                        resultSet.getString("DateTimeOfLesson"),
                        resultSet.getString("Duration"),
                        resultSet.getInt("Price"),
                        resultSet.getInt("gets")
                ));
            }
            System.out.println("It`s okay");
            return lessonModels;
        } catch (SQLException e) {
            System.out.println("NOOOOOOOOOOOOOOOO");
            e.printStackTrace();
        }
        return null;
    }

    public static void recordToLesson(int id_lesson, int id_user, int money) {
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO records (LessonId,UserId,Paid) values (?,?,?)");
            preparedStatement.setInt(1, id_lesson);
            preparedStatement.setInt(2, id_user);
            preparedStatement.setInt(3, money);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public int getId() {
        return id;
    }

    public String getHall_id() {
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT Name from halls where id = ?");
            preparedStatement.setInt(1,hall_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getString("Name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getTrainer_id() {
        Connection connection = DbConnetion.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT FName,LName from users where id = ?");
            preparedStatement.setInt(1,trainer_id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                return resultSet.getString("FName") +" "+ resultSet.getString("LName");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getDateOfLesson() {
        return dateOfLesson;
    }

    public String getDuration() {
        return duration;
    }

    public int getPrice() {
        return price;
    }

    public int getGets() {
        return gets;
    }
}
