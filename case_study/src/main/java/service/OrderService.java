package service;

import model.Oder;
import model.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class OrderService {
    Connection connection = ConnectToMySQL.getConnection();
    public void add(Oder oder)  {

    }
    public List<Oder> findAll(){
        return null;
    }

}
