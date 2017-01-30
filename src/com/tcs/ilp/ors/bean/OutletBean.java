package com.tcs.ilp.ors.bean;

public class OutletBean {
private String outletid;
private String outletname;
private String city;
private String state;
private int zipcode;
private String status;
public OutletBean(String outletid, String outletname, String city,
		String state, int zipcode, String status) {
	super();
	this.outletid = outletid;
	this.outletname = outletname;
	this.city = city;
	this.state = state;
	this.zipcode = zipcode;
	this.status = status;
}
public OutletBean() {
	// TODO Auto-generated constructor stub
}
public String getOutletid() {
	return outletid;
}
public void setOutletid(String outletid) {
	this.outletid = outletid;
}
public String getOutletname() {
	return outletname;
}
public void setOutletname(String outletname) {
	this.outletname = outletname;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public int getZipcode() {
	return zipcode;
}
public void setZipcode(int zipcode) {
	this.zipcode = zipcode;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}

}
