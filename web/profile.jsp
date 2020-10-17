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
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container">
    <div class="row mt-3">
        <div class="col-sm-3">
            <img src="<%=myUser!=null?myUser.getPicture_url():""%>" width="255px">
            <table class="table table-bordered mt-3">
                <tr>
                    <td><%=myUser!=null?myUser.getFullName():""%>,<%=myUser!=null? DBManager.getAge(myUser.getId()) :""%> years</td>
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
        <div class="col-sm-4 offset-1">
            <h2 class="text-center">Edit Profile</h2>
            <form action="/updateProfile" method="post">
                <div class="form-group">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" value="<%=myUser!=null? myUser.getEmail():""%>">
                    <label style="font-size: 12px; color: #8c8685">Input your email</label>
                </div>
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="full_name" class="form-control"value="<%=myUser!=null? myUser.getFullName():""%>">
                    <label style="font-size: 12px; color: #8c8685">Input your full name</label>
                </div>
                <div class="form-group">
                    <label>Birthdate</label>
                    <input type="date" name="birthdate" class="form-control" value="<%=myUser!=null? String.valueOf(myUser.getBirthdate()):""%>">
                    <label style="font-size: 12px; color: #8c8685">Input your birthdate</label>
                </div>
                <div class="form-group">
                    <button class="btn btn-sm btn-primary">Update Profile</button>
                </div>
            </form>

            <h2 class="text-center mt-4">Edit Picture</h2>
            <form action="/updatePicture" method="post">
                <div class="form-group">
                    <label>URL</label>
                    <input type="text" name="url" class="form-control" value="<%=myUser!=null? myUser.getPicture_url():""%>">
                    <label style="font-size: 12px; color: #8c8685">Input of your profile photo</label>
                </div>
                <div class="form-group">
                    <button class="btn btn-sm btn-primary">Update Picture</button>
                </div>
            </form>


            <%
            if(request.getParameter("error")!=null){
        %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Wrong password</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                if(request.getParameter("success")!=null){
            %>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Password changed successfully!!!</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <h2 class="text-center mt-4">Update Password</h2>
            <form action="/updatePassword" method="post">
                <div class="form-group">
                    <label>Old Password</label>
                    <input type="password" name="old_password" class="form-control">
                    <label style="font-size: 12px; color: #8c8685">Input your old password</label>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="new_password" class="form-control">
                    <label style="font-size: 12px; color: #8c8685">Input your new password </label>
                </div>
                <div class="form-group">
                    <label>Re-New Password</label>
                    <input type="password" name="re_new_password" class="form-control" >
                    <label style="font-size: 12px; color: #8c8685">Re type your new password again</label>
                </div>
                <div class="form-group">
                    <button class="btn btn-sm btn-primary">Update Password</button>
                </div>
            </form>
        </div>
        <div class="col-sm-3 offset-1">
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

</body>
</html>
