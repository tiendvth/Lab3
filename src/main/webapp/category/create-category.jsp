<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.lab03.entity.Category" %><%--
  Created by IntelliJ IDEA.
  User: tiendangvan
  Date: 01/06/2022
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");%>
<%
    Category category = (Category) request.getAttribute("product");
    if (category == null) {
        category = new Category();
    }
    if (errors != null) {
        for (String i : errors.keySet()) {
            System.out.println(errors.get(i));
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .valid {
            color: red;
            margin: 0 0 10px 0;
            font-size: 13px
        }
    </style>
</head>
<body>

<div class="container mt-3">
    <h2>Create product</h2>
    <form action="/product" method="post">
        <div class="mb-3 mt-3">
            <label>Name product</label>
            <input type="text" class="form-control" value="<%=category.getName()%>" placeholder="Enter product name"
                   name="name">
            <% if (errors != null) { %>
            <% for (String i : errors.keySet()) { %>
            <% if (i.equals("name")) { %>
            <p class="valid"><%=errors.get(i)%>
            </p>
            <% } %>
            <% } %>
            <%}%>
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

</body>
</html>
