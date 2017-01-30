package com.tcs.ilp.ors.service;

import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.CustomerBean;
import com.tcs.ilp.ors.dao.CustomerImpl;

public class CustomerModel {
CustomerImpl impl=new CustomerImpl();
	
	public boolean addCustomers(CustomerBean cbean) throws ClassNotFoundException, SQLException
	{
		
	
		return impl.addCustomers(cbean);
	}
	public CustomerBean viewProfile(String email) throws SQLException,ClassNotFoundException{
		return impl.viewProfile(email);
	}
	public boolean update(CustomerBean user) throws ClassNotFoundException,
	SQLException{
		return impl.update(user);
	}
	public ArrayList<CustomerBean> viewAllUsers() throws ClassNotFoundException, SQLException {
		return impl.viewAllUsers();
	}
	public boolean deactivate(String email) throws ClassNotFoundException,SQLException {
		return impl.deactivate(email);
	}
	public boolean activate(String email) throws ClassNotFoundException,SQLException {
		return impl.activate(email);
	}
}
