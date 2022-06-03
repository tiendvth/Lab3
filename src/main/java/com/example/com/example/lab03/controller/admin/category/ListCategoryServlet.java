package com.example.com.example.lab03.controller.admin.category;

import com.example.com.example.lab03.entity.Category;
import com.example.com.example.lab03.model.CategoryModel;
import com.example.com.example.lab03.model.MySqlCategoryModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ListCategoryServlet extends HttpServlet {
    private CategoryModel categoryModel;

    @Override
    public void init() throws ServletException {
        categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Category> categoryList = categoryModel.findAll();
        if(categoryList == null) {
            categoryList = new ArrayList<>();
        }
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("/admin/pages/category/list.jsp").forward(req, res);
    }
}
