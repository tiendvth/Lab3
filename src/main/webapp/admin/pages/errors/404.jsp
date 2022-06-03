<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<jsp:include page="/admin/includes/head.jsp">
    <jsp:param name="title" value="Form"/>
</jsp:include>
<body class="sidebar-fixed sidebar-dark header-light header-fixed" id="body">

<div class="mobile-sticky-body-overlay"></div>
<div class="wrapper">
    <jsp:include page="/admin/includes/sidebar.jsp"/>
    <div class="page-wrapper">
        <jsp:include page="/admin/includes/navbar.jsp"/>
        <div class="content-wrapper">
            <div class="content">
                <div class="error-wrapper rounded border bg-white px-5">
                    <div class="row justify-content-center">
                        <div class="col-xl-4">
                            <h1 class="text-primary bold error-title">404</h1>
                            <p class="pt-4 pb-5 error-subtitle">Looks like something went wrong.</p>
                            <a href="/admin/categories" class="btn btn-primary btn-pill">Back to Home</a>
                        </div>
                        <div class="col-xl-6 pt-5 pt-xl-0 text-center">
                            <img src="/admin/assets/img/lightenning.png" class="img-responsive" alt="Error Page Image">
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
