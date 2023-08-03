package service;

import model.dto.SaveBill;

import java.sql.*;
import java.util.AbstractList;
import java.util.ArrayList;
import java.sql.Timestamp;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
public class OrderDetailsJDBC {
    public List<SaveBill> findBill() {
        String jdbcUrl = "jdbc:mysql://localhost:3306/store_group2";
        String username = "root";
        String password = "123456";
        AbstractList <SaveBill> saveBills = new ArrayList<>();
        try {
            Connection connection = DriverManager.getConnection(jdbcUrl, username, password);
            String sqlQuery = "SELECT oder.id AS order_id, users.name AS customer_name,\n" +
                    "                    products.name AS product_name, category.name AS product_category,\n" +
                    "                    SUM(products.price * oderdetail.quantity) AS total_amount,oder.time as time\n" +
                    "                    FROM oder\n" +
                    "                    JOIN oderdetail ON oder.id = oderdetail.idOder\n" +
                    "                    JOIN products ON products.id = oderdetail.idProduct\n" +
                    "                    JOIN users ON users.id = oder.userId\n" +
                    "                    JOIN category ON category.id = products.idCategory\n" +
                    "                    GROUP BY oder.id, users.name, products.name, category.name;";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sqlQuery);
            while (resultSet.next()) {
                int orderId = resultSet.getInt("order_id");
                String customerName = resultSet.getString("customer_name");
                String productName = resultSet.getString("product_name");
                String productCategory = resultSet.getString("product_category");
                float totalAmount = resultSet.getFloat("total_amount");
                String time = String.valueOf(resultSet.getDate("time"));
                SaveBill saveBill = new SaveBill(orderId,customerName,productName,productCategory,totalAmount,time);
                saveBills.add(saveBill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return saveBills;
    }
}
