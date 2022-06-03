package com.example.com.example.lab03.model;

import com.example.com.example.lab03.contanst.SqlConstant;
import com.example.com.example.lab03.entity.Product;
import com.example.com.example.lab03.entity.myEnum.ProductStatus;
import com.example.com.example.lab03.util.ConnectionHelper;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class MySqlProductModel implements ProductModel {
    @Override
    public boolean create(Product product) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.PRODUCT_INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setString(3, product.getDetail());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getThumbnail());
            preparedStatement.setInt(6, product.getCategoryId());
            preparedStatement.setString(7, product.getCreatedAt().toString());
            preparedStatement.setString(8, product.getUpdatedAt().toString());
            if(product.getDeletedAt() != null) {
                preparedStatement.setString(9, product.getDeletedAt().toString());
            }else {
                preparedStatement.setString(9, null);
            }
            preparedStatement.setInt(10, product.getCreatedBy());
            preparedStatement.setInt(11, product.getUpdatedBy());
            preparedStatement.setInt(12, product.getDeletedBy());
            preparedStatement.setInt(13, product.getStatus().getValue());
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    @Override
    public boolean update(int id, Product product) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.PRODUCT_UPDATE);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDescription());
            preparedStatement.setString(3, product.getDetail());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setString(5, product.getThumbnail());
            preparedStatement.setInt(6, product.getCategoryId());
            preparedStatement.setString(7, product.getCreatedAt().toString());
            preparedStatement.setString(8, product.getUpdatedAt().toString());
            if(product.getDeletedAt() != null) {
                preparedStatement.setString(9, product.getDeletedAt().toString());
            }else {
                preparedStatement.setString(9, null);
            }
            preparedStatement.setInt(10, product.getCreatedBy());
            preparedStatement.setInt(11, product.getUpdatedBy());
            preparedStatement.setInt(12, product.getDeletedBy());
            preparedStatement.setInt(13, product.getStatus().getValue());
            preparedStatement.setInt(14, id);
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
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.PRODUCT_DELETE);
            preparedStatement.setInt(1, id);
            return preparedStatement.executeUpdate() > 0;
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.PRODUCT_FIND_BY_ID);
            preparedStatement.setInt(1, id);
            preparedStatement.setInt(2, ProductStatus.ACTIVE.getValue());
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                return resultSetToProduct(rs);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        try{
            Connection connection = ConnectionHelper.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SqlConstant.PRODUCT_FIND_ALL);
            preparedStatement.setInt(1, ProductStatus.ACTIVE.getValue());
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                Product product = resultSetToProduct(rs);
                if(product != null) {
                    products.add(product);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product resultSetToProduct(ResultSet rs)
    {
        try{
            int id = Integer.parseInt(rs.getString(SqlConstant.PRODUCT_FIELD_ID));
            String name = rs.getString(SqlConstant.PRODUCT_FIELD_NAME);
            String description = rs.getString(SqlConstant.PRODUCT_FIELD_DESCRIPTION);
            String detail = rs.getString(SqlConstant.PRODUCT_FIELD_DETAIL);
            Double price = rs.getDouble(SqlConstant.PRODUCT_FIELD_PRICE);
            String thumbnail = rs.getString(SqlConstant.PRODUCT_FIELD_THUMBNAIL);
            int categoryId = rs.getInt(SqlConstant.PRODUCT_FIELD_CATEGORY_ID);
            LocalDateTime createdAt = rs.getTimestamp(SqlConstant.FIELD_CREATED_AT).toLocalDateTime();
            LocalDateTime updatedAt = rs.getTimestamp(SqlConstant.FIELD_UPDATED_AT).toLocalDateTime();
            LocalDateTime deletedAt = null;
            if(rs.getTimestamp(SqlConstant.FIELD_DELETED_AT) != null) {
                deletedAt = rs.getTimestamp(SqlConstant.FIELD_DELETED_AT).toLocalDateTime();
            }
            int createdBy = rs.getInt(SqlConstant.FIELD_CREATED_BY);
            int updatedBy = rs.getInt(SqlConstant.FIELD_UPDATED_BY);
            int deletedBy = rs.getInt(SqlConstant.FIELD_DELETED_BY);
            ProductStatus status = ProductStatus.of(rs.getInt(SqlConstant.PRODUCT_FIELD_STATUS));
            return Product.ProductBuilder.aProduct()
                    .withId(id)
                    .withName(name)
                    .withDescription(description)
                    .withDetail(detail)
                    .withPrice(price)
                    .withThumbnail(thumbnail)
                    .withCategoryId(categoryId)
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
