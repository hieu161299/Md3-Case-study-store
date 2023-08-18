package controller;

import model.Department;
import model.Employee;
import service.DepartmentService;
import service.EmployeeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "EmployeeController", value = "/views")
public class EmployeeController extends HttpServlet {
    EmployeeService employeeService = new EmployeeService();
    DepartmentService departmentService = new DepartmentService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "getAll":
            case "search":
                getAll(request , response);
                break;
            case "add":
                add(request , response);
                break;
            case "delete":
                delete(request , response);
                break;
            case "edit":
                edit(request , response);
                break;
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {

    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int idEmployee  = Integer.parseInt(request.getParameter("idEmployee"));
        employeeService.delete(idEmployee);
        try {
            response.sendRedirect("home?action=getAll");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void add(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/add.jsp");
        List<Department> departmentList = departmentService.getAll();
        try {
            request.setAttribute("departmentList" , departmentList);
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String name  = request.getParameter("search");
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/employee/home.jsp");
        List<Employee> employeeList = new ArrayList<>();
        if (action.equals("getAll")){
            employeeList = employeeService.getAll();
       }else if (action.equals("search")){
            employeeList = employeeService.search(name);
        }
        request.setAttribute("employeeList" , employeeList);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "add":
                addEmployee(request, response);
                break;

        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phoneNumber = request.getParameter("phoneNumber");
        double salary = Double.parseDouble(request.getParameter("salary"));
        int idDepartment = Integer.parseInt(request.getParameter("idDepartment"));
        Employee employee = new Employee(name , email , address , phoneNumber , salary , idDepartment );
        employeeService.add(employee);
        try {
            response.sendRedirect("/home?action=getAll");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}