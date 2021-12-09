package Controllers;

import DataBase.Cookies;
import Models.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       UserModel u = UserModel.getUserByPhone(request.getParameter("phone"));
       if(u == null){
           UserModel.addUser(
                   request.getParameter("email"),
                   request.getParameter("first_name"),
                   request.getParameter("last_name"),
                   request.getParameter("phone"),
                   request.getParameter("psw"));
           Cookies.setCookie(response,"user",request.getParameter("phone"));
           response.sendRedirect(request.getContextPath()+"/index.jsp");
       }else{
           response.sendRedirect(request.getContextPath()+"/sign_up.jsp");
       }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserModel u = UserModel.getUserByPhonePassword(request.getParameter("phone"),request.getParameter("psw"));
        if (u != null){
            Cookies.setCookie(response,"user",u.getPhone());
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else {
            response.sendRedirect(request.getContextPath()+"/log_in.jsp");
        }
    }
}
