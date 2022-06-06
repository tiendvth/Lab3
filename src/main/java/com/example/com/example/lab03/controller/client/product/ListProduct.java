package com.example.com.example.lab03.controller.client.product;

import com.example.com.example.lab03.model.MySqlProductModel;
import com.example.com.example.lab03.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ListProduct extends HttpServlet {
    private ProductModel productModel;

    public ListProduct() {
        this.productModel = new MySqlProductModel();
    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("product", productModel.findAll());
        req.getRequestDispatcher("/client/products/list.jsp").forward(req, resp);
    }

}
