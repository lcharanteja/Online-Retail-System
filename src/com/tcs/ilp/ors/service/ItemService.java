package com.tcs.ilp.ors.service;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.ItemBean;
import com.tcs.ilp.ors.dao.ItemImpl;

public class ItemService {
	
		ItemImpl itemImpl = new ItemImpl();
		public boolean  addItem(ItemBean ib) throws ClassNotFoundException, SQLException, FileNotFoundException
		{
			return itemImpl.addItem(ib);
		}
		
		public ArrayList<ItemBean> viewAllItems() throws ClassNotFoundException, SQLException
		{
			return itemImpl.viewAllItems();
		}
		public ItemBean viewByItemId(String itemId) throws ClassNotFoundException, SQLException
		{
			return itemImpl.viewByItemId(itemId);
		}
		public boolean updateItem(ItemBean ib) throws SQLException,ClassNotFoundException
		{
			return itemImpl.updateItem(ib);
		}
		public boolean deleteItem(String itemId) throws SQLException,ClassNotFoundException
		{
			return itemImpl.deleteItem(itemId);
		}

		public String finditemid(String itemname) throws SQLException {
			return itemImpl.finditemid(itemname);
		}
		public ArrayList<ItemBean> viewAllItems(String deptName) throws ClassNotFoundException, SQLException {
			// TODO Auto-generated method stub
			return itemImpl.viewAllItems(deptName);
		}
}
