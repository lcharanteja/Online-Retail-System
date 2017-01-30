package com.tcs.ilp.ors.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import com.tcs.ilp.ors.bean.*;
import com.tcs.ilp.ors.dao.*;


public interface DepartmentDAO {
	
	public boolean addDepartment(DepartmentBean db) throws SQLException,ClassNotFoundException;
	public ArrayList<DepartmentBean> viewalldepartments() throws SQLException,ClassNotFoundException;
	public DepartmentBean viewbydepartmentid(String departmentid) throws SQLException,ClassNotFoundException;
	public Boolean updatedepartment(DepartmentBean db) throws SQLException,ClassNotFoundException;
	public Boolean deletedepartment(String departmentid) throws SQLException,ClassNotFoundException;
	public String finddepartmentid(String departmentname) throws SQLException,ClassNotFoundException;

}
