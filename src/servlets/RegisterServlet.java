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

@WebServlet(value = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re-password");
        String full_name = request.getParameter("full_name");
        Date birthdate = Date.valueOf(request.getParameter("birthdate"));

        Users checkUser = DBManager.getUserByEmail(email);
        String redirect = "/register?error=1";
        if (checkUser == null) {
            redirect = "/register?error=2";
            if (password.equals(re_password)) {if(DBManager.addUser(new Users(null, email, password, full_name, birthdate))) {
                redirect = "/signIn";
            }

            }
        }
        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request,response);
    }
}
