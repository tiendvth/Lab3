package com.example.lab03.controller.category;

import com.example.lab03.entity.Category;
import com.example.lab03.entity.Product;
import com.example.lab03.entity.myEnum.CategoryStatus;
import com.example.lab03.entity.myEnum.ProductStatus;
import com.example.lab03.model.CategoryModel;
import com.example.lab03.model.MySqlCategoryModel;
import com.example.lab03.model.MySqlProductModel;
import com.example.lab03.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

public class CategoryServlet extends HttpServlet {
    CategoryModel categoryModel;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/product/create-product.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        categoryModel = new MySqlCategoryModel();
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        Category category = new Category();
        category.setName(name);

        category.setStatus(CategoryStatus.ACTIVE);
        if (!category.isValid()) {
            req.setAttribute("category", category);
            req.setAttribute("errors", category.getErrors());
            req.getRequestDispatcher("/category/create-category.jsp").forward(req, resp);
            return;
        }
        boolean result = categoryModel.save(category);
        if (result) {
            resp.sendRedirect("/list-product");
        }
        System.out.println(result);
    }
}
