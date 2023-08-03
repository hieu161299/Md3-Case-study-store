package controller;

import filter.SessionUserMember;
import model.Category;
import model.Product;
import model.User;
import model.dto.SaveBill;
import service.CategoryService;
import service.OrderDetailsJDBC;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/view")
public class ProductController extends HttpServlet {
    ProductService productService = new ProductService();
    CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        request.setAttribute("action" , action);
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (role.equals("member")) {
            switch (action) {
                case "findAll":
                case "search":
                    findAll(request, response);
                    break;
            }
        } else if (role.equals("admin")) {

            switch (action) {
                case "findAll":
                case "search":
                    findAll(request, response);
                    break;

                case "findbill":
                    showBill(request, response);
                    break;

                case "create":
                   showFormCreate(request,response);
                   break;
                case "delete":

                    try {

                        deleteProduct(request , response);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;
                case "edit":

                    showFormEdit(request,response);
                    break;
            }
        }
    }
    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        request.setAttribute("id" , idProduct);
        List <Category> categories = categoryService.findAll();
        request.setAttribute("categories" , categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/edit.jsp");
        dispatcher.forward(request, response);
    }
    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("idProduct"));
        this.productService.delete(id);
        response.sendRedirect("http://localhost:8080/view?action=findAll");
    }
    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List <Category> categories = categoryService.findAll();
        request.setAttribute("categories" , categories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/create.jsp");
        dispatcher.forward(request, response);
    }
    private void showBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDetailsJDBC orderDetailsJDBC = new OrderDetailsJDBC();
        List<SaveBill> saveBills = orderDetailsJDBC.findBill();
        request.setAttribute("saveBills", saveBills);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/Order.jsp");
        dispatcher.forward(request, response);
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String action = request.getParameter("action");
        List<Product> productList = null;
        if (action.equals("findAll")){
             productList = productService.findAll();
        }else if (action.equals("search")){
            String name = request.getParameter("nameSearch");
           productList =productService.findByName(name);
        }

        request.setAttribute("productList", productList);
        if (role.equals("member")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/product/homeCustomer.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else if (role.equals("admin")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/product/homeAdmin.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                try {
                    createProduct(request , response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                editProduct(request , response);
                break;
        }

    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        Category category = new Category(idCategory);
        String image = request.getParameter("image");
       Product product = new Product(name,quantity,price,category,image);
        productService.edit(id , product);
        try {
            response.sendRedirect("http://localhost:8080/view?action=findAll");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String name = request.getParameter("name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"));
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        Category category = new Category(idCategory);
        String image = request.getParameter("image");
        Product product = new Product( name, quantity, price, category,image);
        productService.add(product);
        response.sendRedirect("http://localhost:8080/view?action=findAll");
    }
}