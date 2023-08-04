package model;

import java.util.Date;
import java.util.List;

public class Oder {
    private int id;
    private Date time;
    private User customer;

    // thêm các trường để làm giỏ hàng

    private List<Product> productList;
    private int quantityOder;

    public Oder(List<Product> productList, int quantityOder) {
        this.productList = productList;
        this.quantityOder = quantityOder;
    }

    public List<Product> getProductList() {
        return productList;
    }

    public void setProductList(List<Product> productList) {
        this.productList = productList;
    }

    public int getQuantityOder() {
        return quantityOder;
    }

    public void setQuantityOder(int quantityOder) {
        this.quantityOder = quantityOder;
    }
    //

    public Oder() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }


}
