package com.example.lab03.controller.category;

import com.example.lab03.entity.Category;
import com.example.lab03.entity.Product;
import com.example.lab03.model.CategoryModel;
import com.example.lab03.model.MySqlCategoryModel;
import com.example.lab03.model.MySqlProductModel;
import com.example.lab03.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ListCategoryServlet extends HttpServlet {
    private CategoryModel categoryModel;
    @Override
    public void init() throws ServletException {
        categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Category> products = categoryModel.findAll();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/product/product.jsp").forward(req, resp);
    }
}
