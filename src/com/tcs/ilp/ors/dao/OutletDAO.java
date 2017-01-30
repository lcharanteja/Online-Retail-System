package com.tcs.ilp.ors.dao;

import java.sql.SQLException;
import java.util.ArrayList;




import com.tcs.ilp.ors.bean.*;




public interface OutletDAO {
	public boolean addoutlet(OutletBean ob) throws SQLException,ClassNotFoundException;
	public ArrayList<OutletBean> viewall() throws SQLException,ClassNotFoundException;
	public OutletBean viewbyoutletid(String outletid) throws SQLException,ClassNotFoundException;
	public Boolean updateoutlet(OutletBean ob) throws SQLException,ClassNotFoundException;
	public Boolean deleteoutlet(String outletid) throws SQLException,ClassNotFoundException;
	public ArrayList<OutletBean> viewbyoutletstate(String state)throws SQLException,ClassNotFoundException;
	public ArrayList<OutletBean> viewbyoutletcity(String city)throws SQLException,ClassNotFoundException;
	public ArrayList<OutletBean>viewbyoutletzipcode(int zipcode)throws SQLException,ClassNotFoundException;
	public ArrayList<OutletBean> viewbyoutletname(String outletname)throws SQLException,ClassNotFoundException;
	public boolean searchdepartmentinoutlet(String outletid,String departmentid) throws SQLException;
	public boolean adddepartmenttooutlet(OutletManagementBean om) throws SQLException,ClassNotFoundException;
}
