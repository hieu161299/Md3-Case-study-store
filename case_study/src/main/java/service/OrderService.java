package service;

import model.Oder;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    Connection connection = ConnectToMySQL.getConnection();
    public void add(Oder oder)  {
        String sql = "insert into oder ( time, userId , status) values (? , ? , ?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1,oder.getTime());
            preparedStatement.setInt(2,oder.getIdUser());
            preparedStatement.setBoolean(3 , oder.isStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Oder> findAll(){
        List<Oder> oders = new ArrayList<>();
        String sql = "select * from oder;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String time = resultSet.getString("time");
                int userId = resultSet.getInt("userId");
                boolean status = resultSet.getBoolean("status");
                Oder oder = new Oder(id , time , userId , status );
                oders.add(oder);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return oders;
    }
    public void updateOderStatus( Oder oder){
        String sql = "update oder set status = ? where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setBoolean(1 , oder.isStatus());
            preparedStatement.setInt(2, oder.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
