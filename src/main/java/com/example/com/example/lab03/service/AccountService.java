package com.example.com.example.lab03.service;

import com.example.com.example.lab03.entity.Account;
import com.example.com.example.lab03.model.AccountModel;
import com.example.com.example.lab03.model.MySqlAccountModel;
import com.example.com.example.lab03.util.SHA512Hasher;

public class AccountService {
    private AccountModel accountModel;

    public AccountService() {
        this.accountModel = new MySqlAccountModel();
    }

    public Account register(Account account) {
        String salt = SHA512Hasher.randomString(7);
        String passwordHash = SHA512Hasher.encode(account.getPassword(), salt);
        account.setPassword(passwordHash + "." + salt);
        accountModel.save(account);
        return account;
    }

    public Account login(String username, String password) {
        Account account = accountModel.findByUsername(username);
        if (account != null && SHA512Hasher.checkPassword(account.getPassword(), password)) {
            return account;
        }
        return null;
    }
}
