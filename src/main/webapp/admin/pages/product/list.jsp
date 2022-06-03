<%@ page import="java.util.List" %>
<%@ page import="com.example.com.example.lab03.entity.Product" %>
<%@ page import="com.example.com.example.lab03.entity.ViewEntity.MessageView" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<jsp:include page="/admin/includes/head.jsp">
    <jsp:param name="title" value="Form"/>
</jsp:include>
<%
    List<Product> productList = (List<Product>) request.getAttribute("productList");
    MessageView messageView = (MessageView) session.getAttribute("message");
    session.removeAttribute("message");
    String alertType = "success";
    if (messageView != null) {
        switch (messageView.getMessageType()) {
            case SUCCESS:
                alertType = "success";
                break;
            case ERROR:
                alertType = "danger";
                break;
            case WARNING:
                alertType = "warning";
                break;
            default:
                break;
        }
    }
%>
<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">
<!--    <script>-->
<!--      NProgress.configure({ showSpinner: false });-->
<!--      NProgress.start();-->
<!--    </script>-->
<div class="mobile-sticky-body-overlay"></div>
<div class="wrapper">
    <jsp:include page="/admin/includes/sidebar.jsp"/>
    <div class="page-wrapper">
        <jsp:include page="/admin/includes/navbar.jsp"/>
        <div class="content-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="card card-table-border-none" id="recent-orders">
                            <div class="card-header justify-content-between">
                                <h2>Products</h2>
                                <div class="date-range-report ">
                                    <span></span>
                                </div>
                            </div>
                            <div class="card-body pt-0 pb-5">
                                <% if (messageView != null) { %>
                                <div class="alert alert-<%=alertType%> alert-highlighted" role="alert">
                                    <%= messageView.getContent() %>
                                </div>
                                <% } %>
                                <table class="table card-table table-responsive table-responsive-large"
                                       style="width:100%">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Thumbnail</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Status</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <% for (Product product : productList) { %>
                                    <tr>
                                        <td scope="row"><%=product.getId()%>
                                        </td>
                                        <td>
                                            <img width="200" src="<%=product.getThumbnail()%>"/>
                                        </td>
                                        <td><%=product.getName()%>
                                        </td>
                                        <td><%=product.getPrice()%>
                                        </td>
                                        <td>
                                            <span class="badge badge-success">
                                                <%= product.getStatus() %>
                                            </span>
                                        </td>
                                        <td>
                                            <div class="dropdown show d-inline-block widget-dropdown">
                                                <a class="dropdown-toggle icon-burger-mini" href="" role="button"
                                                   id="dropdown-recent-order1" data-toggle="dropdown"
                                                   aria-haspopup="true" aria-expanded="false" data-display="static"></a>
                                                <ul class="dropdown-menu dropdown-menu-right"
                                                    aria-labelledby="dropdown-recent-order1">
                                                    <li class="dropdown-item">
                                                        <a href="/admin/products/update?id=<%=product.getId()%>">View</a>
                                                    </li>
                                                    <li class="dropdown-item">
                                                        <a href="#" data-toggle="modal"
                                                           data-target="#exampleModal<%= product.getId() %>">Remove</a>

                                                    </li>
                                                </ul>
                                            </div>
                                            <!-- Modal -->
                                            <div class="modal fade" id="exampleModal<%= product.getId() %>"
                                                 tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                                 aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">
                                                                Confirmation</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Are you sure to delete <%= product.getName() %>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger btn-pill"
                                                                    data-dismiss="modal">Close
                                                            </button>
                                                            <a href="/admin/products/delete?id=<%=product.getId()%>"
                                                               class="btn btn-primary btn-pill">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/admin/includes/footer.jsp"/>
    </div>
</div>
<jsp:include page="/admin/includes/script.jsp"/>
</body>
</html>
