package com.tcs.ilp.ors.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.*;
import com.tcs.ilp.ors.dao.*;


public class DepartmentService {
	
	DepartmentImpl impl=new DepartmentImpl();
	public boolean adddepartment(DepartmentBean db) throws SQLException,ClassNotFoundException
	{
		return impl.adddepartment(db);
	}
	public ArrayList<DepartmentBean> viewalldepartments() throws SQLException,ClassNotFoundException
	{
		return impl.viewalldepartments();	}

	public DepartmentBean viewbydepartmentid(String departmentid) throws SQLException,ClassNotFoundException
	{
	return impl.viewbydepartmentid(departmentid);
	}
	public Boolean updatedepartment(DepartmentBean ob) throws SQLException,ClassNotFoundException
	{
		return impl.updatedepartment(ob);
	}
	public Boolean deletedepartment(String departmentid) throws SQLException,ClassNotFoundException
	{
		return impl.deletedepartment(departmentid);
	}
	public String finddepartmentid(String departmentname) throws SQLException,ClassNotFoundException
	{
		return impl.finddepartmentid(departmentname);
	}
	public boolean searchitemindepartment(String departmentid, String itemid) throws SQLException {
		return impl.searchitemindepartment(departmentid,itemid);
	}
	public boolean additemtodepartment(ItemManagementBean im) throws ClassNotFoundException, SQLException {
		return impl.additemtodepartment(im);
	}

}
