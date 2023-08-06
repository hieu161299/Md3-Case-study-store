package model;

import java.util.Date;
import java.util.List;

public class Oder {
    private int id;
    private String time;
    private User customer;
    private int idUser;
    private boolean status;

    // thêm các trường để làm giỏ hàng


    public Oder(String time, User user) {
        this.time = time;
        this.idUser = idUser;
    }

    public Oder(String time, int idUser , boolean status) {
        this.time = time;
        this.idUser = idUser;
        this.status = status;
    }

    public Oder(int id, String time, int idUser, boolean status) {
        this.id = id;
        this.time = time;
        this.idUser = idUser;
        this.status = status;
    }

    public Oder() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
