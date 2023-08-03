package service.IService;

import java.sql.SQLException;
import java.util.List;

public interface IProductService<E>{
    void add(E e) throws SQLException;
    void delete(int id);
    List<E> findAll();
    void edit(int id , E e);
}
