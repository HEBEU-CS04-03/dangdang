package com.hebeu.group.pojo;

import java.util.Date;

public class Orders {
    private String orderId;

    private String orderPayment;

    private String orderAdress;

    private String orderEmail;

    private String orderUser;

    private Date orderTime;

    private Float orderSum;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getOrderPayment() {
        return orderPayment;
    }

    public void setOrderPayment(String orderPayment) {
        this.orderPayment = orderPayment == null ? null : orderPayment.trim();
    }

    public String getOrderAdress() {
        return orderAdress;
    }

    public void setOrderAdress(String orderAdress) {
        this.orderAdress = orderAdress == null ? null : orderAdress.trim();
    }

    public String getOrderEmail() {
        return orderEmail;
    }

    public void setOrderEmail(String orderEmail) {
        this.orderEmail = orderEmail == null ? null : orderEmail.trim();
    }

    public String getOrderUser() {
        return orderUser;
    }

    public void setOrderUser(String orderUser) {
        this.orderUser = orderUser == null ? null : orderUser.trim();
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Float getOrderSum() {
        return orderSum;
    }

    public void setOrderSum(Float orderSum) {
        this.orderSum = orderSum;
    }
}