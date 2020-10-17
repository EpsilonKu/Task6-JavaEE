package servlets;

import db.DBManager;
import db.Posts;
import db.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/addPost")
public class AddPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user=(Users)request.getSession().getAttribute("MyUser");
        if(user!=null){
            String title=request.getParameter("title");
            String short_content=request.getParameter("short_content");
            String content=request.getParameter("content");
            if(DBManager.addPost(new Posts(null,user,title,short_content,content,null))){
                response.sendRedirect("/feedPage");
            }else {
                response.sendRedirect("/signIn");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
