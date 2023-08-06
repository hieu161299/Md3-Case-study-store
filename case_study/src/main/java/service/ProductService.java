package service;

import model.Category;
import model.Product;
import model.User;
import service.IService.IProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    static Connection connection = ConnectToMySQL.getConnection();

    @Override
    public void add(Product product) throws SQLException {
        String query = "insert into products( name, quantity, price, idCategory , image) values (?, ?, ?, ?, ?);";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, product.getName());
        statement.setInt(2, product.getQuantity());
        statement.setFloat(3, product.getPrice());
        statement.setInt(4, product.getCategory().getId());
        statement.setString(5, product.getImage());
        statement.executeUpdate();
    }

    @Override
    public void delete(int id) {
        String query = "delete from products where id = ?;";
        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        String sql = "select  products.* , c.name as nameCategory from products join category c on c.id = products.idCategory;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Float price = resultSet.getFloat("price");
                int quantity = resultSet.getInt("quantity");
                int idCategory = resultSet.getInt("idCategory");
                String nameCategory = resultSet.getString("nameCategory");
                Category category = new Category(idCategory, nameCategory);
                String image = resultSet.getString("image");

                Product product = new Product(id, name, quantity, price, category, image);
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public void edit(int id, Product product) {
        String sql = "update products set name = ?  , quantity = ? , price = ? , idCategory = ? , image = ?  where id = ?;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getQuantity());
            preparedStatement.setFloat(3, product.getPrice());
            preparedStatement.setInt(4, product.getCategory().getId());
            preparedStatement.setString(5, product.getImage());
            preparedStatement.setInt(6, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Product> findByName(String name) {
        List<Product> productList = findAll();
        List<Product> searchList = new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().toLowerCase().contains(name.toLowerCase())) {
                searchList.add(productList.get(i));
            }
        }
        return searchList;
    }

    public Product getById(int id) {
        Product product = null;
        for (int i = 0; i < findAll().size(); i++) {
            if (findAll().get(i).getId() == id){
                product = findAll().get(i);
                break;
            }
        }
        return product;
    }

    public float revenueMonth(int month) throws SQLException {
        String query = "SELECT SUM(products.price * oderdetail.quantity) AS revenue\n" +
                "                   FROM products\n" +
                "                   JOIN oderdetail ON products.id = oderdetail.idProduct\n" +
                "                   JOIN oder ON oder.id = oderdetail.idOder\n" +
                "                   WHERE MONTH(time) = ?;";

        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, month);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getFloat("revenue");
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    public int findIndexByID(List<Product> productList , int idProduct){
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == idProduct){
                return i;
            }
        }
        return -1;
    }
}
