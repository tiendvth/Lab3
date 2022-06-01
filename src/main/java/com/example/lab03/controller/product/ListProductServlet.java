package com.example.lab03.controller.product;

import com.example.lab03.entity.Product;
import com.example.lab03.model.MySqlProductModel;
import com.example.lab03.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListProductServlet  extends HttpServlet {
    private ProductModel productModel;
    @Override
    public void init() throws ServletException {
        productModel = new MySqlProductModel();
    }

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            List<Product> products = productModel.findAll();
            req.setAttribute("products", products);
            req.getRequestDispatcher("/product/product.jsp").forward(req, resp);
        }
}
