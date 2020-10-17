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
            <form class="form-inline my-2 my-lg-0" action="/findFriends" method="get">
                <input class="form-control mr-sm-4 col-sm-9" name="names" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0" type="submit"><i class="fas fa-search mr-1"></i>Search</button>
            </form>
            <%
                String search_name = request.getParameter("search_name");
                if(search_name!=null){


            %>
            <div class="card mt-3">
                <div class="card-body">
                    <h3> Search results for: "<%=search_name%>"</h3>
                </div>
            </div>
            <%
                }
                ArrayList<Users> userFriends = (ArrayList<Users>) request.getAttribute("users");
                ArrayList<Users> userFriendd = DBManager.getAllFriends(myUser.getId());
                ArrayList<Users>userRequest=DBManager.getMySend(myUser.getId());
                if(userFriends!=null){
                    for(Users user: userFriends){
                        if(user.getId() != myUser.getId()){
            %>
            <div class="media card mb-3 mt-3" style="max-width: 540px;">
                <div class="row no-gutters p-2">
                    <div class="col-md-4">
                        <img src="<%=user.getPicture_url()%>" class="rounded-circle mt-3" width="100px" height="100px">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title"><strong><%= user.getFullName()%></strong></h5>
                            <%--                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>--%>
                            <p class="card-text" style="font-size: 14px; color: #8c8685"><%= DBManager.getAge(user.getId()) %> age old</p>
                            <%
                                if(userRequest!=null){
                                    boolean isfind1=false;
                                    for(Users users:userRequest){
                                        if(user.getId()==users.getId()){
                                            isfind1=true;

                            %>
                            <button type="button" class="btn btn-outline-primary"><i class="fas fa-check" style="margin-right: 7px"></i> Request Sent</button>
                            <%
                                    }
                                }

                                if(!isfind1){
                                    if(userFriendd != null){
                                        boolean isFind = false;
                                        for(Users users: userFriendd){
                                            if(user.getId()==users.getId()){
                                                isFind = true;

                            %>
                            <button type="button" class="btn btn-outline-primary"><i class="fab fa-telegram-plane" style="margin-right: 7px"></i> Send Message</button>
                            <%
                                    }
                                }
                                if(!isFind) {
                            %>
                            <form action="/addReq" method="post">
                                <input type="hidden" name="id" value="<%=user.getId()%>">
                                <button type="submit" class="btn btn-outline-primary"><i class="fas fa-plus-circle" style="margin-right: 7px"></i> Add To Friends</button>
                            </form>
                            <%
                                            }

                                        }
                                    }
                                }

                            %>


                        </div>
                    </div>
                </div>
            </div>
            <%--            <div class="card">--%>
            <%--                <img src="<%=user.getPicture_url()%>" width="200px" class=" rounded-circle" style="clear: left" alt="100x100" data-holder-rendered="true">--%>

            <%--                    <h3><strong><%= user.getFullName()%></strong></h3>--%>
            <%--                    <h5 style="font-size: 14px; color: #8c8685"><%= DBManager.getAge(user.getId()) %> age old</h5>--%>
            <%--                    <button type="button" class="btn btn-outline-primary"><i class="fab fa-telegram-plane" style="margin-right: 7px"></i> Send Message</button>--%>

            <%--            </div>--%>
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
                    <div    class="form-group">
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
<script>
    function myFunction() {
        // Declare variables
        var input, filter, ul, li, a, i;
        input = document.getElementById("mySearch");
        filter = input.value.toUpperCase();
        ul = document.getElementById("myMenu");
        li = ul.getElementsByTagName("li");

        // Loop through all list items, and hide those who don't match the search query
        for (i = 0; i < li.length; i++) {
            a = li[i].getElementsByTagName("a")[0];
            if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
                li[i].style.display = "";
            } else {
                li[i].style.display = "none";
            }
        }
    }
</script>
</body>
</html>