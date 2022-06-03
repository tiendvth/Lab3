<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="left-sidebar bg-sidebar">
    <div id="sidebar" class="sidebar sidebar-with-footer">
        <!-- Aplication Brand -->
        <div class="app-brand">
            <a href="/index.html">
                <svg
                        class="brand-icon"
                        xmlns="http://www.w3.org/2000/svg"
                        preserveAspectRatio="xMidYMid"
                        width="30"
                        height="33"
                        viewBox="0 0 30 33"
                >
                    <g fill="none" fill-rule="evenodd">
                        <path
                                class="logo-fill-blue"
                                fill="#7DBCFF"
                                d="M0 4v25l8 4V0zM22 4v25l8 4V0z"
                        />
                        <path class="logo-fill-white" fill="#FFF" d="M11 4v25l8 4V0z"/>
                    </g>
                </svg>
                <span class="brand-name">Admin</span>
            </a>
        </div>
        <!-- begin sidebar scrollbar -->
        <div class="sidebar-scrollbar">
            <!-- sidebar menu -->
            <ul class="nav sidebar-inner" id="sidebar-menu">
                <li class="has-sub">
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse"
                       data-target="#dashboard"
                       aria-expanded="false" aria-controls="dashboard">
                        <i class="mdi mdi-view-dashboard-outline"></i>
                        <span class="nav-text">Dashboard</span> <b class="caret"></b>
                    </a>
                </li>
                <li class="has-sub <%if(request.getRequestURI().equals("/admin/pages/category/list.jsp") || request.getRequestURI().equals("/admin/pages/category/form.jsp")) {%> active expand <%}%>">
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse"
                       data-target="#category"
                       aria-expanded="false" aria-controls="category">
                        <i class="mdi mdi-view-dashboard-outline"></i>
                        <span class="nav-text">Category</span> <b class="caret"></b>
                    </a>
                    <ul class="collapse <%if(request.getRequestURI().equals("/admin/pages/category/list.jsp") || request.getRequestURI().equals("/admin/pages/category/form.jsp")) {%> show <%}%>"
                        id="category"
                        data-parent="#sidebar-menu">
                        <div class="sub-menu">
                            <li class="<%if(request.getRequestURI().equals("/admin/pages/category/form.jsp")) {%> active <%}%>">
                                <a class="sidenav-item-link" href="/admin/categories/create">
                                    <span class="nav-text">Create</span>
                                </a>
                            </li>
                            <li class="<%if(request.getRequestURI().equals("/admin/pages/category/list.jsp")) {%> active <%}%>">
                                <a class="sidenav-item-link" href="/admin/categories">
                                    <span class="nav-text">List</span>
                                </a>
                            </li>
                        </div>
                    </ul>
                </li>
                <li class="has-sub <%if(request.getRequestURI().equals("/admin/pages/product/list.jsp") || request.getRequestURI().equals("/admin/pages/product/form.jsp")) {%> active expand <%}%>">
                    <a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse"
                       data-target="#product"
                       aria-expanded="false" aria-controls="product">
                        <i class="mdi mdi-view-dashboard-outline"></i>
                        <span class="nav-text">Product</span> <b class="caret"></b>
                    </a>
                    <ul class="collapse <%if(request.getRequestURI().equals("/admin/pages/product/list.jsp") || request.getRequestURI().equals("/admin/pages/product/form.jsp")) {%> show <%}%>"
                        id="product"
                        data-parent="#sidebar-menu">
                        <div class="sub-menu">
                            <li class="<%if(request.getRequestURI().equals("/admin/pages/product/form.jsp")) {%> active <%}%>">
                                <a class="sidenav-item-link" href="/admin/products/create">
                                    <span class="nav-text">Create</span>
                                </a>
                            </li>
                            <li class="<%if(request.getRequestURI().equals("/admin/pages/product/list.jsp")) {%> active <%}%>">
                                <a class="sidenav-item-link" href="/admin/products">
                                    <span class="nav-text">List</span>
                                </a>
                            </li>
                        </div>
                    </ul>
                </li>

            </ul>

        </div>
        <hr class="separator"/>

        <div class="sidebar-footer">
            <div class="sidebar-footer-content">
                <h6 class="text-uppercase">
                    Cpu Uses <span class="float-right">40%</span>
                </h6>
                <div class="progress progress-xs">
                    <div
                            class="progress-bar active"
                            style="width: 40%;"
                            role="progressbar"
                    ></div>
                </div>
                <h6 class="text-uppercase">
                    Memory Uses <span class="float-right">65%</span>
                </h6>
                <div class="progress progress-xs">
                    <div
                            class="progress-bar progress-bar-warning"
                            style="width: 65%;"
                            role="progressbar"
                    ></div>
                </div>
            </div>
        </div>
    </div>
</aside>
