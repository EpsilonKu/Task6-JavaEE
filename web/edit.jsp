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
    <script src="tinymce/tinymce/tinymce.min.js"></script>
    <script>tinymce.init({selector:'textarea'});</script>
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
        <form action="/edit" method="post">
            <input type="hidden" name="id" value="<%=post.getId()%>">
        <div class="form-group mt-3">
            <label><h3>AUTHOR:</h3></label>
            <div class="form-control"><%=myUser.getFullName()%>
            </div>
            </h4>
        </div>
        <div class="form-group">
            <label class="label mt-3"><h3>TITLE:</h3></label>
            <textarea name="title" class="form-control"><%=post.getTitle()%></textarea>
        </div>
        <div class="form-group">
            <label class="label mt-3"><h3>SHORT CONTENT:</h3></label>
            <textarea name="short_content" class="form-control" style="height: 150px"><%=post.getShort_content()%></textarea>
        </div>
        <label class="label mt-3"><h3>CONTENT:</h3></label>
        <textarea name="content" class="form-control" style="height: 250px"><%=post.getContent()%></textarea>
        <div class="form-group">
            <label class="label mt-3"><h3>POST DATE:</h3></label>
            <input name="date" readonly value="<%=post.getPost_date()%>" class="form-control">
        </div>
            <div class="form-group">
                <button class="btn float-left btn-sm btn-success">SAVE</button>
                <button type="button" onclick="deletePost(<%=post.getId()%>)" class="btn btn-danger float-right btn-sm" data-toggle="modal" data-target="#exampleModal">DELETE</button>
            </div>
        </form>
    </div>
</div>
<%

        }
    }
%>

<!-- Modal -->
<form action="/deletePost"method="post" id="deleteModal">
    <input type="hidden" name="id" id="deleteId">
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">DELETE</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">NO</button>
                <button type="submit" class="btn btn-primary">YES</button>
            </div>
        </div>
    </div>
</div>
</form>

<script type="text/javascript">
const deletePost=(id)=>{
    document.getElementById("deleteId").value=id;
}
</script>
</body>
</html>
