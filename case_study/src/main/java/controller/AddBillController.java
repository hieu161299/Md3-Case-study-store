package controller;

import model.Oder;
import model.OderDetail;
import model.Product;
import model.User;
import service.OderDetailService;
import service.OrderService;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AddBillController", value = "/bill")
public class AddBillController extends HttpServlet {
    UserService userService = new UserService();
    OrderService orderService = new OrderService();
    OderDetailService oderDetailService = new OderDetailService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "payment":
                payment(request , response);
                break;
        }
    }

    private void payment(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        List<Product> productList = (List<Product>) session.getAttribute("productList");
        if (productList.size() == 0){
            try {
                response.sendRedirect("http://localhost:8080/view?action=findAll");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            int idUser = (int) session.getAttribute("idUser");
            User user = userService.findUserById(idUser);
            Date now = new Date() ;
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = df.format(now);
            boolean status = false;
            Oder oder = new Oder(time , idUser , status);
            orderService.add(oder);
            List<Oder> oders = orderService.findAll();
            for (int i = 0; i < oders.size(); i++) {
                if (oders.get(i).getIdUser() == idUser && oders.get(i).isStatus() == false)
                    for (int j = 0; j < productList.size(); j++) {
                        Product product = productList.get(j);
                        OderDetail oderDetail = new OderDetail(product.getPrice(), product.getQuantity(), product.getId(), oders.get(i).getId());
                        oderDetailService.add(oderDetail);
                        oders.get(i).setStatus(true);
                        orderService.updateOderStatus(oders.get(i));
                    }
            }

            productList = new ArrayList<>();
            session.setAttribute("productList" , productList);
            try {
                response.sendRedirect("/view?action=showCart");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}