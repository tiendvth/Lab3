package com.example.com.example.lab03.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ShoppingCart {
    private  double totalPrice;
    private String shipName;
    private String shipAdress;
    private String shipPhone;
    private String shipNote;
    private HashMap<Integer, CartItem> item;

    public ShoppingCart() {
        item = new HashMap<>();
    }
    public List<CartItem> getListItem(){
        return new ArrayList<>(item.values());
    }

    public List<CartItem> getListItems() {
        return new ArrayList<>(item.values());
    }


    public  boolean add(Product product, int quantity) {
        CartItem cartItem = null;
        if (item.containsKey(product.getId())) {
            cartItem = item.get(product.getId());
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
        } else {
            cartItem = CartItem.CartItemBuilder.aCartItem()
                    .withProductId(product.getId())
                    .withProductName(product.getName())
                    .withProductThumbnail(product.getThumbnail())
                    .withUnitPrice(product.getPrice())
                    .withQuantity(quantity)
                    .build();
        }
        item.put(product.getId(), cartItem);
        return true;
    }
    public boolean sub(Product product, int quantity) {
        CartItem cartItem = null;
        if (item.containsKey(product.getId())) {
            cartItem = item.get(product.getId());
            int updateQuantity = cartItem.getQuantity() - quantity;
            if (updateQuantity <= 0) {
                item.remove(product.getId());
            } else {
                cartItem.setQuantity(updateQuantity);
            }
        }
        return true;
    }
    public boolean remove(int productId) {
        if (item.containsKey(productId)) {
            item.remove(productId);
            return true;
        }
        return false;
    }

    public void clear() {
        item.clear();
    }

    public ShoppingCart(double totalPrice, String shipName, String shipAdress, String shipPhone, String shipNote, HashMap<Integer, CartItem> item) {
        this.totalPrice = totalPrice;
        this.shipName = shipName;
        this.shipAdress = shipAdress;
        this.shipPhone = shipPhone;
        this.shipNote = shipNote;
        this.item = item;
    }

    @Override
    public String toString() {
        return "ShoppingCart{" +
                "totalPrice=" + totalPrice +
                ", shipName='" + shipName + '\'' +
                ", shipAdress='" + shipAdress + '\'' +
                ", shipPhone='" + shipPhone + '\'' +
                ", shipNote='" + shipNote + '\'' +
                ", item=" + item +
                '}';
    }

    public double getTotalPrice() {
        if (item.size() == 0) {
            return 0;
        }
        totalPrice = 0;
        for (CartItem item : getListItems()) {
            totalPrice += item.getUnitPrice() * item.getQuantity();
        }
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipAdress() {
        return shipAdress;
    }

    public void setShipAdress(String shipAdress) {
        this.shipAdress = shipAdress;
    }

    public String getShipPhone() {
        return shipPhone;
    }

    public void setShipPhone(String shipPhone) {
        this.shipPhone = shipPhone;
    }

    public String getShipNote() {
        return shipNote;
    }

    public void setShipNote(String shipNote) {
        this.shipNote = shipNote;
    }

    public HashMap<Integer, CartItem> getItem() {
        return item;
    }

    public void setItem(HashMap<Integer, CartItem> item) {
        this.item = item;
    }
}
