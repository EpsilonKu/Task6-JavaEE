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
    <%@include file="head.jsp" %>
    <script src="tinymce/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({selector: 'textarea'});</script>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="row mt-3">
        <div class="col-sm-3">
            <img src="<%=myUser!=null?myUser.getPicture_url():""%>" width="255px">
            <table class="table table-bordered mt-3">
                <tr>
                    <td><%=myUser != null ? myUser.getFullName() : ""%>
                        ,<%=myUser != null ? String.valueOf(myUser.getBirthdate()) : ""%>
                    </td>
                </tr>
                <tr>
                    <td><a href="/profile">
                        <button>My Profile</button>
                    </a></td>
                </tr>
                <tr>
                    <td><a>Settings</a></td>
                </tr>
                <tr>
                    <td><a href="/logout">
                        <button>Logout</button>
                    </a></td>
                </tr>
            </table>
        </div>
        <div class="col-sm-6">
            <form action="/findFriends" method="get" class="form-inline">
                <div class="form-group mx-sm-3 mb-2">
                    <input type="text" name="names" onkeyup="myFunction()" id="mySearch" class="form-control"
                           placeholder="Search Friends">
                </div>
                <button class="mb-2 btn btn-outline-primary"><i class="fas fa-search"></i>Search</button>
            </form>
            <%
                if(DBManager.getAllRequests(myUser.getId())!=null){
                    ArrayList<Users> requests=DBManager.getAllRequests(myUser.getId());
                    for(Users r : requests){
            %>

            <div class="media mt-3" style="border: 1px rgba(0,0,0,0.26) solid; padding: 10px">
                <img width="100px" height="100px" src="<%=r.getPicture_url()%>"
                     class="rounded-circle align-self-center mr-3" alt="...">
                <div class="media-body">
                    <h3 class="mt-0"  ><a href="/friendsPage?id=<%=r.getId()%>"style="color: rgba(90,34,135,0.85)"> <%=r.getFullName()%></a></h3>

                    <p><%=DBManager.getAge(r.getId())%> years old</p>
                    <p class="mb-0">
                    <form action="/addFriend" method="post">
                    <input type="hidden" name="id" value="<%=myUser.getId()%>">
                    <input type="hidden" name="fr_id" value="<%=r.getId()%>">
                       <button class="btn btn-sm btn-outline-primary"> <i class="fas fa-plus-circle"></i>Confirm</button>
                </form>
                    <form action="/reject" method="post">
                        <input type="hidden" name="id" value="<%=r.getId()%>">
                        <button type="submit" class="btn btn-sm btn-outline-primary"> <i class="fas fa-trash-alt"></i>Reject</button>
                    </form>
                    </p>
                </div>
            </div>


            <%
                    }}
            %>
            <%
                if (myUser != null) {
                    ArrayList<Users> allFriends = DBManager.getAllFriends(myUser.getId());
                    if (allFriends != null) {
                        for (Users f : allFriends) {
            %>
            <div class="media mt-3" style="border: 1px rgba(0,0,0,0.26) solid; padding: 10px">
                <img width="100px" height="100px" src="<%=f.getPicture_url()%>"
                     class="rounded-circle align-self-center mr-3" alt="...">
                <div class="media-body">
                    <h3 class="mt-0"><a href="/friendsPage?id=<%=f.getId()%>"style="color: rgba(90,34,135,0.85)"> <%=f.getFullName()%></a>
                    </h3>
                    <p><%=DBManager.getAge(f.getId())%> years old</p>
                    <p class="mb-0">
                        <button class="btn btn-sm btn-outline-primary">Send Message</button>
                    </p>
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
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
         aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
<script>
    // function myFunction() {
    //     // Declare variables
    //     var input, filter, ul, li, a, i;
    //     input = document.getElementById("mySearch");
    //     for (i = 0; i < li.length; i++) {
    //         a = li[i].getElementsByTagName("a")[0];
    //         if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
    //             li[i].style.display = "";
    //         } else {
    //             li[i].style.display = "none";
    //         }
    //     }
    // }
</script>
</body>
</html>
