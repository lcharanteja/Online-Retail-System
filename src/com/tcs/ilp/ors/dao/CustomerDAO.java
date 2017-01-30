package com.tcs.ilp.ors.dao;

import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.CustomerBean;

public interface CustomerDAO {
	public boolean addCustomers(CustomerBean cbean) throws ClassNotFoundException, SQLException;
	public CustomerBean viewProfile(String email) throws SQLException,ClassNotFoundException;
	public boolean update(CustomerBean user) throws ClassNotFoundException,SQLException;
	public ArrayList<CustomerBean> viewAllUsers() throws ClassNotFoundException,SQLException;
	public boolean deactivate(String email) throws ClassNotFoundException,SQLException;
}
