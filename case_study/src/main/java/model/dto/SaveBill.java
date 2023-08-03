package model.dto;

import java.util.Date;

public class SaveBill {
    private int id;
    private String nameCustomer;
    private String nameProduct;
    private String category;
    private float total;
    private String time;

    public SaveBill(int id, String nameCustomer, String nameProduct, String category, float total, String time) {
        this.id = id;
        this.nameCustomer = nameCustomer;
        this.nameProduct = nameProduct;
        this.category = category;
        this.total = total;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}