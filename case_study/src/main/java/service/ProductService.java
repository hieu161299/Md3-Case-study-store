package service;

import model.Category;
import model.Product;
import service.IService.IProductService;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService<Product> {
    Connection connection = ConnectToMySQL.getConnection();
    @Override
    public void add(Product product) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        String sql = "select  products.* , c.name as nameCategory from products join category c on c.id = products.idCategory;";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                Float price = resultSet.getFloat("price");
                int quantity = resultSet.getInt("quantity");
                int idCategory = resultSet.getInt("idCategory");
                String nameCategory = resultSet.getString("nameCategory");
                Category category = new Category(idCategory , nameCategory);
                String image = resultSet.getString("image");

                Product product = new Product(id , name , quantity , price , category , image );
                productList.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }

    @Override
    public void edit(int id, Product product) {

    }

    public List<Product> findByName(String name) {
        List<Product> productList = findAll();
        List<Product> searchList = new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().toLowerCase().contains(name.toLowerCase())){
                System.out.println(productList.get(i).toString());
                searchList.add(productList.get(i));
            }
        }
        return searchList;
    }
}
