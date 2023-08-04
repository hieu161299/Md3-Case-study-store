package controller;

import filter.SessionUserAdmin;
import filter.SessionUserMember;
import model.Product;
import model.User;
import service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserController", value = "/Users")
public class UserController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        userService.findAll();
        String action = request.getParameter("action");
         switch (action){
             case "login":
                 showLoginForm(request, response);
                 break;
             case "register":
                 showRegisterForm(request , response);
             case "information":
                 showInformation(request , response);
                 break;
             case "editCustomer":
                 showFormEdit(request , response);
                 break;
             case "registeradmin":
                 showRegisterAdmin(request , response);
         }
    }

    private void showRegisterAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/RegisterAdmin.jsp");
        dispatcher.forward(request, response);
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/user/formEditCustomer.jsp");
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
        User user = userService.findUserById(id);
        request.setAttribute("user", user);
        try {
            dispatcher.forward(request , response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showInformation(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/informationCustomer.jsp");
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("idUser");
        User user = userService.findUserById(id);
        request.setAttribute("user", user);

        try {
            dispatcher.forward(request ,response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/Register.jsp");
        dispatcher.forward(request, response);
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/Login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "login":
                checkLogin(request , response);
                break;
            case "register":
                try {
                    addRegister(request , response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "editCustomer":
                editCustomer(request , response);
                break;
            case "registeradmin":
                try {
                    addRegisterAdmin(request , response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }
    }

    private void addRegisterAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "admin";
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        User user = new User(username , password , role ,name ,age,address,image);
        userService.add(user);
        response.sendRedirect("/view?action=findAll");
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        User user = new User(name ,age,address,image);
        userService.edit(id , user);
        try {
            response.sendRedirect("http://localhost:8080/Users?action=information");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void checkLogin(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        int id = userService.getIdUser(userName , password);

        if (userService.checkUser(userName, password)) {
            String role = userService.getRole(userName, password);
            HttpSession session = request.getSession();
            session.setAttribute("role", role);
            session.setAttribute("idUser", id);
          //  request.setAttribute("idUser",id);
            boolean checkAdmin = SessionUserAdmin.checkUser(request);
            boolean checkMember = SessionUserMember.checkUser(request);
            if(checkAdmin){
                try {
//                khi đăng nhập thành công chuyển trang Admin home vào đây
                    response.sendRedirect("/view?action=findAll");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }else if(checkMember){
                try {
                    List<Product> productList = new ArrayList<Product>();
//                khi đăng nhập thành công chuyển trang Member home vào đây
                    response.sendRedirect("/view?action=findAll");
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        } else {
            try {
                response.sendRedirect("/Users?action=login");
                userService.findAll();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
    private void addRegister(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = "member";
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        String address = request.getParameter("address");
        String image = request.getParameter("image");
        User user = new User(username , password , role ,name ,age,address,image);
        userService.add(user);
        response.sendRedirect("/Users?action=login");
    }
}