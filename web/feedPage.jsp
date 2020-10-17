<%@ page import="java.util.ArrayList" %>
<%@ page import="db.Posts" %>
<%@ page import="db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: ERLAN-PC
  Date: 03.10.2020
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>PROFILE</title>
    <%@include file="head.jsp"%>
    <script src="tinymce/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({selector:'textarea'});</script>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container">
    <div class="row mt-3">
        <div class="col-sm-3">
            <img src="<%=myUser!=null?myUser.getPicture_url():""%>" width="255px">
            <table class="table table-bordered mt-3">
                <tr>
                    <td><%=myUser!=null?myUser.getFullName():""%>,<%=myUser!=null? String.valueOf(myUser.getBirthdate()) :""%></td>
                </tr>
                <tr>
                    <td><a href="/profile"><button>My Profile</button></a></td>
                </tr>
                <tr>
                    <td><a>Settings</a></td>
                </tr>
                <tr>
                    <td><a href="/logout"><button>Logout</button></a></td>
                </tr>
            </table>
        </div>
        <div class="col-sm-6">
            <button type="button" class="btn btn-primary" data-toggle="modal" id="addNew"  data-target="#staticBackdrop">
                +ADD NEW
            </button>
            <%
                if(myUser!=null){
                    ArrayList<Posts> allPosts= DBManager.getAllPosts();
                    if(allPosts!=null){
                        for (Posts p:allPosts){
            %>
            <div class="card mt-3">
                <div class="card-body">
                    <h5 class="card-title"><%=p.getTitle()%></h5>
                    <p class="card-text"><%=p.getShort_content()%></p>
                    <form action="/details" method="get">
                        <input type="hidden" name="id" value="<%=p.getId()%>">
                        <button class="btn btn-light">More-></button>
                    </form>
                </div>
                <div class="card-footer">
                    Posted on <%=p.getPost_date()%> by <a style="color: rgba(4,91,135,0.85) "><%=p.getAuthor().getFullName()%></a>
                </div>
            </div>
            <%
                        }
                    }
                }
            %>
        </div>
        <div class="col-sm-3 ">
            <div class="card" style="width: 18rem;">
                <div class="card-header bg-primary ">
                    Latest Birthdays
                </div>
                <div class="card-body">
                    <p class="card-text">Musa Uatbaev,tomorrow</p>
                    <p class="card-text">Azamat Tolegenov,02 October</p>
                    <p class="card-text">Yerik Utemuratov,05 October</p>
                    <p class="card-text">Aybek Bagit,10 October</p>
                </div>
            </div>

            <div class="card mt-4" style="width: 18rem;">
                <div class="card-header bg-primary ">
                    My Games
                </div>
                <div class="card-body">
                    <p class="card-text">FOOTBAL ONLINE</p>
                    <p class="card-text">PING PONG ONLINE</p>
                    <p class="card-text">CHESS MASTERS</p>
                    <p class="card-text">RACES ONLINE</p>
                </div>
            </div>
        </div>
    </div>
</div>

<form action="/addPost" method="post">
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Add New Post</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label>TITLE:</label>
                    <input type="text" name="title" class="form-control">
                </div>
                <div class="form-group">
                    <label>SHORT CONTENT:</label>
                    <textarea class="form-control" rows="20" name="short_content"></textarea>
                </div>
                <div class="form-group">
                    <label>CONTENT:</label>
                    <textarea class="form-control" rows="20" name="content"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Add</button>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>