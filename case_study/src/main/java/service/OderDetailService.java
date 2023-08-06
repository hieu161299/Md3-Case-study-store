package service;

import model.OderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OderDetailService {
    Connection connection = ConnectToMySQL.getConnection();
    public void add(OderDetail oderDetail){
        String sql = "insert into oderdetail ( priceProduct, quantity, idProduct, idOder)\n" +
                "values (?,?,?,?);";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setFloat(1,oderDetail.getPriceProduct());
            preparedStatement.setInt(2,oderDetail.getQuantity());
            preparedStatement.setInt(3,oderDetail.getIdProduct());
            preparedStatement.setInt(4,oderDetail.getIdOder());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
