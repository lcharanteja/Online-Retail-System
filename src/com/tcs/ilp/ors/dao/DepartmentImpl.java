package com.tcs.ilp.ors.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.dao.*;
import com.tcs.ilp.ors.util.DatabaseUtil;
import com.tcs.ilp.ors.bean.*;



public class DepartmentImpl {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	/*-------------------To Add a Department in the Database--------------------*/
	
	public boolean adddepartment(DepartmentBean db) throws SQLException,ClassNotFoundException
	{
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("INSERT INTO department_team3 VALUES('DEPT'||DEPARTMENT_TEAM3_SEQ.nextval,?,?)");
		
		//ps.setString(1,db.getDepartmentid());		
		ps.setString(1,db.getDepartmentname());		
		ps.setString(2,db.getStatus());
		
		int rowsaffected=ps.executeUpdate();
		
		if(rowsaffected>0)
		{
			return Boolean.TRUE;
		}	
		return Boolean.FALSE;		
	}
	
	/*-------------------To View All the Departments from the Database--------------------*/
	
	public ArrayList<DepartmentBean> viewalldepartments() throws SQLException,ClassNotFoundException
	{
		ArrayList<DepartmentBean> dlist=new ArrayList<DepartmentBean>();
		con=DatabaseUtil.getConnection();	
		System.out.println("in db");
		ps=con.prepareStatement("select * from department_team3");
		rs=ps.executeQuery();		
		while(rs.next())
		{
			DepartmentBean db=new DepartmentBean();
			db.setDepartmentid(rs.getString(1));
			db.setDepartmentname(rs.getString(2));
			db.setStatus(rs.getString(3));
			dlist.add(db);		
		}	
		return dlist;
	}
	
	/*-------------------To View a particular Department from the Database--------------------*/
	public DepartmentBean viewbydepartmentid(String departmentid)throws SQLException,ClassNotFoundException
	{
		DepartmentBean db=new DepartmentBean();
		con=DatabaseUtil.getConnection();
		System.out.println("got connection");
		ps=con.prepareStatement("select * from department_team3 where departmentid=?");
		ps.setString(1,departmentid);
		rs=ps.executeQuery();
		System.out.println("aftr query");
		if(rs.next())
		{
			db.setDepartmentid(rs.getString(1));
			db.setDepartmentname(rs.getString(2));			
			db.setStatus(rs.getString(3));
			
		}
		return db;	
	}
	
	/*-------------------To Update a Department in the Database--------------------*/
	
	public Boolean updatedepartment(DepartmentBean db) throws SQLException,ClassNotFoundException
	{
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("update department_team3 set departmentname=?,status=? where departmentid=?");
		ps.setString(1,db.getDepartmentname());	
		ps.setString(2,db.getStatus());
		ps.setString(3,db.getDepartmentid());
		int rs1=ps.executeUpdate();
		if(rs1>0)
		{
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
			
	}
	
	/*-------------------To Delete a Department from the Database--------------------*/
	
	public Boolean deletedepartment(String departmentid) throws SQLException,ClassNotFoundException
	{
		//DepartmentBean db=new DepartmentBean();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("update department_team3 set status='NOT_AVAILABLE' where departmentid=?");
		ps.setString(1,departmentid);
		rs=ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
		return false;	
	}

	/*-------------------To Find a Department based on the Id from the Database--------------------*/
	public String finddepartmentid(String departmentname) throws SQLException {
		
		String departmentid=new String();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select departmentid from department_team3 where departmentname=?");
		ps.setString(1, departmentname);
		rs=ps.executeQuery();
		if(rs.next())
		{
			departmentid=rs.getString(1);
			
		}
		return departmentid;
	}
	
	/*-------------------To Search an Item in Department from the Database--------------------*/

	public boolean searchitemindepartment(String departmentid, String itemid) throws SQLException {
		System.out.println(departmentid+itemid);
		con=DatabaseUtil.getConnection();	
		System.out.println(departmentid+itemid);
		 ps=con.prepareStatement("select itemid from itemmanagement_team3 where departmentid=?");
		 ps.setString(1,departmentid);
		 rs=ps.executeQuery();
			while(rs.next())
			{
				String itmid=rs.getString(1);
				if(itmid.equals(itemid))
					return Boolean.FALSE;
					
			}
			
			return Boolean.TRUE;
	}
	
	/*-------------------To Add Item into  Department in the Database--------------------*/
	
	public boolean additemtodepartment(ItemManagementBean im) throws SQLException,ClassNotFoundException
	{
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("INSERT INTO itemmanagement_team3 VALUES(?,?)");
		System.out.println("in db");		
		ps.setString(1,im.getDepartmentid());
		ps.setString(2,im.getItemid());
		System.out.println("in db");
		int rowsaffected1=ps.executeUpdate();
		if(rowsaffected1>0)
		{	
			System.out.println("in db");
			return Boolean.TRUE;
		}		

		return Boolean.FALSE;	
		
		
	}
	
	/*-------------------To Search a Department based on Id in the Database--------------------*/
	public ArrayList<DepartmentBean> searchByName(String deptName) throws ClassNotFoundException, SQLException {
		ArrayList<DepartmentBean>deptlist=new ArrayList<DepartmentBean>();
		String s=deptName;
		DepartmentBean dbean=null;
		con=DatabaseUtil.getConnection();
		//ps=con.prepareStatement("select userid,firstname,lastname,gender,dob,email,phoneno,city,location,status,role from MAS_Customer_TABLE where status like ?");
		ps=con.prepareStatement("select * from department_team3 where reg_exp(DEPARTMENTNAME,?,'i')");
		ps.setString(1,s);
		
		rs = ps.executeQuery();
		while(rs.next()){
			dbean = new DepartmentBean();
			
			dbean.setDepartmentid(rs.getString(1));
			dbean.setDepartmentname(rs.getString(2));
			dbean.setStatus(rs.getString(3));
		
		
			deptlist.add(dbean);
			
		}
	
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return deptlist;
	}

	
	/*-------------------To Search a Department based on Status in the Database--------------------*/
	
	public ArrayList<DepartmentBean> searchByStatus(String deptName) throws ClassNotFoundException, SQLException {
		ArrayList<DepartmentBean>deptlist=new ArrayList<DepartmentBean>();
		String s=deptName;
		DepartmentBean dbean=null;
		con=DatabaseUtil.getConnection();
		//ps=con.prepareStatement("select userid,firstname,lastname,gender,dob,email,phoneno,city,location,status,role from MAS_Customer_TABLE where status like ?");
		ps=con.prepareStatement("select * from department_team3 where regexp_like(status, ?,'i')");
		ps.setString(1,s);
		
		rs = ps.executeQuery();
		while(rs.next()){
			dbean = new DepartmentBean();
			
			dbean.setDepartmentid(rs.getString(1));
			dbean.setDepartmentname(rs.getString(2));
			dbean.setStatus(rs.getString(3));
		
		
			deptlist.add(dbean);
			
		}
	
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return deptlist;
	}
	
	/*-------------------To Search a Department based on Id in the Database--------------------*/
	
	public ArrayList<DepartmentBean> searchByDeptId(String deptid) throws ClassNotFoundException, SQLException {
		ArrayList<DepartmentBean>deptlist=new ArrayList<DepartmentBean>();
		String s=deptid;
		DepartmentBean dbean=null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from department_team3 where regexp_like(departmentid, ?,'i')");
		ps.setString(1,s);
		
		rs = ps.executeQuery();
		while(rs.next()){
			dbean = new DepartmentBean();
			
			dbean.setDepartmentid(rs.getString(1));
			dbean.setDepartmentname(rs.getString(2));
			dbean.setStatus(rs.getString(3));
		
		
			deptlist.add(dbean);
			
		}
	
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return deptlist;
	}

	

}
