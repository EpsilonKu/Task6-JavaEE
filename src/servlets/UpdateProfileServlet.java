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

@WebServlet(value = "/updateProfile")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String full_name = request.getParameter("full_name");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));

        Users us = (Users) request.getSession().getAttribute("MyUser");
        if (us != null) {
            us.setEmail(email);
            us.setFullName(full_name);
            us.setBirthdate(birthdate);

            if (DBManager.saveUser(us)) {
                request.getSession().setAttribute("MyUser",us);
                response.sendRedirect("/profile");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
