package controller;

import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteFormCart", value = "/delete-from-cart")
public class DeleteFormCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Product> productList = (List<Product>) session.getAttribute("productList");
        if (productList != null){
            int idProduct = Integer.parseInt(request.getParameter("idProduct"));
            for (int i = 0; i < productList.size(); i++) {
                if (idProduct == productList.get(i).getId()) {
                    productList.remove(productList.get(i));
                }
            }
            session.setAttribute("productList" , productList);
        }
        response.sendRedirect("/view?action=showCart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}