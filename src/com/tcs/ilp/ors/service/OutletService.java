package com.tcs.ilp.ors.service;


import java.sql.SQLException;
import java.util.ArrayList;



import com.tcs.ilp.ors.bean.*;
import com.tcs.ilp.ors.dao.*;

public class OutletService {
		Outletimpl impl=new Outletimpl();
	public boolean addoutlet(OutletBean ob) throws SQLException,ClassNotFoundException
	{
		return impl.addoutlet(ob);
	}
	public ArrayList<OutletBean> viewall() throws SQLException,ClassNotFoundException
	{
		return impl.viewall();
	}

	public OutletBean viewbyoutletid(String outletid) throws SQLException,ClassNotFoundException
	{
	return impl.viewbyoutletid(outletid);
	}
	public Boolean updateoutlet(OutletBean ob) throws SQLException,ClassNotFoundException
	{
		return impl.updateoutlet(ob);
	}
	public Boolean deleteoutlet(String outletid) throws SQLException,ClassNotFoundException
	{
		return impl.deleteoutlet(outletid);
	}
	public boolean adddepartmenttooutlet(OutletManagementBean om) throws SQLException,ClassNotFoundException
	{
		return impl.adddepartmenttooutlet(om);
	}
	
	public  ArrayList<OutletBean> viewbyoutletstate(String state)throws SQLException,ClassNotFoundException{
		return impl.viewbyoutletstate(state);
	}
	public ArrayList<OutletBean> viewbyoutletcity(String city)throws SQLException,ClassNotFoundException{
		return impl.viewbyoutletcity(city);
	}
	public ArrayList<OutletBean> viewbyoutletzipcode(int zipcode)throws SQLException,ClassNotFoundException{
		return impl.viewbyoutletzipcode(zipcode);
	}
	public ArrayList<OutletBean> viewbyoutletname(String outletname)throws SQLException,ClassNotFoundException{
		return impl.viewbyoutletname(outletname);
	}
	public ArrayList<OutletBean> viewalloutletvalue(String value)throws SQLException,ClassNotFoundException
	{
		return impl.viewalloutletvalue(value);

	}
	public ArrayList<DepartmentBean> viewdepartmentsinoutlet(String outletid) throws SQLException {
		return impl.viewdepartmentsinoutlet(outletid);
	}
	public Boolean searchdepartmentinoutlet(String outletid, String departmentid)throws SQLException {
		return impl.searchdepartmentinoutlet(outletid,departmentid);
	}
	
	
}
