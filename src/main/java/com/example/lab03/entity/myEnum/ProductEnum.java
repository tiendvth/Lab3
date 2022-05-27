package com.example.lab03.entity.myEnum;

public enum ProductEnum {
    ACTIVE(1), DEACTIVE(0),DELETED(-1),UNDEFINED(-2);
    private int value;

    ProductEnum(int value) {
        this.value = value;
    }
    public int getValue(){
        return  value;

    }
    public static ProductEnum of(int value) {

        for (ProductEnum productEnum : ProductEnum.values()) {
            if (productEnum.getValue() == value){
                return productEnum;
            }
        }
return ProductEnum.UNDEFINED;
    }

}
