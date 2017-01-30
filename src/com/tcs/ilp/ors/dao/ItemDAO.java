package com.tcs.ilp.ors.dao;

import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.ItemBean;

public interface ItemDAO {
	public boolean addItem(ItemBean ib) throws SQLException, ClassNotFoundException, FileNotFoundException;
	public ArrayList<ItemBean> viewAllItems() throws SQLException, ClassNotFoundException;
	public ItemBean viewByItemId(String itemId) throws SQLException, ClassNotFoundException;
	public boolean updateItem(ItemBean ib) throws SQLException, ClassNotFoundException;
	public boolean deleteItem(String itemId) throws SQLException, ClassNotFoundException;
	public String finditemid(String itemname) throws SQLException;
	public ArrayList<ItemBean> viewAllItems(String deptId)  throws SQLException,ClassNotFoundException;


}
