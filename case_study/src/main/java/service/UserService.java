package service;

import model.User;
import service.IService.IProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService  {
    Connection connection = ConnectToMySQL.getConnection();

    public void add(User user) {

    }

    public void delete(int id) {

    }

    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        String sql = "select  * from users;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String username = resultSet.getString("username");
                String password = resultSet.getString("username");
                String role = resultSet.getString("role");
                String name = resultSet.getString("name");
                int age = resultSet.getInt("age");
                String address = resultSet.getString("address");
                String image = resultSet.getString("image");
                User user = new User(id , username , password , role , name , age , address , image);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }


}
