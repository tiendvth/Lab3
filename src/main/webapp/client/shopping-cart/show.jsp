<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="com.example.com.example.lab03.util.ShoppingCartHelper" %>
<%@ page import="com.example.com.example.lab03.entity.ShoppingCart" %>
<%@ page import="com.example.com.example.lab03.entity.CartItem" %>

<%
    ShoppingCartHelper shoppingCartHelper = new ShoppingCartHelper(request);
    ShoppingCart shoppingCart = shoppingCartHelper.getCart();
    Locale loc = new Locale("vi", "VN");
    NumberFormat nf = NumberFormat.getCurrencyInstance(loc);
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping Cart</title>
</head>
<body>
<h1>List products in shopping cart</h1>
<ul>
    <%for (CartItem cartItem : shoppingCart.getListItems()) {%>
    <li>
        <%=cartItem.getProductName()%>
        <%=nf.format(cartItem.getUnitPrice())%>
        <%=cartItem.getQuantity()%>
        <a href="/shopping-cart/add?productId=<%=cartItem.getProductId()%>&quantity=1"
           style="text-decoration: none">+</a>
        <a href="/shopping-cart/sub?productId=<%=cartItem.getProductId()%>&quantity=1"
           style="text-decoration: none">-</a>
        <a href="/shopping-cart/remove?productId=<%=cartItem.getProductId()%>" style="text-decoration: none">x</a>
    </li>
    <%}%>
</ul>
<strong>Total price: <%=nf.format(shoppingCart.getTotalPrice())%>
</strong>
<div>
    <strong><a href="/products" style="text-decoration: none">Back to shopping cart</a></strong>
</div>
</body>
</html>
