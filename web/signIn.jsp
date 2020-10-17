<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="head.jsp"%>
</head>
<body>
<%@include file="nav.jsp"%>
<div class="container">
    <div class="row mt-5">
        <div class="col-sm-12">
            <h2 class="text-center">Sign In</h2>
        </div>
    </div>
    <div class="row mt-5">
        <div class="col-sm-6 offset-3">
            <%
                if(request.getParameter("error")!=null&&request.getParameter("error").equals("1")){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>User with such email doesn't exist</strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <%
                if(request.getParameter("error")!=null&&request.getParameter("error").equals("2")){
            %>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Incorrect password for email <%=request.getParameter("email")%></strong>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%
                }
            %>
            <form action="/auth" method="post">
                <div class="form-group">
                    <label>Email address</label>
                    <input type="email" name="email" class="form-control">
                    <label style="font-size: 12px; color: #8c8685">Input your email</label>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control">
                    <label style="font-size: 12px; color: #8c8685">Input your password</label>
                </div>
                <div class="form-group">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <input type="checkbox" aria-label="Checkbox for following text input">
                            </div>
                        </div>
<%--                        <input type="text" class="form-control" aria-label="Text input with checkbox">--%>
                        <label class="mt-1 ml-2"> Remember me</label>
                    </div>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary">SIGN IN</button>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
</html>
