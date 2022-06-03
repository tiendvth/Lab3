
<%@ page import="java.util.HashMap" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.swing.text.html.HTMLDocument" %>
<%@ page import="com.example.com.example.lab03.entity.Category" %>
<%@ page import="com.example.com.example.lab03.contanst.ValidationConstant" %>
<%@ page import="com.example.com.example.lab03.entity.myEnum.CategoryStatus" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<jsp:include page="/admin/includes/head.jsp">
    <jsp:param name="title" value="Category - Create"/>
</jsp:include>
<%
    HTMLDocument.HTMLReader.FormAction formAction = (HTMLDocument.HTMLReader.FormAction) request.getAttribute("formAction");
    String action = "/admin/categories/create";
    if (formAction == HTMLDocument.HTMLReader.FormAction.UPDATE) {
        action = "/admin/categories/update";
    }
    HashMap<String, String> errors = (HashMap<String, String>) request.getAttribute("errors");
    if (errors == null) {
        errors = new HashMap<>();
    }
    List<Category> categoryList = (List<Category>) request.getAttribute("categoryList");
    if (categoryList == null) {
        categoryList = new ArrayList<>();
    }
    Category category = (Category) request.getAttribute("category");
    if (category == null) {
        category = new Category();
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
                                    <input type="hidden" name="id" value="<%= category.getId() %>" />
                                    <div class="form-row">
                                        <div class="col-md-12 mb-3">
                                            <label for="name">Category Name</label>
                                            <input type="text" class="form-control " id="name"
                                                   placeholder="First name" name="name" value="<%= category.getName() %>"
                                                           >
                                            <% if (errors.containsKey(ValidationConstant.CATEGORY_ERROR_KEY_NAME)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.CATEGORY_ERROR_KEY_NAME) %>
                                            </div>
                                            <% } %>

                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="parentId">Parent</label>
                                            <select class="form-control " name="parentId" id="parentId">
                                                <% for (Category item : categoryList) { %>
                                                <option value="<%= item.getId() %>" <% if (category.getParentId() == item.getId()) { %>
                                                        selected <% } %> >
                                                    <%= item.getName() %>
                                                </option>
                                                <% } %>
                                            </select>
                                            <% if (errors.containsKey(ValidationConstant.CATEGORY_ERROR_KEY_PARENT_ID_REQUIRED)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.CATEGORY_ERROR_KEY_PARENT_ID_REQUIRED) %>
                                            </div>
                                            <% } %>
                                        </div>
                                        <div class="col-md-12 mb-3">
                                            <label for="status">City</label>
                                            <select name="status" class="form-control " id="status">
                                                <% for (CategoryStatus categoryStatus : CategoryStatus.values()) { %>
                                                <option value="<%= categoryStatus.getValue() %>" <% if (category.getStatus().getValue() == categoryStatus.getValue()) { %>
                                                        selected <% } %> >
                                                    <%= categoryStatus.name() %>
                                                </option>
                                                <% } %>
                                            </select>
                                            <% if (errors.containsKey(ValidationConstant.CATEGORY_ERROR_KEY_STATUS)) { %>
                                            <div class="invalid-feedback">
                                                <%= errors.get(ValidationConstant.CATEGORY_ERROR_KEY_STATUS) %>
                                            </div>
                                            <% } %>
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
