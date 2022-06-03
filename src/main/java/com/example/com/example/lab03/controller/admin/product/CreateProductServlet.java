package com.example.com.example.lab03.controller.admin.product;

import com.example.com.example.lab03.entity.Category;
import com.example.com.example.lab03.entity.Product;
import com.example.com.example.lab03.entity.ViewEntity.MessageView;
import com.example.com.example.lab03.entity.myEnum.FormAction;
import com.example.com.example.lab03.entity.myEnum.MessageType;
import com.example.com.example.lab03.entity.myEnum.ProductStatus;
import com.example.com.example.lab03.model.CategoryModel;
import com.example.com.example.lab03.model.MySqlCategoryModel;
import com.example.com.example.lab03.model.MySqlProductModel;
import com.example.com.example.lab03.model.ProductModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class CreateProductServlet extends HttpServlet {
    private ProductModel productModel;
    private CategoryModel categoryModel;

    @Override
    public void init() throws ServletException {
        productModel = new MySqlProductModel();
        categoryModel = new MySqlCategoryModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<Category> categoryList = categoryModel.findAll();
        req.setAttribute("formAction", FormAction.CREATE);
        req.setAttribute("categoryList", categoryList);
        req.getRequestDispatcher("/admin/pages/product/form.jsp").forward(req, res);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        res.setCharacterEncoding("UTF-8");
        res.setContentType("text/html; charset=UTF-8");
        String name = req.getParameter("name");
        String thumbnail = req.getParameter("thumbnail");
        String description = req.getParameter("description");
        String detail = req.getParameter("detail");
        Double price = Double.parseDouble(req.getParameter("price"));
        int status = Integer.parseInt(req.getParameter("status"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Product product = Product.ProductBuilder.aProduct()
                .withName(name)
                .withThumbnail(thumbnail)
                .withDescription(description)
                .withDetail(detail)
                .withPrice(price)
                .withStatus(ProductStatus.of(status))
                .withCategoryId(categoryId)
                .build2();
        if (product.isValid()) {
            HttpSession session = req.getSession();
            MessageView messageView = new MessageView();
            if(productModel.create(product)) {
                messageView.setMessageType(MessageType.SUCCESS);
                messageView.setContent("Create new product successfully !");
            }else {
                messageView.setMessageType(MessageType.ERROR);
                messageView.setContent("Create new product failed !");
            }
            session.setAttribute("message", messageView);
            res.sendRedirect("/admin/products");
            return;
        }
        List<Category> categoryList = categoryModel.findAll();
        req.setAttribute("product", product);
        req.setAttribute("categoryList", categoryList);
        req.setAttribute("formAction", FormAction.CREATE);
        req.setAttribute("errors", product.getErrors());
        List<Product> productList = productModel.findAll();
        req.setAttribute("formAction", FormAction.CREATE);
        req.setAttribute("productList", productList);
        req.getRequestDispatcher("/admin/pages/product/form.jsp").forward(req, res);

    }
}

