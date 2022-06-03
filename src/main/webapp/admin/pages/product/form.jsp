<%@ page import="java.util.HashMap" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.swing.text.html.HTMLDocument" %>
<%@ page import="com.example.com.example.lab03.entity.Category" %>
<%@ page import="com.example.com.example.lab03.entity.Product" %>
<%@ page import="com.example.com.example.lab03.contanst.ValidationConstant" %>
<%@ page import="com.example.com.example.lab03.entity.myEnum.ProductStatus" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<jsp:include page="/admin/includes/head.jsp">
    <jsp:param name="title" value="Product - Create"/>
</jsp:include>
<%
    HTMLDocument.HTMLReader.FormAction formAction = (HTMLDocument.HTMLReader.FormAction) request.getAttribute("formAction");
    String action = "/admin/products/create";
    if (formAction == HTMLDocument.HTMLReader.FormAction.UPDATE) {
        action = "/admin/products/update";
    }
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (errors == null) {
        errors = new HashMap<>();
    }
    List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
    if (categoryList == null) {
        categoryList = new ArrayList<>();
    }
    Product product = (Product) request.getAttribute("product");
    if (product == null) {
        product = new Product();
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
                    <div class="col-lg-12">
                        <div class="card card-default">
                            <div class="card-header card-header-border-bottom">
                                <h2>Create</h2>
                            </div>
                            <div class="card-body">
                                <form action="<%= action %>" method="post">
                                    <input type="hidden" name="id" value="<%= product.getId() %>"/>
                                    <div class="form-row">
                                        <div class="col-md-12 mb-3">
                                            <label for="name">Product Name</label>
                                            <input type="text" class="form-control " id="name"
                                                   placeholder="Product Name" name="name"
                                                   value="<%= product.getName() %>"
                                            >
                                            <% if (errors.containsKey(ValidationConstant.PRODUCT_ERROR_KEY_NAME)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.PRODUCT_ERROR_KEY_NAME) %>
                                            </div>
                                            <% } %>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="thumbnail">Thumbnail</label>
                                            <input type="text" class="form-control " id="thumbnail"
                                                   placeholder="Thumbnail" name="thumbnail"
                                                   value="<%= product.getThumbnail() %>"
                                            >
                                            <% if (errors.containsKey(ValidationConstant.PRODUCT_ERROR_KEY_THUMBNAIL)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.PRODUCT_ERROR_KEY_THUMBNAIL) %>
                                            </div>
                                            <% } %>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="price">Price</label>
                                            <input type="number" class="form-control " id="price"
                                                   placeholder="Thumbnail" name="price"
                                                   value="<%= product.getPrice() %>"
                                            >
                                            <% if (errors.containsKey(ValidationConstant.PRODUCT_ERROR_KEY_PRICE)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.PRODUCT_ERROR_KEY_PRICE) %>
                                            </div>
                                            <% } %>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="categoryId">Parent</label>
                                            <select class="form-control " name="categoryId" id="categoryId">
                                                <option value="">Select category</option>
                                                <% for (Category item : categoryList) { %>
                                                <option value="<%= item.getId() %>" <% if (product.getCategoryId() == item.getId()) { %>
                                                        selected <% } %> >
                                                    <%= item.getName() %>
                                                </option>
                                                <% } %>
                                            </select>
                                            <% if (errors.containsKey(ValidationConstant.PRODUCT_ERROR_KEY_CATEGORY_ID)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.PRODUCT_ERROR_KEY_CATEGORY_ID) %>
                                            </div>
                                            <% } %>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="status">City</label>
                                            <select name="status" class="form-control " id="status">
                                                <option value="">Select status</option>
                                                <% for (ProductStatus productStatus : ProductStatus.values()) { %>
                                                <option value="<%= productStatus.getValue() %>" <% if (product.getStatus().getValue() == productStatus.getValue()) { %>
                                                        selected <% } %> >
                                                    <%= productStatus.name() %>
                                                </option>
                                                <% } %>
                                            </select>
                                            <% if (errors.containsKey(ValidationConstant.PRODUCT_ERROR_KEY_STATUS)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.PRODUCT_ERROR_KEY_STATUS) %>
                                            </div>
                                            <% } %>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-12 mb-3">
                                            <label for="description">Description</label>
                                            <textarea class="form-control " id="description"
                                                      placeholder="Description" name="description"
                                            ><%= product.getDescription() %></textarea>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="detail">Details</label>
                                            <textarea class="form-control " id="detail"
                                                      placeholder="Detail" name="detail"
                                            ><%= product.getDetail() %></textarea>
                                        </div>
                                    </div>
                                    <button class="btn btn-primary" type="submit">Submit form</button>
                                </form>
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
