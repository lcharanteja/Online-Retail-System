package com.tcs.ilp.ors.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import com.tcs.ilp.ors.bean.*;
import com.tcs.ilp.ors.controller.*;
import com.tcs.ilp.ors.dao.*;

public class Outletimpl implements OutletDAO {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;

	public boolean addoutlet(OutletBean ob) throws SQLException,ClassNotFoundException
	{
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("INSERT INTO outlet_team3 VALUES('OUTLET'||outlet_seq.nextval,?,?,?,?,?)");
		System.out.println("in db");
		//ps.setString(1,ob.getOutletid());
		
		ps.setString(1,ob.getOutletname());
		
		ps.setString(2,ob.getCity());
		
		ps.setString(3,ob.getState());	
	
		ps.setInt(4,ob.getZipcode());	
		
		ps.setString(5,ob.getStatus());
		
		int rowsaffected=ps.executeUpdate();
		System.out.println("aftr update");
		if(rowsaffected>0)
		{
			System.out.println("aftr update");
			return Boolean.TRUE;
		}	
		return Boolean.FALSE;		
	}
	public ArrayList<OutletBean> viewall() throws SQLException,ClassNotFoundException
	{
		ArrayList<OutletBean> plist=new ArrayList<OutletBean>();
		con=DatabaseUtil.getConnection();
		System.out.println("inside db");
		ps=con.prepareStatement("select * from outlet_team3 order by outletid");
		rs=ps.executeQuery();
		System.out.println("inside query");
		while(rs.next())
		{
	OutletBean ob=new OutletBean();
	ob.setOutletid(rs.getString(1));
	ob.setOutletname(rs.getString(2));
	ob.setCity(rs.getString(3));
	ob.setState(rs.getString(4));
	ob.setZipcode(rs.getInt(5));
	ob.setStatus(rs.getString(6));
	plist.add(ob);		
		}
		System.out.println("outside query");
		return plist;
	}
	
	public OutletBean viewbyoutletid(String outletid)throws SQLException,ClassNotFoundException
	{
		OutletBean ob=new OutletBean();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from outlet_team3 where outletid=?");
		ps.setString(1, outletid);
		rs=ps.executeQuery();
		if(rs.next())
		{
			ob.setOutletid(rs.getString(1));
			ob.setOutletname(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setState(rs.getString(4));
			ob.setZipcode(rs.getInt(5));
			ob.setStatus(rs.getString(6));
			
		}
		return ob;	
	}
	
	public Boolean updateoutlet(OutletBean ob) throws SQLException,ClassNotFoundException
	{
		con=DatabaseUtil.getConnection();
		System.out.println("in database connection");
		ps=con.prepareStatement("update outlet_team3 set outletname=?,city=?,state=?,zipcode=?,status=? where outletid=?");
		ps.setString(1,ob.getOutletname());
		ps.setString(2,ob.getCity());
		ps.setString(3,ob.getState());	
		ps.setInt(4,ob.getZipcode());
		ps.setString(5,ob.getStatus());
		ps.setString(6,ob.getOutletid());
		System.out.println("values in db set");
		int rs1=ps.executeUpdate();
		if(rs1>0)
		{
			return Boolean.TRUE;
		}
		return Boolean.FALSE;			
	}
	public Boolean deleteoutlet(String outletid) throws SQLException,ClassNotFoundException
	{
		//OutletBean ob=new OutletBean();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("update outlet_team3 set status='NOT_AVAILABLE' where outletid=? and status='AVAILABLE'");
		ps.setString(1,outletid);
		rs=ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
		return false;	
	}
	
	
	public ArrayList<OutletBean> viewbyoutletname(String outletname)throws SQLException,ClassNotFoundException
	{
		ArrayList<OutletBean> plist=new ArrayList<OutletBean>();
		
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from outlet_team3 where outletname=?");
		ps.setString(1, outletname);
		rs=ps.executeQuery();
		while(rs.next())
		{
			OutletBean ob=new OutletBean();
			ob.setOutletid(rs.getString(1));
			ob.setOutletname(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setState(rs.getString(4));
			ob.setZipcode(rs.getInt(5));
			ob.setStatus(rs.getString(6));
			plist.add(ob);
			
		}
		return plist;	
	}
	
	public ArrayList<OutletBean> viewbyoutletzipcode(int zipcode)throws SQLException,ClassNotFoundException
	{
		ArrayList<OutletBean> plist=new ArrayList<OutletBean>();
	
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from outlet_team3 where zipcode=?");
		ps.setInt(1,zipcode );
		rs=ps.executeQuery();
		while(rs.next())
		{
			OutletBean ob=new OutletBean();
			ob.setOutletid(rs.getString(1));
			ob.setOutletname(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setState(rs.getString(4));
			ob.setZipcode(rs.getInt(5));
			ob.setStatus(rs.getString(6));
			plist.add(ob);
			
		}
		return plist;	
	}
	public ArrayList<OutletBean> viewalloutletvalue(String value)throws SQLException,ClassNotFoundException
	{
		ArrayList<OutletBean> plist=new ArrayList<OutletBean>();
	
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select  UNIQUE ? from outlet_team3");
		ps.setString(1,value );
		rs=ps.executeQuery();
		while(rs.next())
		{
			OutletBean ob=new OutletBean();
			ob.setOutletid(rs.getString(1));
			ob.setOutletname(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setState(rs.getString(4));
			ob.setZipcode(rs.getInt(5));
			ob.setStatus(rs.getString(6));
			plist.add(ob);
			
		}
		return plist;	
	}
	public  ArrayList<OutletBean> viewbyoutletcity(String city)throws SQLException,ClassNotFoundException
	{
		ArrayList<OutletBean> plist=new ArrayList<OutletBean>();
		
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from outlet_team3 where city=?");
		ps.setString(1,city );
		rs=ps.executeQuery();
		while(rs.next())
		{
			OutletBean ob=new OutletBean();
			ob.setOutletid(rs.getString(1));
			ob.setOutletname(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setState(rs.getString(4));
			ob.setZipcode(rs.getInt(5));
			ob.setStatus(rs.getString(6));
			plist.add(ob);
			
		}
		return plist;	
	}
	public ArrayList<OutletBean> viewbyoutletstate(String state)throws SQLException,ClassNotFoundException
	{
		
		ArrayList<OutletBean> plist=new ArrayList<OutletBean>();
		
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from outlet_team3 where state=?");
		ps.setString(1,state );
		rs=ps.executeQuery();
		while(rs.next())
		{
			
			OutletBean ob=new OutletBean();
			ob.setOutletid(rs.getString(1));
			ob.setOutletname(rs.getString(2));
			ob.setCity(rs.getString(3));
			ob.setState(rs.getString(4));
			ob.setZipcode(rs.getInt(5));
			ob.setStatus(rs.getString(6));
			plist.add(ob);
			
		}
		return plist;	
	}
	public boolean adddepartmenttooutlet(OutletManagementBean om) throws SQLException,ClassNotFoundException
	{
		con=DatabaseUtil.getConnection();
		System.out.println(om.getDepartmentid()+om.getOutletid());
		ps=con.prepareStatement("INSERT INTO outletmanagement_team3 VALUES('OUTLETMGMT'||outletmanagement_team3_seq.nextval,?,?)");
		System.out.println("in add db");
		ps.setString(1,om.getOutletid());		
		ps.setString(2,om.getDepartmentid());
		System.out.println("in db");
		int rowsaffected1=ps.executeUpdate();
		if(rowsaffected1>0)
		{	
			System.out.println("in db");
			return Boolean.TRUE;
		}		

		return Boolean.FALSE;	
		
		
	}
	public ArrayList<DepartmentBean> viewdepartmentsinoutlet(String outletid) throws SQLException {
		ArrayList<DepartmentBean> dlist=new ArrayList<DepartmentBean>();
		con=DatabaseUtil.getConnection();
		
		ps=con.prepareStatement("select d.departmentid,d.departmentname,d.status from department_team3 d,outletmanagement_team3 o where o.departmentid=d.departmentid and o.outletid=?");
		ps.setString(1,outletid );
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
	public boolean searchdepartmentinoutlet(String outletid,String departmentid) throws SQLException {
		
		con=DatabaseUtil.getConnection();	
		System.out.println(outletid+departmentid);
		 ps=con.prepareStatement("select departmentid from outletmanagement_team3 where outletid=?");
		 ps.setString(1,outletid);
		 rs=ps.executeQuery();
			while(rs.next())
			{
				String deptid=rs.getString(1);
				if(deptid.equals(departmentid))
					return Boolean.FALSE;
					
			}
			
			return Boolean.TRUE;
		
	}
	}
