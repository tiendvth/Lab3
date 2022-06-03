package com.example.com.example.lab03.model;

import com.example.com.example.lab03.contanst.SqlConstant;
import com.example.com.example.lab03.entity.Category;
import com.example.com.example.lab03.entity.myEnum.CategoryStatus;
import com.example.com.example.lab03.util.ConnectionHelper;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class MySqlCategoryModel implements CategoryModel {
    @Override
    public boolean create(Category category) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.CATEGORY_INSERT);
            preparedStatement.setString(1, category.getName());
            preparedStatement.setInt(2, category.getParentId());
            preparedStatement.setString(3, category.getCreatedAt().toString());
            preparedStatement.setString(4, category.getUpdatedAt().toString());
            preparedStatement.setInt(5, category.getCreatedBy());
            preparedStatement.setInt(6, category.getUpdatedBy());
            preparedStatement.setInt(7, category.getStatus().getValue());
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(int id, Category category) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.CATEGORY_UPDATE);
            preparedStatement.setString(1, category.getName());
            preparedStatement.setInt(2, category.getParentId());
            preparedStatement.setString(3, category.getCreatedAt().toString());
            preparedStatement.setString(4, category.getUpdatedAt().toString());
            if(category.getDeletedAt() != null) {
                preparedStatement.setString(5, category.getDeletedAt().toString());
            }else {
                preparedStatement.setString(5, null);
            }
            preparedStatement.setInt(6, category.getCreatedBy());
            preparedStatement.setInt(7, category.getUpdatedBy());
            preparedStatement.setInt(8, category.getDeletedBy());
            preparedStatement.setInt(9, category.getStatus().getValue());
            preparedStatement.setInt(10, id);
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.CATEGORY_DELETE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public Category findById(int id) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.CATEGORY_FIND_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, CategoryStatus.ACTIVE.getValue());
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                return resultSetToCategory(rs);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Category> findAll() {
        List<Category> categories = new ArrayList<>();
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.CATEGORY_FIND_ALL);
            preparedStatement.setInt(1, CategoryStatus.ACTIVE.getValue());
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                Category product = resultSetToCategory(rs);
                if(product != null) {
                    categories.add(product);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public Category resultSetToCategory(ResultSet rs)
    {
        try{
            int id = Integer.parseInt(rs.getString(SqlConstant.CATEGORY_FIELD_ID));
            String name = rs.getString(SqlConstant.CATEGORY_FIELD_NAME);
            int parentId = rs.getInt(SqlConstant.CATEGORY_FIELD_PARENT_ID);
            LocalDateTime createdAt = rs.getTimestamp(SqlConstant.FIELD_CREATED_AT).toLocalDateTime();
            LocalDateTime updatedAt = rs.getTimestamp(SqlConstant.FIELD_UPDATED_AT).toLocalDateTime();
            LocalDateTime deletedAt = null;
            if(rs.getTimestamp(SqlConstant.FIELD_DELETED_AT) != null) {
                deletedAt = rs.getTimestamp(SqlConstant.FIELD_DELETED_AT).toLocalDateTime();
            }
            int createdBy = rs.getInt(SqlConstant.FIELD_CREATED_BY);
            int updatedBy = rs.getInt(SqlConstant.FIELD_UPDATED_BY);
            int deletedBy = rs.getInt(SqlConstant.FIELD_DELETED_BY);
            CategoryStatus status = CategoryStatus.of(rs.getInt(SqlConstant.CATEGORY_FIELD_STATUS));
            return Category.CategoryBuilder.aCategory()
                    .withId(id)
                    .withName(name)
                    .withParentId(parentId)
                    .withCreatedAt(createdAt)
                    .withUpdatedAt(updatedAt)
                    .withDeletedAt(deletedAt)
                    .withCreatedBy(createdBy)
                    .withUpdatedBy(updatedBy)
                    .withDeletedBy(deletedBy)
                    .withStatus(status)
                    .build();
        }catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
