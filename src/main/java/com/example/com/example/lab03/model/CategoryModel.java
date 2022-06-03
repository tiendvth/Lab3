package com.example.com.example.lab03.model;

import com.example.com.example.lab03.entity.Category;

import java.util.List;

public interface CategoryModel {
    boolean create(Category obj);
    boolean update(int id, Category obj);
    boolean delete(int id);
    Category findById(int id);
    List<Category> findAll();
}
