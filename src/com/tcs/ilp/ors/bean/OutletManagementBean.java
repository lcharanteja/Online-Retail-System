package com.tcs.ilp.ors.bean;

public class OutletManagementBean {
	private String outletmanagementid;
	private String outletid;
	private String departmentid;
	
	public OutletManagementBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OutletManagementBean(String outletmanagementid,String outletid, String departmentid) {
		super();
		this.outletmanagementid=outletmanagementid;
		this.outletid = outletid;
		this.departmentid = departmentid;
	}
	public String getOutletmgmtid() {
		return outletmanagementid;
	}
	public void setOutletmgmtid(String outletmgmtid) {
		this.outletmanagementid = outletmgmtid;
	}
	public String getOutletid() {
		return outletid;
	}
	public void setOutletid(String outletid) {
		this.outletid = outletid;
	}
	public String getDepartmentid() {
		return departmentid;
	}
	public void setDepartmentid(String departmentid) {
		this.departmentid = departmentid;
	}
	
	

}
