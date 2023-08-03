package controller;

import model.Item;
import model.Oder;
import model.Product;
import service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
            int quantity = 1;
            int id ;
            HttpSession session = request.getSession();
            if (request.getParameter("pId") != null){
                id = Integer.parseInt(request.getParameter("pId"));
                Product product =  productService.getById(pId);
                if (product != null){
                    if (request.getParameter("quantity") != null){
                        quantity = Integer.parseInt(request.getParameter("quantity"));
                    }
                }

                if (request.getParameter("order") != null){
                    Oder oder = new Oder();
                    List<Item>  items = new ArrayList<>();
                    Item item = new Item();
                    item.setQuantity(quantity);
                    item.setProduct(product);
                    item.setPrice(product.getPrice());
                    items.add(item);
                    oder.setItemList(items);
                    session.setAttribute("order" , oder);
                }else {
                    Oder order = (Oder) session.getAttribute("order");
                    List<Item>  items = order.getItemList();

                    if (items == null){
                        Item item = new Item();
                        item.setQuantity(quantity);
                        item.setProduct(product);
                        item.setPrice(product.getPrice());
                        items.add(item);
                    }else {
                        order.setQuantity(order.getQuantity() + quantity);
                    }

                    session.setAttribute("order",order);
                }
            }

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