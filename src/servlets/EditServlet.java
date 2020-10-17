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

@WebServlet(value = "/edit")
public class EditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user=(Users)request.getSession().getAttribute("MyUser");
        if(user!=null){
            Long id=Long.parseLong(request.getParameter("id"));
            Posts post=DBManager.getPostById(id);
            String title=request.getParameter("title");
            String short_content=request.getParameter("short_content");
            String content=request.getParameter("content");
            post.setTitle(title);
            post.setShort_content(short_content);
            post.setContent(content);
            if(DBManager.savePost(post)){
                response.sendRedirect("/feedPage");
            }else {
                response.sendRedirect("/signIn");
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id=Long.parseLong(request.getParameter("id"));
        Posts post= DBManager.getPostById(id);

        request.setAttribute("post",post);
        request.getRequestDispatcher("/edit.jsp").forward(request,response);
    }
}
