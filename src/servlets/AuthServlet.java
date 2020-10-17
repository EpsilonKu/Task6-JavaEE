package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(value = "/auth")
public class AuthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String redirect = "/signIn?email="+email+"&error=1";

        if(email!=null&&password!=null){

            Users user = DBManager.getUserByEmail(email);

            if(user!=null){

                redirect = "/signIn?email="+email+"&error=2";

                if(user.getPassword().equals(password)){

                    redirect = "/profile";
                    HttpSession session=request.getSession();
                    session.setAttribute("MyUser",user);

                }

            }

        }

        response.sendRedirect(redirect);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
