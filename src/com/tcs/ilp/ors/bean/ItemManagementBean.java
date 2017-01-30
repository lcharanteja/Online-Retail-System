package com.tcs.ilp.ors.bean;

public class ItemManagementBean {
	
	private String departmentid;
	private String itemid;
	public ItemManagementBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(String departmentid) {
		this.departmentid = departmentid;
	}
	public String getItemid() {
		return itemid;
	}
	public void setItemid(String itemid) {
		this.itemid = itemid;
	}
	public ItemManagementBean(String departmentid, String itemid) {
		super();
		this.departmentid = departmentid;
		this.itemid = itemid;
	}
	
	

}
