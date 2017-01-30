package com.tcs.ilp.ors.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.tcs.ilp.ors.bean.*;
import com.tcs.ilp.ors.bean.OrderBean;

public class OrderImpl {

	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	int rowsaffected;
	
	
	public String addOrder(OrderBean ob) throws SQLException
	{
		int custid=0;
		int orderid;
		String oid=null;
		con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("INSERT INTO ORDER_team3 VALUES('order'||order_seq.nextval,?,?,?,'Not Delivered')");
         ps.setDouble(1,ob.getPrice());
		
		  ps.setString(2,ob.getCustomerid());
		  ps.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
		  rowsaffected=ps.executeUpdate();
		  if(rowsaffected>0)
		  {
			 
				ps=con.prepareStatement("select order_seq.nextval from dual");
				ResultSet rset = ps.executeQuery();
				if(rset.next())
				{
				custid=rset.getInt(1);
				}
			  
				orderid=custid-1;
				ps=con.prepareStatement("select orderid from ORDER_team3 where orderid='order'||?");
				ps.setInt(1, orderid);
				ResultSet rset1 = ps.executeQuery();
				if(rset1.next())
				{
				oid=rset1.getString(1);
				}
				
				
				
		  }
		return oid;
	}
	
	public boolean insertOrderDetail(ArrayList<ItemBean> Item,
			String orderId) {
		// TODO Auto-generated method stub
			con=DatabaseUtil.getConnection(); 
			try {
				//ps=con.prepareStatement("select orderid from ordertab_840571 where transactionid=?");
				//ps.setInt(1,orderlist.getTransactionId());
				//ResultSet rs=ps.executeQuery();
				//rs.next();
				//orderlist.setOrderId(rs.getInt(1));
				//System.out.println(orderlist.getOrderId());
				for(ItemBean i:Item)
				{
				ps=con.prepareStatement("insert into order_details_team3 values('orderdetail'||orderdetail_seq.nextval,?,?,?,?,?)");

				System.out.println("inside order");
				
				ps.setDouble(1, i.getItemPrice());
				ps.setString(2, i.getItemId());
				ps.setString(3,i.getItemName());
				ps.setString(4,orderId);
				ps.setInt(5,i.getBuyQuantity());
				rowsaffected=ps.executeUpdate();
				}
				if(rowsaffected>0)
				{ System.out.println("inserted in order");
				return Boolean.TRUE;

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return Boolean.FALSE;


		}
	
	public ArrayList<OrderBean> vieworders(String email) throws SQLException {
		 con=DatabaseUtil.getConnection();
		ps=con.prepareStatement("select * from order_team3 where customerid=?");
		 ps.setString(1, email);
	
		 ArrayList<OrderBean> orders= new ArrayList<OrderBean>();
		 OrderBean order;
		 
			ResultSet rs=ps.executeQuery();
			/*if(rs.next())
			{
				System.out.println(rs.getInt(5));
				System.out.println(rs.getInt(1));
				System.out.println(rs.getDate(2));
			}*/
			while(rs.next())
			{order=new OrderBean();
			order.setOrderid(rs.getString(1));
			order.setPrice(rs.getDouble(2));
			order.setCustomerid(rs.getString(3));
			order.setOrderDate(rs.getString(4));
			order.setStatus(rs.getString(5));
			orders.add(order);
			}
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return orders;
	}
	
	public ArrayList<OrderDetailsBean> vieworderbyid(String orderid) throws SQLException {
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
		ArrayList<OrderDetailsBean> orderdetails=new ArrayList<OrderDetailsBean>();
		OrderDetailsBean order;
		ps=con.prepareStatement("select * from order_details_team3 where orderid=?");
		 ps.setString(1, orderid);
		 ResultSet rs=ps.executeQuery();
		 while(rs.next())
		 {   order=new OrderDetailsBean();
			 order.setOrderDetailId(rs.getString(1));
			 order.setPrice(rs.getDouble(2));
			 order.setItemId(rs.getString(3));
			 order.setItemName(rs.getString(4));
			 order.setOrderId(rs.getString(5));
			 order.setQuantity(rs.getInt(6));
			 orderdetails.add(order);
		 }
		 DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return orderdetails;
	}

	public  ArrayList<OrderDetailsBean> cancelorder(String orderid) throws SQLException {
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
		ArrayList<OrderDetailsBean> orderdetails=new ArrayList<OrderDetailsBean>();
		OrderDetailsBean order;
		ps=con.prepareStatement("select * from order_details_team3 o," +
				"item_team3 i where (o.itemid=i.itemid and(i.cancellationstatus='YES' and o.orderid=?))");
		ps.setString(1, orderid);
		ResultSet rs=ps.executeQuery();
		 while(rs.next())
		 {   order=new OrderDetailsBean();
			 order.setOrderDetailId(rs.getString(1));
			 order.setPrice(rs.getDouble(2));
			 order.setItemId(rs.getString(3));
			 order.setItemName(rs.getString(4));
			 order.setOrderId(rs.getString(5));
			 order.setQuantity(rs.getInt(6));
			 orderdetails.add(order);
		 }
		 DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return orderdetails;
	}
	public String cancel(String orderdetailid) throws SQLException {
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
	
			ps=con.prepareStatement("delete from order_details_team3 where orderdetailid=?");
			ps.setString(1,orderdetailid );
		ps.executeQuery();
		if(rowsaffected>0){
			DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
		return orderdetailid;}
		DatabaseUtil.closeStatement(ps);
		DatabaseUtil.closeConnection(con);
		return orderdetailid;
		}
			
	

	public String cancelfinal(ArrayList<String> cancellist) throws SQLException {
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
		for(int i=0;i<cancellist.size();i++)
		{System.out.println("in db" +cancellist.get(i) );
			ps=con.prepareStatement("delete from order_details_team3 where orderdetailid=?");
			ps.setString(1, cancellist.get(i));
		ps.executeQuery();
			
			
		}
			return null;
	}
	
	public OrderBean vieworder(String orderid) throws SQLException {
		// TODO Auto-generated method stub
		con=DatabaseUtil.getConnection();
		OrderBean order=null;
		ps=con.prepareStatement("select * from order_team3 where orderid=?");
		 ps.setString(1, orderid);
		 ResultSet rs=ps.executeQuery();
		 while(rs.next())
			{order=new OrderBean();
			order.setOrderid(rs.getString(1));
			order.setPrice(rs.getDouble(2));
			order.setCustomerid(rs.getString(3));
			order.setOrderDate(rs.getString(4));
			order.setStatus(rs.getString(5));
			
			}
		 DatabaseUtil.closeStatement(ps);
			DatabaseUtil.closeConnection(con);
			return order;
	}
	
}
