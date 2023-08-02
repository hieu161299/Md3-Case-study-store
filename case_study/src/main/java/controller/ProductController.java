package controller;

import filter.SessionUserMember;
import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/view")
public class ProductController extends HttpServlet {
    ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        if (role.equals("member")) {
            switch (action) {
                case "findAll":
                    findAll(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
            }
        } else if (role.equals("admin")) {
            switch (action) {
                case "findAll":
                    findAll(request, response);
                    break;
                case "search":
                    search(request, response);
                    break;
            }
        }


    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        String name = request.getParameter("nameSearch");
        request.setAttribute("searchList", productService.findByName(name));
        if (role.equals("member")){
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/searchByMember.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else if (role.equals("admin")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("product/searchByAdmin.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String role = (String) session.getAttribute("role");
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        if (role.equals("member")){
            RequestDispatcher dispatcher = request.getRequestDispatcher("/product/homeCustomer.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else  if (role.equals("admin")){
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