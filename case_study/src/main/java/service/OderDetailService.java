package service;

import model.OderDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

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

    public List<OderDetail> getOderDetail(int idUer) {
        String sql = "select o.id,  p.image, p.name,  p.price,  od.quantity,  od.quantity * p.price from oder o\n" +
                "         join oderdetail od on o.id = od.idOder\n" +
                "         join products p on p.id = od.idProduct;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int idOder = resultSet.getInt("o.id");

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
}
