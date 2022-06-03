package com.example.com.example.lab03.controller.admin.product;

import com.example.com.example.lab03.entity.Product;
import com.example.com.example.lab03.model.MySqlProductModel;
import com.example.com.example.lab03.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ListProductServlet extends HttpServlet {
    private ProductModel productModel;

    @Override
    public void init() throws ServletException {
        productModel = new MySqlProductModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Product> productList = productModel.findAll();
        if(productList == null) {
            productList = new ArrayList<>();
        }
        req.setAttribute("productList", productList);
        req.getRequestDispatcher("/admin/pages/product/list.jsp").forward(req, res);
    }
}
