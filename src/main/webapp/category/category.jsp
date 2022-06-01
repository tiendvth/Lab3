<%@ page import="com.example.lab03.entity.Category" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: tiendangvan
  Date: 01/06/2022
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
  <h2>Hover Rows</h2>
  <p>The .table-hover class enables a hover state (grey background on mouse over) on table rows:</p>
  <table class="table table-hover">
    <thead>
    <tr>
      <th>Id</th>
      <th>Thumbnail</th>
      <th>Name</th>
      <th>Price</th>
      <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Category> products = (ArrayList<Category>) request.getAttribute("products");
      for(Category product : products) {%>
    <tr>
      <td><%= product.getId() %></td>
      <td>
        <img style="width: 70px; object-fit: cover;height: 70px" src="<%= product.getName() %>" />
      </td>
      <td><%= product.getName() %></td>

      <td><%= product.getStatus() %></td>
    </tr>
    <%}%>
    </tbody>
  </table>
</div>

</body>
</html>
