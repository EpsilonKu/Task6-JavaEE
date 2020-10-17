<%@ page import="db.Posts" %>
<%@ page import="javafx.geometry.Pos" %><%--
  Created by IntelliJ IDEA.
  User: Ulya
  Date: 05.10.2020
  Time: 04:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DETAILS</title>
    <%@include file="head.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<%
    if (myUser != null) {
        Posts post = (Posts) request.getAttribute("post");
        if (post != null) {
%>
<div class="container">
    <div class="col-sm-8 offset-2">
    <div class="form-group mt-3">
        <label><h3>AUTHOR:</h3></label>
        <div class="form-control"><%=myUser.getFullName()%>
        </div>
        </h4>
    </div>
    <div class="form-group">
        <label class="label mt-3"><h3>TITLE:</h3></label>
        <textarea class="form-control"><%=post.getTitle()%>
        </textarea>
    </div>
    <div class="form-group">
        <label class="label mt-3"><h3>SHORT CONTENT:</h3></label>
        <textarea class="form-control" style="height: 150px"><%=post.getShort_content()%>
        </textarea>
    </div>
    <label class="label mt-3"><h3>CONTENT:</h3></label>
    <textarea class="form-control" style="height: 250px"><%=post.getContent()%>
    </textarea>
    <div class="form-group">
        <label class="label mt-3"><h3>POST DATE:</h3></label>
        <div class="form-control"><%=post.getPost_date()%>
        </div>

    </div>
</div>
</div>
<%

        }
    }
%>
</body>
</html>
