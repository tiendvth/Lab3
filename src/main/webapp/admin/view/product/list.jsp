<%--
Created by IntelliJ IDEA.
  User: tiendangvan
  Date: 01/06/2022
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab03.entity.Product" %><%--
<%--
Created by IntelliJ IDEA.
  User: tiendangvan
  Date: 01/06/2022
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="/admin/includes/head.jsp"/>

<body>

<!--*******************
    Preloader start
********************-->
<div id="preloader">
    <div class="sk-three-bounce">
        <div class="sk-child sk-bounce1"></div>
        <div class="sk-child sk-bounce2"></div>
        <div class="sk-child sk-bounce3"></div>
    </div>
</div>
<!--*******************
    Preloader end
********************-->


<!--**********************************
    Main wrapper start
***********************************-->
<div id="main-wrapper">

    <!--**********************************
        Nav header start
    ***********************************-->
    <div class="nav-header">
        <a href="index.html" class="brand-logo">
            <img class="logo-abbr" src="/admin/images/logo.png" alt="">
            <img class="logo-compact" src="/admin/images/logo-text.png" alt="">
            <img class="brand-title" src="/admin/images/logo-text.png" alt="">
        </a>

        <div class="nav-control">
            <div class="hamburger">
                <span class="line"></span><span class="line"></span><span class="line"></span>
            </div>
        </div>
    </div>
    <!--**********************************
        Nav header end
    ***********************************-->

    <!--**********************************
        Header start
    ***********************************-->
    <jsp:include page="/admin/includes/header.jsp"/>
    <!--**********************************
        Header end ti-comment-alt
    ***********************************-->

    <!--**********************************
        Sidebar start
    ***********************************-->
    <jsp:include page="/admin/includes/main-sidebar.jsp"/>
    <!--**********************************
        Sidebar end
    ***********************************-->

    <!--**********************************
        Content body start
    ***********************************-->
    <div class="content-body">
        <div class="container-fluid">

            <!-- row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Table Stripped</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-striped verticle-middle table-responsive-sm">
                                    <thead>
                                    <tr>
                                        <th scope="col">Id</th>
                                        <th scope="col">Thumbnail</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        List<Product> products = (ArrayList<Product>) request.getAttribute("products");
                                        for(Product product : products) {%>
                                    <tr>
                                        <td><%= product.getId() %></td>
                                        <td><img style="width: 70px; object-fit: cover;height: 70px" src="<%= product.getThumbnail() %>" /></td>
                                        <td>
                                            <%= product.getName() %>
                                        </td>
                                        <td><%= product.getPrice() %></td>
                                        <td><%= product.getStatus() %>
                                        </td>
                                        <td><span><a href="/products/update?id=<%= product.getId() %>" class="mr-4" data-toggle="tooltip"
                                                     data-placement="top" title="Edit"><i
                                                class="fa fa-pencil color-muted"></i> </a><a
                                                href="/products/delete?id=<%= product.getId() %>" data-toggle="tooltip"
                                                data-placement="top" title="Close"><i
                                                class="fa fa-close color-danger"></i></a></span>
                                        </td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--**********************************
        Content body end
    ***********************************-->


    <!--**********************************
        Footer start
    ***********************************-->
    <div class="footer">
        <div class="copyright">
            <p>Copyright © Designed &amp; Developed by <a href="#" target="_blank">Quixkit</a> 2019</p>
        </div>
    </div>
    <!--**********************************
        Footer end
    ***********************************-->

    <!--**********************************
       Support ticket button start
    ***********************************-->

    <!--**********************************
       Support ticket button end
    ***********************************-->


</div>
<!--**********************************
    Main wrapper end
***********************************-->

<!--**********************************
    Scripts
***********************************-->
<!-- Required vendors -->
<jsp:include page="/admin/includes/script.jsp"/>

</body>
</html>
