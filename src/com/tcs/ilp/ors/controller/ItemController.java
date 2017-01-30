package com.tcs.ilp.ors.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tcs.ilp.ors.bean.CustomerBean;
import com.tcs.ilp.ors.bean.DepartmentBean;
import com.tcs.ilp.ors.bean.ItemBean;
import com.tcs.ilp.ors.dao.ItemImpl;
import com.tcs.ilp.ors.service.DepartmentService;
import com.tcs.ilp.ors.service.ItemService;

/**
 * Servlet implementation class ItemController
 */
public class ItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ItemController() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		session.setAttribute("msg","null");
		session.setAttribute("msgvalue","null");
		ItemImpl iimpl=new ItemImpl();
		ItemBean itemBean=null;
		ItemService itemService = new ItemService();
		PrintWriter out=response.getWriter();
		RequestDispatcher disp=null;
		DepartmentService ds=new DepartmentService(); 
		String requestSource=request.getParameter("source");
		
		//ADMIN FUNCTIONALILTY
		//redirects to the jsp page where item can be added
		if(requestSource.equals("additem")){
			
			ArrayList<DepartmentBean> oList;
			try {
					//calling the method of Service layer class
					oList = ds.viewalldepartments();
					//to display the departments in the dropdown box dyanamically in jsp page
					request.setAttribute("departmentlist", oList);
					disp=request.getRequestDispatcher("jsp/additem.jsp");
					disp.forward(request,response);
			
				}
			
			catch(Exception e )
			{
				//executes in case of exception
				session.setAttribute("msg", "additemsysfail");
				response.sendRedirect("jsp/error.jsp");
			}
		}
		//ADMIN FUNCTIONALILTY
		//stores the item details into database
		else if(requestSource.equals("registeritem")) {
			//getting the form field values from the jsp page		
			String itemId=request.getParameter("itemid");
			String itemName=request.getParameter("itemname");
			double price=Double.parseDouble(request.getParameter("price"));
			int quantity=Integer.parseInt(request.getParameter("quantity"));
			String flavor=request.getParameter("flavor");
			String cancellationstatus=request.getParameter("cancellationstatus");
			String availabilityStatus = request.getParameter("availabilitystatus");
			String itemImage = request.getParameter("image");
			String deptName = request.getParameter("dname1");
	
			//storing the form field values into bean object
			itemBean=new ItemBean();
			itemBean.setItemId(itemId);
			itemBean.setItemName(itemName);
			itemBean.setItemPrice(price);
			itemBean.setItemQuantity(quantity);
			itemBean.setItemFlavor(flavor);
			itemBean.setCancellationStatus(cancellationstatus);
			itemBean.setAvailabilityStatus(availabilityStatus);
			itemBean.setItemImage(itemImage);
			itemBean.setDeptName(deptName);
			try
			{	
				//calling the method of Service layer class
				boolean flag=itemService.addItem(itemBean);
				if(flag)
				{		//for displaying success message after adding item		
					session.setAttribute("msg","additemsuccess");				
					session.setAttribute("msgvalue",itemBean.getItemName());
					response.sendRedirect("jsp/error.jsp");
				
				}
				else
				{
					//executes if an item with the same name already exists
					session.setAttribute("msg","namealreadyexist");
					session.setAttribute("msgvalue",itemBean.getItemName());
					response.sendRedirect("jsp/additem.jsp");
				}
			
			}
			catch(SQLException s)
			{
				session.setAttribute("msg","namealreadyexist");
				session.setAttribute("msgvalue",itemBean.getItemName());
				response.sendRedirect("jsp/error.jsp");
			}
			catch(Exception e)
			{
					//in case of any exception			
				session.setAttribute("msg","additemfailure");
				session.setAttribute("msgvalue",itemBean.getItemName());
				response.sendRedirect("jsp/error.jsp");	
			}
		}
		//ADMIN FUNCTIONALILTY
		//display the details of all the items 
		else if(requestSource.equals("viewallitems")){
			try{
				//calling the method of Service layer class
				ArrayList<ItemBean> itemList = itemService.viewAllItems();
				if(!itemList.isEmpty()){
					request.setAttribute("itemList",itemList);
					disp = request.getRequestDispatcher("jsp/manageitem.jsp");
					disp.forward(request,response);
				}
				

			}
			catch (Exception e) {
				// TODO: handle exception
				session.setAttribute("msg","viewallitemfail");
				response.sendRedirect("jsp/error.jsp");
			}
		}
		//CUSTOMER FUNCTIONALILTY
		//display the details of all the items 
		else if(requestSource.equals("viewallitemscustomer")){
			try{
				String deptName=(request.getParameter("deptname"));
				
				//calling the method of Service layer class
				ArrayList<ItemBean> itemList = itemService.viewAllItems(deptName);
				if(!itemList.isEmpty()){
					request.setAttribute("itemlist",itemList);
					disp = request.getRequestDispatcher("jsp/customerviewall.jsp");
					disp.forward(request,response);
				}
				else
				{
					response.sendRedirect("jsp/noitemindepartment.jsp");
				}

			}
			catch (Exception e) {
				// TODO: handle exception
				out.println(e);
			}
		}
		//ADMIN FUNCTIONALILTY
		//Viewing all the details of an individual item
		else if(requestSource.equals("viewbyid"))
		{
			
			ItemBean ib;
			try {
				String itemId=(request.getParameter("itemid"));
				//calling the method of Service layer class
				ib = itemService.viewByItemId(itemId);
				request.setAttribute("item", ib);
				disp=request.getRequestDispatcher("jsp/viewitembyid.jsp");
				disp.forward(request,response);
				
			} catch (Exception e)
			{
				// TODO Auto-generated catch block				
				session.setAttribute("msg","viewitembyidfail");
				response.sendRedirect("jsp/error.jsp");
			}
		}
		//CUSTOMER FUNCTIONALILTY
		//Viewing all the details of an individual item
		else if(requestSource.equals("viewbyidcustomer"))
		{
			
			ItemBean ib;
			try {
				String itemId=(request.getParameter("itemid"));
				//calling the method of Service layer class
				ib = itemService.viewByItemId(itemId);
				request.setAttribute("item", ib);
				disp=request.getRequestDispatcher("jsp/customerviewbyitemid.jsp");
				disp.forward(request,response);
				

				System.out.println(itemId+"  "+ib.getItemId());

			} catch (Exception e)
			{
				session.setAttribute("msg","viewitembyidfail");
				response.sendRedirect("jsp/error1.jsp");
			}
		}
		//ADMIN FUNCTIONALILTY
		//update the item details
		else if(requestSource.equalsIgnoreCase("updateitem"))
		{
			//getting the form field values from the jsp page	
			String itemId = request.getParameter("itemid");
			String itemName = request.getParameter("itemname");
			double price = Double.parseDouble(request.getParameter("price"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			String flavor = request.getParameter("flavor");
			String cancallationStatus = request.getParameter("cancellationStatus");
			String availabilityStatus = request.getParameter("availabilityStatus");
			
			//storing the form field values into bean object
			itemBean = new ItemBean();
			itemBean.setItemId(itemId);
			itemBean.setItemName(itemName);
			itemBean.setItemPrice(price);
			itemBean.setItemQuantity(quantity);
			itemBean.setItemFlavor(flavor);
			itemBean.setCancellationStatus(cancallationStatus);
			itemBean.setAvailabilityStatus(availabilityStatus);
			
				try
				{
					//calling the method of Service layer class
					boolean flag=itemService.updateItem(itemBean);
					if(flag)
					{	
						session.setAttribute("msg","updateitemsuccess");
						session.setAttribute("msgvalue",itemName);
						response.sendRedirect("jsp/error.jsp");
					}
				}
				catch(Exception e)
		
				{
					
					session.setAttribute("msg","updateitemfailure");
					session.setAttribute("msgvalue",itemBean.getItemName());
					response.sendRedirect("jsp/error.jsp");
				}
				
		}
		//ADMIN FUNCTIONALILTY
		//changes the availability status of the item in database
		else if(requestSource.equalsIgnoreCase("deleteitem"))
		{
					String itemid=request.getParameter("itemid");
					try{
						//calling the method of Service layer class
						boolean flag=itemService.deleteItem(itemid);
						if(flag)
						{
							session.setAttribute("msg","deleteitemsuccess");
							session.setAttribute("msgvalue",itemid);
							response.sendRedirect("jsp/error.jsp");
					 	}
					}catch(Exception e)
					{
						
						session.setAttribute("msg","deleteitemfail");
						session.setAttribute("msgvalue",itemBean.getItemName());
						response.sendRedirect("jsp/error.jsp");
					}
		}
		//ADMIN FUNCTIONALILTY-Search 
		if(requestSource.equals("Search"))
		{
			//search by name
			if(request.getParameter("mydropdown").equals("searchbyname"))
			{
				String name=request.getParameter("text");		
				System.out.println(name);
				 
				try {
					ArrayList<ItemBean> ilist=iimpl.searchByName(name);
					request.setAttribute("itemlist", ilist);
					disp=request.getRequestDispatcher("jsp/manageitem.jsp");
						disp.forward(request, response);
					
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			//view all items
			if(request.getParameter("mydropdown").equals("select"))
			{
				response.sendRedirect("jsp/manageitem.jsp");
			}
			//search by department name
			if(request.getParameter("mydropdown").equals("searchbydeptname")){
				String name=request.getParameter("text");		
				System.out.println(name);
				 
				try {
					ArrayList<ItemBean> ilist=iimpl.searchByDeptName(name);
					//out.print(ilist.get(0).getItemName());
					request.setAttribute("itemlist", ilist);
					disp=request.getRequestDispatcher("jsp/manageitem.jsp");
						disp.forward(request, response);
					
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
