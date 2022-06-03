package com.example.com.example.lab03.controller.admin.category;

import com.example.com.example.lab03.entity.Category;
import com.example.com.example.lab03.entity.ViewEntity.MessageView;
import com.example.com.example.lab03.entity.myEnum.CategoryStatus;
import com.example.com.example.lab03.entity.myEnum.FormAction;
import com.example.com.example.lab03.entity.myEnum.MessageType;
import com.example.com.example.lab03.model.CategoryModel;
import com.example.com.example.lab03.model.MySqlCategoryModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
public class UpdateCategoryServlet extends HttpServlet {
    private CategoryModel categoryModel;

    @Override
    public void init() throws ServletException {
        categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int categoryId = Integer.parseInt(req.getParameter("id"));
        Category category = categoryModel.findById(categoryId);
        List<Category> categoryList = categoryModel.findAll();
        req.setAttribute("formAction", FormAction.UPDATE);
        req.setAttribute("categoryList", categoryList);
        req.setAttribute("category", category);
        System.out.println("Hello");
        req.getRequestDispatcher("/admin/pages/category/form.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
        int id = Integer.parseInt(req.getParameter("id"));
        if (categoryModel.findById(id) == null) {
            req.getRequestDispatcher("/admin/pages/errors/404.jsp").forward(req, res);
            return;
        }
        String name = req.getParameter("name");
        int status = Integer.parseInt(req.getParameter("status"));
        int parentId = Integer.parseInt(req.getParameter("parentId"));
        Category category = Category.CategoryBuilder.aCategory()
                .withName(name)
                .withStatus(CategoryStatus.of(status))
                .withParentId(parentId)
                .build2();
        if (category.isValid()) {
            HttpSession session = req.getSession();
            MessageView messageView = new MessageView();
            if(categoryModel.update(id, category)) {
                messageView.setMessageType(MessageType.SUCCESS);
                messageView.setContent("Update category successfully !");
            }else {
                messageView.setMessageType(MessageType.ERROR);
                messageView.setContent("Update category failed");
            }
            session.setAttribute("message", messageView);
            res.sendRedirect("/admin/categories");
            return;
        }
        req.setAttribute("category", category);
        req.setAttribute("formAction", FormAction.UPDATE);
        req.setAttribute("errors", category.getErrors());
        List<Category> categoryList = categoryModel.findAll();
        req.setAttribute("formAction", FormAction.CREATE);
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("/admin/pages/category/form.jsp").forward(req, res);
    }
}

