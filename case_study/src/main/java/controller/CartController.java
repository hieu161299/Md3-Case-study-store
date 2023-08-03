package controller;

import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    private ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int pId = Integer.parseInt(request.getParameter("pId"));
        request.setAttribute("pId",pId);
        switch (action){
            case "addToCart":
                addToCart(request,response);
                break;
        }
    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
            int pId = Integer.parseInt(request.getParameter("pId"));
            Product product = productService.findAll().get(pId);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/product/cartCustomer.jsp");
        try {
            dispatcher.forward(request , response);
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