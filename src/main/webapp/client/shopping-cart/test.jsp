<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.example.com.example.lab03.util.ShoppingCartHelper" %>
<%@ page import="com.example.com.example.lab03.entity.ShoppingCart" %>
<%@ page import="com.example.com.example.lab03.entity.CartItem" %>
--%>
<%
    ShoppingCartHelper shoppingCartHelper = new ShoppingCartHelper(request);
    ShoppingCart shoppingCart = shoppingCartHelper.getCart();
    Locale loc = new Locale("vi", "VN");
    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
%>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<jsp:include page="/client/includes/head.jsp"/>
<body>
<div id="app">
    <div id="main">
        <section class=" pb-5">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="table-responsive">
                                <table class="table table-borderless table-shopping-cart">
                                    <thead>
                                    <tr>
                                        <th style="padding-left: 35px">Sản phẩm</th>
                                        <th>Tên sản Phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                        <th>Chỉnh sửa</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <%for (CartItem cartItem : shoppingCart.getListItems()) {%>
                                        <td>
                                            <div class="itemside align-items-center">
                                                <div class="aside"><img src="<%=cartItem.getProductThumbnail()%>"
                                                                        class="img-fluid d-none d-md-block rounded shadow"
                                                                        width="120px"></div>
                                            </div>
                                        </td>
                                        <td><h5><%=cartItem.getProductName()%>
                                        </h5></td>
                                        <td><input style="outline: none; width: 100px" type="number" min="1"
                                                   name="productQuantity"
                                                   value="<%=cartItem.getQuantity()%>"></td>
                                        <td><%=nf.format(cartItem.getUnitPrice())%> USD</td>
                                        <td>
                                            <button class="btn btn-success"><a
                                                    href="/shopping-cart/add?productId=<%=cartItem.getProductId()%>&quantity=1"
                                                    style="text-decoration: none; color: black">+</a></button>
                                            <button class="btn btn-primary"><a
                                                    href="/shopping-cart/sub?productId=<%=cartItem.getProductId()%>&quantity=1"
                                                    style="text-decoration: none; color: black">-</a></button>
                                            <button class="btn btn-danger"><a
                                                    href="/shopping-cart/remove?productId=<%=cartItem.getProductId()%>"
                                                    style="text-decoration: none; color: black">x</a></button>
                                        </td>
                                        <%}%>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="checkout spad">
            <div class="container">
                <div class="checkout__form">
                    <h4>Chi Tiết Thanh Toán</h4>
                    <form method="post" action="/create-payment">
                        <%--                        @csrf--%>
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Họ Và Tên<span>*</span></p>
                                            <input type="text" name="shipName">

                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Địa Chỉ<span>*</span></p>
                                            <input type="text" placeholder="" class="checkout__input__add"
                                                   name="shipAddress">

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Số Điện Thoại<span>*</span></p>
                                            <input type="text" name="shipPhone">

                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input type="text" name="email">

                                        </div>
                                    </div>
                                </div>
                                <div class="checkout__input">
                                    <p>Ghi Chú</p>
                                    <input type="text" placeholder="" name="note">
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <dl class="dlist-align">
                                            <dt>Tổng :</dt>
                                            <dd class="text-right text-dark b ml-3">
                                                <strong><%=nf.format(shoppingCart.getTotalPrice())%> USD</strong>
                                            </dd>
                                        </dl>
                                        <hr>
                                        <button type="submit" class="btn btn-out btn-primary btn-square btn-main">Đặt
                                            Hàng
                                        </button>
                                        <a href="/products"
                                           class="btn btn-out btn-success btn-square btn-main mt-2"
                                           data-abc="true">Tiếp Tục Mua Hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>


        <jsp:include page="/client/includes/footer.jsp"/>
    </div>
</div>
<jsp:include page="/client/includes/script.jsp"/>
</body>
</html>