package servlets;

import db.DBManager;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/findFriends")
public class FndFriendsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("MyUser") != null) {
            String full_name = request.getParameter("names");
            ArrayList<Users> friends= DBManager.findFriend(full_name);
            request.setAttribute("users",friends);
            request.setAttribute("search_name",full_name);
            request.getRequestDispatcher("/findFriends.jsp").forward(request,response);
        }
    }
}