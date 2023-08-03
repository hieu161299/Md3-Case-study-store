package service.IService;

import java.util.List;

public interface ICategoryService<E> {
    void add(E e);
    void delete(int id);
    List<E> findAll();
    void edit(int id , E e);
}
