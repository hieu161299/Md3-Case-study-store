package controller;

import model.Oder;
import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OderController", value = "/oder")
public class OderController extends HttpServlet {
    ProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "addToCart":
                addToCart(request , response);
            case "showBillCustomer":
                showBillCustomer(request , response);
        }
    }

    private void showBillCustomer(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        int idUser = (int) session.getAttribute("idUser");

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        List<Product> productList = (List<Product>) session.getAttribute("productList");
        int idProduct = Integer.parseInt(request.getParameter("idProduct"));
        Product product = productService.getById(idProduct);
        if (productList == null){
            productList = new ArrayList<>();
            product.setQuantity(1);
            productList.add(product);

        }else {
            boolean check = false;
            for (int i = 0; i < productList.size(); i++) {
                if (productList.get(i).getId() == idProduct){
                    productList.get(i).setQuantity( productList.get(i).getQuantity() + 1);
                    check = true;
                    break;
                }
            }
            if (!check){
                product.setQuantity(1);
                productList.add(product);
            }

        }
        try {
            session.setAttribute("productList",productList);
            response.sendRedirect("/view?action=findAll");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}