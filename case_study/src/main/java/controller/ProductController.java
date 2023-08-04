package controller;

import filter.SessionUserMember;
import model.Product;
import model.User;
import model.dto.SaveBill;
import service.OrderDetailsJDBC;
import service.ProductService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductController", value = "/view")
public class ProductController extends HttpServlet {
    ProductService productService = new ProductService();
    UserService userService = new UserService();

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
            }
        }


    }

    private void showBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDetailsJDBC orderDetailsJDBC = new OrderDetailsJDBC();
        List <SaveBill> saveBills = orderDetailsJDBC.findBill();
        request.setAttribute("saveBills" , saveBills);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/Order.jsp");
        dispatcher.forward(request, response);
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");

        String action = request.getParameter("action");
        int id = (int) session.getAttribute("idUser");
        request.setAttribute("idUser",id);

        User user = userService.findUserById(id);
        request.setAttribute("user" , user);

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

    }
}