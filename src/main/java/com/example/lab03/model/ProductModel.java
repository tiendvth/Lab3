package com.example.lab03.model;

import com.example.lab03.entity.Product;

import java.sql.SQLException;
import java.util.List;

public interface ProductModel {

    boolean save(Product product);
    boolean update(int id, Product productUpdate);
    boolean delete(int id);
    List<Product> findAll();
    Product findById(int id);
}
