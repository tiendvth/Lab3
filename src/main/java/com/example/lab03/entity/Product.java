package com.example.lab03.entity;

import com.example.lab03.entity.Base.BasEntity;
import com.example.lab03.entity.myEnum.ProductEnum;

public class Product extends BasEntity {

    private int id;
    private String name;
    private String description;
    private String detail;
    private double price;
    private String thumbnail;
    private String manufactureEmail;
    private String manufacturePhone;
    private ProductEnum status;

    public Product() {
    }

    public Product(int id, String name, String description, String detail, double price, String thumbnail, String manufactureEmail, String manufacturePhone, ProductEnum status) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.detail = detail;
        this.price = price;
        this.thumbnail = thumbnail;
        this.manufactureEmail = manufactureEmail;
        this.manufacturePhone = manufacturePhone;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", detail='" + detail + '\'' +
                ", price=" + price +
                ", thumbnail='" + thumbnail + '\'' +
                ", manufactureEmail='" + manufactureEmail + '\'' +
                ", manufacturePhone='" + manufacturePhone + '\'' +
                ", status=" + status +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getManufactureEmail() {
        return manufactureEmail;
    }

    public void setManufactureEmail(String manufactureEmail) {
        this.manufactureEmail = manufactureEmail;
    }

    public String getManufacturePhone() {
        return manufacturePhone;
    }

    public void setManufacturePhone(String manufacturePhone) {
        this.manufacturePhone = manufacturePhone;
    }

    public ProductEnum getStatus() {
        return status;
    }

    public void setStatus(ProductEnum status) {
        this.status = status;
    }
}
