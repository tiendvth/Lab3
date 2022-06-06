<%@ page import="java.util.List" %>
<%@ page import="com.example.com.example.lab03.entity.Product" %>
<%
    List<Product> products = (List<Product>) request.getAttribute("product");
%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<jsp:include page="/client/includes/head.jsp"/>
<body>
<jsp:include page="/client/includes/header.jsp"/>
<div id="app">
    <div id="main">
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-5">
                        <div class="sidebar">
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-7">
                        <div class="filter__item">
                            <div class="row">
                                <div class="col-lg-4 col-md-5">
                                    <div class="filter__sort">
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4">
                                    <div class="filter__found">
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-3">
                                    <form action="">
                                        <div class="filter__option">
                                            <input class="search-product" type="text" name="search" id="search"
                                                   placeholder="Tìm Kiếm">
                                            <button type="submit" class="btn-success">Tìm Kiếm</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <%for (int i = 0; i < products.size(); i++) {%>
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%=products.get(i).getThumbnail()%>">
                                        <ul class="product__item__pic__hover">
                                            <li><a href=""><i class="fas fa-info"></i></a>
                                            </li>
                                            <li><a href="/shopping-cart/add?productId=<%=products.get(i).getId()%>&quantity=1"><i class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><%=products.get(i).getName()%></h6>
                                        <h5><%=products.get(i).getPrice()%> USD</h5>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <jsp:include page="/client/includes/footer.jsp"/>
    </div>
</div>
<jsp:include page="/client/includes/script.jsp"/>
</body>
</html>
