<%@ page import="db.Users" %><%--<div class="container">--%>
<%
    Users myUser = (Users)request.getSession().getAttribute("MyUser");
%>
<%
    if(myUser != null){
%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgb(24,11,122); padding: 10px 10%">
    <a class="navbar-brand" href="/home" style=" font-size: 30px; color: #19386b">
        <img src="../img/aa.png" width="30px" class="ui-icon-image mr-1" alt="" loading="lazy">
        <strong style="color: #ffffff">ARALASU KZ</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <%--    <button class="btn"><i class="fa fa-home"></i> Home</button>--%>
    <%--    <button class="btn"><i class="fa fa-bars"></i> Menu</button>--%>
    <%--    <button class="btn"><i class="fa fa-trash"></i> Trash</button>--%>
    <%--    <button class="btn"><i class="fa fa-close"></i> Close</button>--%>
    <%--    <button class="btn"><i class="fa fa-folder"></i> Folder</button>--%>

    <div class="collapse navbar-collapse " style="padding-left: 5%; justify-content: space-between">
        <ul class="navbar-nav">
            <li class="nav-item">
                <%--            <a class="nav-link d-flex" style="font-size: 20px; color: #122647" href="/register"><i class="fas fa-portrait"></i>Feed</a>--%>
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="/feedPage"><i class="fas fa-newspaper" style="margin-right: 7px"></i>Folder</a>
                <%--            <button class="btn" style="border: none; padding: 10px 10px; font-size: 20px; cursor: pointer"><a href="/" style="text-decoration: none;"><i class="fas fa-newspaper"></i>Folder</a></button>--%>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="/friends"><i class="fas fa-user-friends" style="margin-right: 7px"></i>My Friends</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="#"><i class="fas fa-users"style="margin-right: 7px"></i>Groups</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="/myPosts"><i class="far fa-comment" style="margin-right: 7px"></i>My Posts</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="#"><i class="fab fa-telegram-plane" style="margin-right: 7px"></i>Messages</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="#"><i class="fas fa-images" style="margin-right: 7px"></i>Pictures</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="font-size: 15px; color: #ffffff" href="#"><i class="fas fa-video" style="margin-right: 7px"></i>Videos</a>
            </li>
        </ul>
    </div>

        <%
        }
        else {
    %>
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: rgb(24,11,122); padding: 10px 10%">
        <a class="navbar-brand" href="/" style=" font-size: 30px; color: #19386b">
            <img src="../img/aa.png" width="30px" class="ui-icon-image mr-1" alt="" loading="lazy">
            <strong style="color: #ffffff">ARALASU KZ</strong></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse " style="padding-left: 35%">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" style="font-size: 15px; color: #ffffff" href="/register"><i class="fas fa-user-plus mr-1"></i>Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="font-size: 15px; color: #ffffff" href="/signIn"><i class="fas fa-sign-in-alt mr-1"></i>Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="font-size: 15px; color: #ffffff" href="#"><i class="fas fa-question-circle mr-1"></i>FAQ</a>
                </li>
                <li class="nav-item">

                    <a class="nav-link" style="font-size: 15px; color: #ffffff" href="#"><img src="img/aa.png" style="width: 20px">About Aralasu</a>
                </li>
            </ul>
        </div>

        <%
            }
        %>
    </nav>
</nav>
</div>