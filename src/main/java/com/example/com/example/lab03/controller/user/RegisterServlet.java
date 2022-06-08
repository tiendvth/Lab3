package com.example.com.example.lab03.controller.user;

import com.example.com.example.lab03.entity.Account;
import com.example.com.example.lab03.model.AccountModel;
import com.example.com.example.lab03.model.MySqlAccountModel;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class RegisterServlet extends HttpServlet {
    private AccountModel accountModel;

    public RegisterServlet() {
        this.accountModel = new MySqlAccountModel();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String confirmPassword = req.getParameter("confirmPassword");
        String fullName = req.getParameter("fullName");
        Account account = Account.AccountBuilder.anAccount()
                .withUsername(username)
                .withEmail(email)
                .withPassword(password)
                .withConfirmPassword(confirmPassword)
                .withFullName(fullName)
                .build();
        if(!account.isValid()){

            req.setAttribute("account", account);
            req.setAttribute("errors", account.getErrors());
            req.getRequestDispatcher("/user/register.jsp").forward(req, resp);
            return;
        }
        // thực hiện save
        accountModel.save(account);
        req.setAttribute("account", account);
        req.getRequestDispatcher("/client/users/login.jsp").forward(req, resp);
    }

    public static void main(String[] args) {
        HashMap<String, String> errors = new HashMap<>();
        errors.put("username", "Please enter username");
        errors.put("password", "Please enter password");
        errors.put("confirmPassword", "Please enter confirm password");
        errors.put("fullName", "Please enter fullName");
        if (errors.containsKey("username")) {
        }
    }
}

