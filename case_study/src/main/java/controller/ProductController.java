package controller;

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
        if (role.equals("member")){
            switch (action){
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
        String name = request.getParameter("nameSearch");

        request.setAttribute("searchList", productService.findByName(name));
        RequestDispatcher dispatcher = request.getRequestDispatcher("product/search.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/product/findAll.jsp");
        try {
            List<Product> productList = productService.findAll();
            request.setAttribute("productList" , productList);
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}