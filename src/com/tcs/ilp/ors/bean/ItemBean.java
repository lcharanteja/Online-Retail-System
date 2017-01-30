package com.tcs.ilp.ors.bean;

import java.io.InputStream;

public class ItemBean {
	private String itemId;
	private String itemName;
	private double itemPrice;
	private int itemQuantity,buyQuantity;
	public int getBuyQuantity() {
		return buyQuantity;
	}
	public void setBuyQuantity(int buyQuantity) {
		this.buyQuantity = buyQuantity;
	}
	private String itemFlavor;
	private String cancellationStatus;
	private String availabilityStatus;
	private String itemImage;
	private String deptName;
	
	public String getItemImage() {
		return itemImage;
	}
	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
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
	public double getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(double itemPrice) {
		this.itemPrice = itemPrice;
	}
	public int getItemQuantity() {
		return itemQuantity;
	}
	public void setItemQuantity(int itemQuantity) {
		this.itemQuantity = itemQuantity;
	}
	public String getItemFlavor() {
		return itemFlavor;
	}
	public void setItemFlavor(String itemFlavor) {
		this.itemFlavor = itemFlavor;
	}
	public String getCancellationStatus() {
		return cancellationStatus;
	}
	public void setCancellationStatus(String cancellationStatus) {
		this.cancellationStatus = cancellationStatus;
	}
	public String getAvailabilityStatus() {
		return availabilityStatus;
	}
	public void setAvailabilityStatus(String availabilityStatus) {
		this.availabilityStatus = availabilityStatus;
	}/*
	public InputStream getItemImage() {
		return itemImage;
	}
	public void setItemImage(InputStream itemImage) {
		this.itemImage = itemImage;
	}*/
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	

}
