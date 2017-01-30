package com.tcs.ilp.ors.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.CustomerBean;
import com.tcs.ilp.ors.bean.LoginBean;
import com.tcs.ilp.ors.controller.ProfileController;
import com.tcs.ilp.ors.util.DatabaseUtil;

public class CustomerImpl implements CustomerDAO{



		Connection con= null;
		PreparedStatement pstmt= null;
		int rowsAffected=0;
		

		public boolean addCustomers(CustomerBean cbean) throws ClassNotFoundException, SQLException
		{   
	
			con= DatabaseUtil.getConnection();
			java.sql.Date sqlDate=new java.sql.Date(cbean.getDOB().getTime());
		pstmt=con.prepareStatement("insert into customer_team3 values('cust'||customers_seq.nextval ,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1,cbean.getFirstName());
			pstmt.setString(2,cbean.getMiddleName());
			pstmt.setString(3,cbean.getLastName());
			pstmt.setString(4,cbean.getGender());
			pstmt.setDate(5,sqlDate);
			pstmt.setString(6,cbean.geteMail());
			pstmt.setLong(7,cbean.getPhoneNo());
			pstmt.setString(8,cbean.getPassword());
			pstmt.setString(9,"active");
		/*	pstmt=con.prepareStatement("insert into customer_team3 values('cust'||customers_seq.nextval ,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1,cbean.getFirstName());
			pstmt.setString(2,cbean.getMiddleName());
			pstmt.setString(3,cbean.getLastName());
			pstmt.setString(6,cbean.getGender());
			pstmt.setDate(9,sqlDate);
			pstmt.setString(4,cbean.geteMail());
			pstmt.setLong(8,cbean.getPhoneNo());
			pstmt.setString(5,cbean.getPassword());
			pstmt.setString(7,"active");*/
			
			 rowsAffected = pstmt.executeUpdate();
			 if(rowsAffected>0){
				 pstmt=con.prepareStatement("insert into login_team3 values(?,?,?)");
					pstmt.setString(1, cbean.geteMail());
					pstmt.setString(2, cbean.getPassword());
					pstmt.setString(3, "customer");
					rowsAffected=pstmt.executeUpdate();
			if(rowsAffected>0)
			{
				DatabaseUtil.closeStatement(pstmt);
				DatabaseUtil.closeConnection(con);
				return Boolean.TRUE;
			}
			else{
			DatabaseUtil.closeStatement(pstmt);
			DatabaseUtil.closeConnection(con);
		
			return Boolean.FALSE;
			}
		}
			 DatabaseUtil.closeStatement(pstmt);
				DatabaseUtil.closeConnection(con);
			
				return Boolean.FALSE;
				}
		
		public CustomerBean viewProfile(String email) throws SQLException,ClassNotFoundException {
			// TODO Auto-generated method stub
			CustomerBean cBean=new CustomerBean();
			con=DatabaseUtil.getConnection();
		
			pstmt=con.prepareStatement("select * from customer_team3 where email=?");
			pstmt.setString(1, email);
			ResultSet result = pstmt.executeQuery();
			while(result.next()){
				cBean.setCustomerId(result.getString(1));
				cBean.setFirstName(result.getString(2));
				cBean.setMiddleName(result.getString(3));
				cBean.setLastName(result.getString(4));
				cBean.setGender(result.getString(5));
				
				
				/*java.sql.Date sqlDate = result.getDate(6);
				
				java.util.Date dob=new java.util.Date(sqlDate.getTime());*/
				
				cBean.setDOB(result.getDate(6));
				
				cBean.seteMail(result.getString(7));
				cBean.setPhoneNo(result.getLong(8));
				cBean.setPassword(result.getString(9));
				cBean.setStatus(result.getString(10));
			}
	/*		while(result.next()){
				cBean.setCustomerId(result.getString(1));
				cBean.setFirstName(result.getString(2));
				cBean.setMiddleName(result.getString(3));
				cBean.setLastName(result.getString(4));
				cBean.setGender(result.getString(7));
				
				
				java.sql.Date sqlDate = result.getDate(10);
				
				java.util.Date dob=new java.util.Date(sqlDate.getTime());
				
				cBean.setDOB(dob);
				
				cBean.seteMail(result.getString(5));
				cBean.setPhoneNo(result.getLong(9));
				cBean.setPassword(result.getString(6));
				cBean.setStatus(result.getString(8));
			}*/
			DatabaseUtil.closeStatement(pstmt);
			DatabaseUtil.closeConnection(con);
		
			return cBean;
		}

		
		
		public boolean update(CustomerBean user) throws ClassNotFoundException,
		SQLException {
	// TODO Auto-generated method stub
	con=DatabaseUtil.getConnection();
			pstmt=con.prepareStatement("UPDATE customer_team3 SET first_name=?,middle_name=?,last_name=?,phoneno=? where customer_id=?");
			pstmt.setString(1, user.getFirstName());
			pstmt.setString(3, user.getLastName());
			pstmt.setString(2, user.getMiddleName());
			//pstmt.setString(4, user.getGender());
			
			
			//java.sql.Date sqlDate = new java.sql.Date(user.getDOB().getTime());
			
			//pstmt.setDate(4, sqlDate); 
			
			
			//pstmt.setString(6, user.geteMail());
			pstmt.setLong(4, user.getPhoneNo());
			//pstmt.setString(7, user.getPassword());
			//pstmt.setString(8, user.getStatus());
			pstmt.setString(5, user.getCustomerId());
			rowsAffected=pstmt.executeUpdate();
			if(rowsAffected>0)
			{DatabaseUtil.closeStatement(pstmt);
			DatabaseUtil.closeConnection(con);
				
				return Boolean.TRUE;
			}
			DatabaseUtil.closeStatement(pstmt);
			DatabaseUtil.closeConnection(con);
	return Boolean.FALSE;
}
	public ArrayList<CustomerBean> viewAllUsers() throws ClassNotFoundException, SQLException {
			
			// TODO Auto-generated method stub
			
			con=DatabaseUtil.getConnection();
			ArrayList<CustomerBean> userList = new ArrayList<CustomerBean>();
			pstmt=con.prepareStatement("select * from customer_team3");
		
			ResultSet result = pstmt.executeQuery();
			while(result.next()){
				CustomerBean ubean = new CustomerBean();
				
				ubean.setCustomerId(result.getString(1));
				ubean.setFirstName(result.getString(2));
				ubean.setMiddleName(result.getString(3));
				ubean.setLastName(result.getString(4));
				ubean.setGender(result.getString(5));
				
				java.sql.Date sqlDate = result.getDate(6);
				
				java.util.Date dob=new java.util.Date(sqlDate.getTime());
				
				ubean.setDOB(dob);
				
				//ps.setDate(5, result.getDate(5));
				ubean.seteMail(result.getString(7));
				ubean.setPhoneNo(result.getLong(8));
				//ubean.setCity(result.getString(8));
				//ubean.setLocation(result.getString(9));
				ubean.setStatus(result.getString(10));
				ubean.setPassword(result.getString(9));
	            userList.add(ubean);	
			}
			DatabaseUtil.closeStatement(pstmt);
			DatabaseUtil.closeConnection(con);
			return userList;
		}
	

	public boolean deactivate(String email) throws ClassNotFoundException,SQLException { 
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
	
		pstmt=con.prepareStatement("update customer_team3 set status='inactive' where email=?");
		pstmt.setString(1, email);
		rowsAffected=pstmt.executeUpdate();
		if(rowsAffected>0)
		{
			DatabaseUtil.closeConnection(con);
			DatabaseUtil.closeStatement(pstmt);
			return true;
		}
		else{
			DatabaseUtil.closeConnection(con);
			DatabaseUtil.closeStatement(pstmt);
			return false;
		}		
		
	}
	public boolean activate(String email) throws ClassNotFoundException,SQLException { 
		con=DatabaseUtil.getConnection();
		pstmt=con.prepareStatement("update customer_team3 set status='active' where email=?");
		pstmt.setString(1, email);
		rowsAffected=pstmt.executeUpdate();
		if(rowsAffected>0)
		{
			DatabaseUtil.closeConnection(con);
			DatabaseUtil.closeStatement(pstmt);
			return true;
		}
		else{
			DatabaseUtil.closeConnection(con);
			DatabaseUtil.closeStatement(pstmt);
			return false;
		}			
	}
	public ArrayList<CustomerBean> searchById(String id) throws ClassNotFoundException, SQLException {
		ArrayList<CustomerBean>userList=new ArrayList<CustomerBean>();
		String s=id;
		con=DatabaseUtil.getConnection();
		//ps=con.prepareStatement("select userid,firstname,lastname,gender,dob,email,phoneno,city,location,status,role from MAS_Customer_TABLE where status like ?");
		pstmt=con.prepareStatement("select * from customer_team3 where (regexp_like(customer_id,?,'i'))");
		pstmt.setString(1,s);
		
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			CustomerBean ubean = new CustomerBean();
			
			ubean.setCustomerId(result.getString(1));
			ubean.setFirstName(result.getString(2));
			ubean.setMiddleName(result.getString(3));
			ubean.setLastName(result.getString(4));
			ubean.setGender(result.getString(5));
			
			java.sql.Date sqlDate = result.getDate(6);
			
			java.util.Date dob=new java.util.Date(sqlDate.getTime());
			
			ubean.setDOB(dob);
			
			//ps.setDate(5, result.getDate(5));
			ubean.seteMail(result.getString(7));
			ubean.setPhoneNo(result.getLong(8));
			//ubean.setCity(result.getString(8));
			//ubean.setLocation(result.getString(9));
			ubean.setStatus(result.getString(10));
			ubean.setPassword(result.getString(9));
            userList.add(ubean);	
		}
		DatabaseUtil.closeStatement(pstmt);
		DatabaseUtil.closeConnection(con);
		return userList;
	}
	
	public ArrayList<CustomerBean> searchByName(String name) throws ClassNotFoundException, SQLException {
		ArrayList<CustomerBean>userList=new ArrayList<CustomerBean>();
		String s=name;
		con=DatabaseUtil.getConnection();
		//ps=con.prepareStatement("select userid,firstname,lastname,gender,dob,email,phoneno,city,location,status,role from MAS_Customer_TABLE where status like ?");
		pstmt=con.prepareStatement("select * from customer_team3 where (regexp_like(first_name,?,'i') or regexp_like(middle_name,?,'i') or regexp_like(last_name,?,'i'))");
		pstmt.setString(1,s);
		pstmt.setString(2,s);
		pstmt.setString(3,s);
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			CustomerBean ubean = new CustomerBean();
			
			ubean.setCustomerId(result.getString(1));
			ubean.setFirstName(result.getString(2));
			ubean.setMiddleName(result.getString(3));
			ubean.setLastName(result.getString(4));
			ubean.setGender(result.getString(5));
			
			java.sql.Date sqlDate = result.getDate(6);
			
			java.util.Date dob=new java.util.Date(sqlDate.getTime());
			
			ubean.setDOB(dob);
			
			//ps.setDate(5, result.getDate(5));
			ubean.seteMail(result.getString(7));
			ubean.setPhoneNo(result.getLong(8));
			//ubean.setCity(result.getString(8));
			//ubean.setLocation(result.getString(9));
			ubean.setStatus(result.getString(10));
			ubean.setPassword(result.getString(9));
            userList.add(ubean);	
		}
		DatabaseUtil.closeStatement(pstmt);
		DatabaseUtil.closeConnection(con);
		return userList;
	}
	
	
	public ArrayList<CustomerBean> searchByStatus(String status) throws ClassNotFoundException, SQLException {
		ArrayList<CustomerBean>userList=new ArrayList<CustomerBean>();
		String s=status;
		con=DatabaseUtil.getConnection();
		//ps=con.prepareStatement("select userid,firstname,lastname,gender,dob,email,phoneno,city,location,status,role from MAS_Customer_TABLE where status like ?");
		pstmt=con.prepareStatement("select * from customer_team3 where regexp_like(status, ?,'i')");
		pstmt.setString(1,s);
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			CustomerBean ubean = new CustomerBean();
			
			ubean.setCustomerId(result.getString(1));
			ubean.setFirstName(result.getString(2));
			ubean.setMiddleName(result.getString(3));
			ubean.setLastName(result.getString(4));
			ubean.setGender(result.getString(5));
			
			java.sql.Date sqlDate = result.getDate(6);
			
			java.util.Date dob=new java.util.Date(sqlDate.getTime());
			
			ubean.setDOB(dob);
			
			//ps.setDate(5, result.getDate(5));
			ubean.seteMail(result.getString(7));
			ubean.setPhoneNo(result.getLong(8));
			//ubean.setCity(result.getString(8));
			//ubean.setLocation(result.getString(9));
			ubean.setStatus(result.getString(10));
			ubean.setPassword(result.getString(9));
            userList.add(ubean);	
		}
		DatabaseUtil.closeStatement(pstmt);
		DatabaseUtil.closeConnection(con);
		return userList;
	}
	public ArrayList<CustomerBean> searchByemail(String email) throws ClassNotFoundException, SQLException {
		ArrayList<CustomerBean>userList=new ArrayList<CustomerBean>();
		String s=email;
		con=DatabaseUtil.getConnection();
		//ps=con.prepareStatement("select userid,firstname,lastname,gender,dob,email,phoneno,city,location,status,role from MAS_Customer_TABLE where status like ?");
		pstmt=con.prepareStatement("select * from customer_team3 where regexp_like(email,?,'i')");
		pstmt.setString(1,s);
		
		ResultSet result = pstmt.executeQuery();
		while(result.next()){
			CustomerBean ubean = new CustomerBean();
			
			ubean.setCustomerId(result.getString(1));
			ubean.setFirstName(result.getString(2));
			ubean.setMiddleName(result.getString(3));
			ubean.setLastName(result.getString(4));
			ubean.setGender(result.getString(5));
			
			java.sql.Date sqlDate = result.getDate(6);
			
			java.util.Date dob=new java.util.Date(sqlDate.getTime());
			
			ubean.setDOB(dob);
			
			//ps.setDate(5, result.getDate(5));
			ubean.seteMail(result.getString(7));
			ubean.setPhoneNo(result.getLong(8));
			//ubean.setCity(result.getString(8));
			//ubean.setLocation(result.getString(9));
			ubean.setStatus(result.getString(10));
			ubean.setPassword(result.getString(9));
            userList.add(ubean);	
		}
		DatabaseUtil.closeStatement(pstmt);
		DatabaseUtil.closeConnection(con);
		return userList;
	}
	
	public String forgotPassword(String email, String lastname) throws ClassNotFoundException, SQLException{
		String password=null;
		con=DatabaseUtil.getConnection();
		pstmt=con.prepareStatement("select password from  Customer_team3 where email=? and last_name=?");
		pstmt.setString(1, email);
		pstmt.setString(2, lastname);
		ResultSet result=pstmt.executeQuery();
		while(result.next())
		{
			password=result.getString(1);
		}
		DatabaseUtil.closeConnection(con);
		DatabaseUtil.closeStatement(pstmt);
		return password;
	}
	}


