package com.tcs.ilp.ors.bean;

public class OrderBean {

	String orderid;
	String orderDate;
	double price;
	String customerid;
	String status;
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	OutletBean obean;
	public OutletBean getObean() {
		return obean;
	}
	public void setObean(OutletBean obean) {
		this.obean = obean;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public OrderBean() {
		super();
		obean= new OutletBean();
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCustomerid() {
		return customerid;
	}
	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	} 
	
	
	
	
}
