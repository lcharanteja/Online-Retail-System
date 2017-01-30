package com.tcs.ilp.ors.bean;

public class OrderDetailsBean {
String orderDetailId,itemId,itemName,orderId;
int quantity;
double price;
public String getOrderDetailId() {
	return orderDetailId;
}
public void setOrderDetailId(String orderDetailId) {
	this.orderDetailId = orderDetailId;
}
public String getItemId() {
	return itemId;
}
public void setItemId(String itemId) {
	this.itemId = itemId;
}
public String getItemName() {
	return itemName;
}
public void setItemName(String itemName) {
	this.itemName = itemName;
}
public String getOrderId() {
	return orderId;
}
public void setOrderId(String orderId) {
	this.orderId = orderId;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
}
