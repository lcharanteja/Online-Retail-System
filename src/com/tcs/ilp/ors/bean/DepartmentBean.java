package com.tcs.ilp.ors.bean;

public class DepartmentBean {
private String departmentid;
private String departmentname;
private String status;
public DepartmentBean(String departmentid, String departmentname,
		String status) {
	super();
	this.departmentid = departmentid;
	this.departmentname = departmentname;
	this.status = status;
}
public DepartmentBean() {
	super();
}
public String getDepartmentid() {
	return departmentid;
}
public void setDepartmentid(String departmentid) {
	this.departmentid = departmentid;
}
public String getDepartmentname() {
	return departmentname;
}
public void setDepartmentname(String departmentname) {
	this.departmentname = departmentname;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status=status;
}

}