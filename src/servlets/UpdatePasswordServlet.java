package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet(value = "/updatePassword")
public class UpdatePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");
        String re_new_password =request.getParameter("re_new_password");

        Users us = (Users) request.getSession().getAttribute("MyUser");
        String redirect="/profile?error";
        if (us != null && us.getPassword().equals(old_password)) {
            if (new_password.equals(re_new_password)) {
                us.setPassword(new_password);
                if (DBManager.saveUser(us)) {
                    redirect="/profile?success";
                    request.getSession().setAttribute("MyUser", us);
                }
            }
        }
        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
