package service;

import model.User;
import service.IService.IProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService  {
    List <User> users = new ArrayList<>();
    Connection connection = ConnectToMySQL.getConnection();

    public void add(User user) throws SQLException {
        String query = "insert into store_group2.users( username, password, role, name , age , address ,image) values (?, ?, ?, ?, ?, ?, ?);";
        PreparedStatement statement = connection.prepareStatement(query);
        try {;
            statement.setString(1, user.getUsername());
            statement.setString(2,user.getPassword());
            statement.setString(3,user.getRole());
            statement.setString(4,user.getName());
            statement.setInt(5,user.getAge());
            statement.setString(6,user.getAddress());
            statement.setString(7,user.getImage());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int id) throws SQLException {
        String query = "delete from store_group2.users where id = ?;";
        PreparedStatement statement = connection.prepareStatement(query);
        try {
            statement.setInt(1,id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

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
                String password = resultSet.getString("password");
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
    public boolean checkUser(String userName, String password) {
        users = findAll();
        for (int i = 0; i < users.size(); i++) {
            if (userName.equals(users.get(i).getUsername()) && password.equals(users.get(i).getPassword())) {
                return true;
            }
        }
        return false;
    }
    public String getRole(String userName, String password) {
        String role = null;
        for (int i = 0; i < users.size(); i++) {
            if (userName.equals(users.get(i).getUsername()) && password.equals(users.get(i).getPassword())) {
                role = users.get(i).getRole();
                return role;
            }
        }
        return null;
    }
}
