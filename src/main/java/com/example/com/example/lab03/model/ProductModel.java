package com.example.com.example.lab03.model;

import com.example.com.example.lab03.entity.Product;

import java.util.List;

public interface ProductModel {

    boolean create(Product obj);
    boolean update(int id, Product obj);
    boolean delete(int id);
    Product findById(int id);
    List<Product> findAll();
}
