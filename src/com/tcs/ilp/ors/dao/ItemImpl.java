package com.tcs.ilp.ors.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.CustomerBean;
import com.tcs.ilp.ors.bean.ItemBean;
import com.tcs.ilp.ors.util.DatabaseUtil;

public class ItemImpl implements ItemDAO{
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	/*----------------------------adds item details into the database------------------------------*/
	public boolean addItem(ItemBean ib) throws SQLException,
			ClassNotFoundException, FileNotFoundException {
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("INSERT INTO ITEM_TEAM3 VALUES(item_seq.nextval,?,?,?,?,?,?,?,?)");
		//setting the column index values of the query
		ps.setString(1,ib.getItemName());
		ps.setDouble(2, ib.getItemPrice());
		ps.setInt(3,ib.getItemQuantity());
		ps.setString(4,ib.getItemFlavor());
		ps.setString(5,ib.getCancellationStatus());
		ps.setString(6,ib.getAvailabilityStatus());
		ps.setString(7, ib.getItemImage());
		ps.setString(8, ib.getDeptName());
		int rowsaffected=ps.executeUpdate();
		if(rowsaffected>0)
		{
			//closing the database connection after successful addition
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return Boolean.TRUE;
		}
		//closing the database connection after unsuccessful addition
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return Boolean.FALSE;	
	}
	/*-------------------------retrieves the details of all the items from the database-------------*/
	public ArrayList<ItemBean> viewAllItems() throws SQLException,
			ClassNotFoundException {
		// TODO Auto-generated method stub
		ArrayList<ItemBean> itemList=new ArrayList<ItemBean>();
		ItemBean ib = null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from ITEM_TEAM3");
		rs=ps.executeQuery();
		while(rs.next())
		{
			ib=new ItemBean();
			ib.setItemId(rs.getString(1));
			ib.setItemName(rs.getString(2));
			ib.setItemPrice(rs.getDouble(3));
			ib.setItemQuantity(rs.getInt(4));
			ib.setItemFlavor(rs.getString(5));
			ib.setCancellationStatus(rs.getString(6));
			ib.setAvailabilityStatus(rs.getString(7));
			ib.setItemImage(rs.getString("photo"));
			ib.setDeptName(rs.getString(9));
			//adding the bean object into arraylist
			itemList.add(ib);
			
		}
		return itemList;
	}
	/*-------------------viewing all the details of an invidual item---------------------------*/
	public ItemBean viewByItemId(String itemId) throws SQLException, ClassNotFoundException
	{
		ItemBean ib=new ItemBean();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from item_team3 where itemid=?");
		ps.setString(1, itemId);
		rs=ps.executeQuery();
		if(rs.next())
		{
			ib.setItemId(rs.getString(1));
			ib.setItemName(rs.getString(2));
			ib.setItemPrice(rs.getDouble(3));
			ib.setItemQuantity(rs.getInt(4));
			ib.setItemFlavor(rs.getString(5));
			ib.setCancellationStatus(rs.getString(6));
			ib.setAvailabilityStatus(rs.getString(7));
			ib.setItemImage(rs.getString("photo"));
			ib.setDeptName(rs.getString(9));
			
		}
		return ib;	
	}
	/*------------------------updates the details of an item in the database-----------------*/
	public boolean updateItem(ItemBean ib) throws SQLException,ClassNotFoundException{
		// TODO Auto-generated method stub

		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("update item_team3 set itemname=?,itemprice=?, itemquantity=?,itemflavour=?,cancellationStatus=?,itemStatus=? where itemid=?");
		ps.setString(1,ib.getItemName());
		ps.setDouble(2,ib.getItemPrice());
		ps.setInt(3, ib.getItemQuantity());
		ps.setString(4, ib.getItemFlavor());
		ps.setString(5, ib.getCancellationStatus());
		ps.setString(6, ib.getAvailabilityStatus());
		ps.setString(7, ib.getItemId());
		int rs1=ps.executeUpdate();
		if(rs1>0)
		{
			return Boolean.TRUE;
		}
		return Boolean.FALSE;
			
	}
	/*-------------updating the availability status of the item into 'not avaliable'-------------*/
	public boolean deleteItem(String itemId) throws SQLException,ClassNotFoundException{
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("update item_team3 set itemStatus='NOTAVAILABLE' where itemid=?");
		ps.setString(1,itemId);
		rs=ps.executeQuery();
		if(rs.next())
		{
			return true;
		}
		return false;
	}
	/*----------------------------------search item by id-----------------------------*/
	public String finditemid(String itemname) throws SQLException {
		String itemid=new String();
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select itemid from item_team3 where itemname=?");
		ps.setString(1, itemname);
		rs=ps.executeQuery();
		if(rs.next())
		{
			itemid=rs.getString(1);
			
		}
		return itemid;
	}
	/*--------------------------view the items of a particular department--------------------*/
	public ArrayList<ItemBean> viewAllItems(String deptId)  throws SQLException,ClassNotFoundException
	{
		ArrayList<ItemBean> itemList=new ArrayList<ItemBean>();
		ItemBean ib=null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from item_team3 where deptname=?");
		ps.setString(1,deptId);
		rs=ps.executeQuery();
		while(rs.next())
		{
			ib=new ItemBean();
			ib.setItemId(rs.getString(1));
			ib.setItemName(rs.getString(2));
			ib.setItemPrice(rs.getDouble(3));
			ib.setItemQuantity(rs.getInt(4));
			ib.setItemFlavor(rs.getString(5));
			ib.setCancellationStatus(rs.getString(6));
			ib.setAvailabilityStatus(rs.getString(7));
			ib.setItemImage(rs.getString("photo"));
			ib.setDeptName(rs.getString(9));
		
			itemList.add(ib);
			
		}
		return itemList;
}
	/*--------------------------search item by their names--------------------------------*/
	public ArrayList<ItemBean> searchByName(String ItemName) throws ClassNotFoundException, SQLException {
		ArrayList<ItemBean>itemlist=new ArrayList<ItemBean>();
		String s=ItemName;
		ItemBean ibean=null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from item_team3 where regexp_like(ITEMNAME, ?,'i')");
		ps.setString(1,s);
		rs = ps.executeQuery();
		while(rs.next()){
			ibean = new ItemBean();
			
			ibean.setItemId(rs.getString(1));
			ibean.setItemName(rs.getString(2));
			ibean.setItemPrice(rs.getDouble(3));
			ibean.setItemQuantity(rs.getInt(4));
			ibean.setItemFlavor(rs.getString(5));
			ibean.setCancellationStatus(rs.getString(6));
			ibean.setAvailabilityStatus(rs.getString(7));
			ibean.setItemImage(rs.getString("photo"));
			ibean.setDeptName(rs.getString(9));
		
			itemlist.add(ibean);
			
		}
	
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return itemlist;
	}
	/*-----------------search items by the department name-------------------------*/
	public ArrayList<ItemBean> searchByDeptName(String deptName) throws ClassNotFoundException, SQLException {
		ArrayList<ItemBean>itemlist=new ArrayList<ItemBean>();
		String s=deptName;
		ItemBean ibean=null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from item_team3 where regexp_like(deptname,?,'i')");
		ps.setString(1,s);
		rs = ps.executeQuery();
		while(rs.next()){
			ibean = new ItemBean();
			
			ibean.setItemId(rs.getString(1));
			ibean.setItemName(rs.getString(2));
			ibean.setItemPrice(rs.getDouble(3));
			ibean.setItemQuantity(rs.getInt(4));
			ibean.setItemFlavor(rs.getString(5));
			ibean.setCancellationStatus(rs.getString(6));
			ibean.setAvailabilityStatus(rs.getString(7));
			ibean.setItemImage(rs.getString("photo"));
			ibean.setDeptName(rs.getString(9));
		
			itemlist.add(ibean);
			
		}
	
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return itemlist;
	}
	
}
