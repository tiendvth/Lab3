package com.example.com.example.lab03.controller.admin.category;

import com.example.com.example.lab03.entity.Category;
import com.example.com.example.lab03.entity.ViewEntity.MessageView;
import com.example.com.example.lab03.entity.myEnum.MessageType;
import com.example.com.example.lab03.model.CategoryModel;
import com.example.com.example.lab03.model.MySqlCategoryModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteCategoryServlet extends HttpServlet {
    private CategoryModel categoryModel;

    @Override
    public void init() throws ServletException {
        categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        if(req.getParameter("id") == null) {
            req.getRequestDispatcher("/admin/pages/errors/404.jsp").forward(req, res);
            return;
        }
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryModel.findById(id);
        if(category == null) {
            req.getRequestDispatcher("/admin/pages/errors/404.jsp").forward(req, res);
            return;
        }
        MessageView messageView = new MessageView();
        HttpSession session = req.getSession();
        if(categoryModel.delete(id)) {
            messageView.setMessageType(MessageType.SUCCESS);
            messageView.setContent("Delete category successfully !");
        }else {
            messageView.setMessageType(MessageType.ERROR);
            messageView.setContent("Delete category failed !");
        }
        session.setAttribute("message", messageView);
        res.sendRedirect("/admin/categories");
    }
}
