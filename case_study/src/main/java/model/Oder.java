package model;

import java.util.Date;

public class Oder {
    private int id;
    private Date time;
    private int idUser;

    public Oder(int id, Date time, int idUser) {
        this.id = id;
        this.time = time;
        this.idUser = idUser;
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

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }
}
