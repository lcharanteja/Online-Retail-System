package com.tcs.ilp.ors.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.ors.bean.*;
import com.tcs.ilp.ors.dao.DepartmentImpl;
import com.tcs.ilp.ors.service.*;


/**
 * Servlet implementation class DepartmentController
 */
public class DepartmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.setAttribute("msg","null");
		session.setAttribute("msgvalue","null");
		ItemManagementBean im=new ItemManagementBean();
		DepartmentBean dbean=new DepartmentBean();	
		DepartmentImpl dimpl=new DepartmentImpl();
		PrintWriter out=response.getWriter();
		DepartmentService ds=new DepartmentService();                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
		RequestDispatcher disp=null;
		String returnMsg=null;
		ItemService is=new ItemService();
		String requestSource=request.getParameter("source");		
		if(requestSource.equals("managedepartments"))
		{
			response.sendRedirect("jsp/managedepartment.jsp");
		}
		
		
		
	/*-------------------To Add Departments--------------------*/		
		if(requestSource.equals("adddepartment"))
		{
			response.sendRedirect("jsp/adddepartment.jsp");
		}
		
		
	/*-------------------To Register Departments--------------------*/
		else if(requestSource.equals("registerdepartment"))
		{
			
			String departmentid=request.getParameter("departmentid");
			String departmentname=request.getParameter("departmentname");
			String status=request.getParameter("dstatus");		
			dbean.setDepartmentid(departmentid);
			dbean.setDepartmentname(departmentname);
			dbean.setStatus(status);		
		
			try
			{
				boolean flag=ds.adddepartment(dbean);
				if(flag)
				{
					returnMsg="adddepartmentsuccess";
					
					session.setAttribute("msg", returnMsg);
					
					session.setAttribute("msgvalue",dbean.getDepartmentname());
					response.sendRedirect("jsp/error.jsp");
				}
									
			
			}
			catch(SQLException e)
			
			{
				returnMsg="deptnamealreadyexist";
				
				session.setAttribute("msg", returnMsg);
				
				session.setAttribute("msgvalue",dbean.getDepartmentname());
				response.sendRedirect("jsp/error.jsp");
			}	
			catch(Exception e)
	
			{
				returnMsg="adddepartmentfail";
				
				session.setAttribute("msg", returnMsg);
				
				session.setAttribute("msgvalue",dbean.getDepartmentname());
				response.sendRedirect("jsp/error.jsp");
			}			
			
			
		}
		/*-------------------To View All the Departments--------------------*/
		
		else if(requestSource.equals("viewalldepartments"))
		{
			ArrayList<DepartmentBean> dlist=new ArrayList<DepartmentBean>();
			try {
				
				dlist = ds.viewalldepartments();
				System.out.println("inside function");
				/*if(!dlist.isEmpty())
				{*/
					
					request.setAttribute("departmentlist",dlist);
					System.out.println("inside view department");
					disp=request.getRequestDispatcher("jsp/managedepartment.jsp");
					disp.forward(request,response);
								
				/*}
				else{
					out.println("is empty");
				}*/
			} catch (Exception e) {
				returnMsg="viewalldeptfail";
				
				session.setAttribute("msg", returnMsg);
				
				session.setAttribute("msgvalue",dbean.getDepartmentname());
				response.sendRedirect("jsp/error.jsp");
			}
			
		}
		/*-------------------To View the Department Based on Id--------------------*/
		else if(requestSource.equals("viewbydepartmentid"))
		{
			System.out.println("inside view department");
		DepartmentBean db;
			try {
				    String departmentid=(request.getParameter("departmentid"));
				    db = ds.viewbydepartmentid(departmentid);				
					request.setAttribute("department",db);
					disp=request.getRequestDispatcher("jsp/viewbydepartmentid.jsp");
					disp.forward(request,response);
				
			} catch (Exception e)
			{

				returnMsg="viewdeptidfail";
				session.setAttribute("msg", returnMsg);
				db=(DepartmentBean)request.getAttribute("department");
				session.setAttribute("msgvalue",db.getDepartmentname());
				response.sendRedirect("jsp/error.jsp");
			}
		}
		/*-------------------To Update the Department--------------------*/
			else if(requestSource.equalsIgnoreCase("updatedepartment"))
			{
				String departmentid=request.getParameter("departmentid");
				String departmentname=request.getParameter("departmentname");
				String status=request.getParameter("status");
				 dbean=new DepartmentBean();
				 dbean.setDepartmentid(departmentid);
				 dbean.setDepartmentname(departmentname);
				 dbean.setStatus(status);
				 
				 try
					{
						boolean flag=ds.updatedepartment(dbean);
						if(flag)
						{	
							returnMsg="updatedeptsuccess";
							session.setAttribute("msg", returnMsg);						
							session.setAttribute("msgvalue",dbean.getDepartmentname());
							response.sendRedirect("jsp/error.jsp");
							
						}
					}
					catch(Exception e)
			
					{
						returnMsg="updatedeptfail";
						session.setAttribute("msg", returnMsg);						
						session.setAttribute("msgvalue",dbean.getDepartmentname());
						response.sendRedirect("jsp/error.jsp");
						
					}
					
			}
		/*-------------------To Delete the Department--------------------*/
			else if(requestSource.equalsIgnoreCase("deletedepartment"))
			{
						String departmentid=request.getParameter("departmentid");
					
				
						try{
							boolean flag=ds.deletedepartment(departmentid);
							if(flag)
							{
								out.println(departmentid+" deleted successfully");
						 	}
						}catch(Exception e)
						{
							out.println(e);
						}
			}
		
		
		/*-------------------To Add Items into a particular Department--------------------*/
		
			else if(requestSource.equals("additemtodepartment"))
			{
				String departmentid=(request.getParameter("departmentid"));
				request.setAttribute("departmentid",departmentid);
				ArrayList<ItemBean> oList;
				try {
					oList = is.viewAllItems();
					request.setAttribute("itemlist", oList);
					disp=request.getRequestDispatcher("jsp/additemtodepartment.jsp");
					disp.forward(request,response);


				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
				
			}
		
		/*-------------------To Register Items into Department--------------------*/
		
				else if(requestSource.equals("registeritemtodepartment"))
				{
					
					String departmentid=request.getParameter("departmentid");
					String itemname=request.getParameter("itemname");
					String itemid;
					System.out.println(itemname);
					
					try {
						
						itemid = is.finditemid(itemname);
						System.out.println(departmentid);
						boolean flag = ds.searchitemindepartment(departmentid,itemid);
						
						if(flag)
						{
						im.setItemid(itemid);
						im.setDepartmentid(departmentid);
						out.println(im.getItemid()+im.getDepartmentid());
						
						boolean check=ds.additemtodepartment(im);
						
						if(check)
						{
							returnMsg="additemtodeptsuccess";							
							session.setAttribute("msg", returnMsg);							
							session.setAttribute("msgvalue",itemname);
							response.sendRedirect("jsp/error.jsp");
						}
						}
						else
						{
						response.sendRedirect("jsp/additemtodepartmentfail.jsp");
						}
					
					} catch (ClassNotFoundException e1) {
						
						out.println("classnotfound");
					} catch (SQLException e1) {
						
						returnMsg="additemtodeptfail";
						
						session.setAttribute("msg", returnMsg);
						
						session.setAttribute("msgvalue",itemname);
						response.sendRedirect("jsp/error.jsp");
					}
								
					}
		/*-------------------To Search a Department Based on Given Id --------------------*/
		
		if(requestSource.equals("Search"))
		{
			if(request.getParameter("mydropdown").equals("searchbyid"))
			{
				String name=request.getParameter("text");		
				System.out.println(name);
				 
				try {
					ArrayList<DepartmentBean> dlist=dimpl.searchByDeptId(name);
					//out.print(ilist.get(0).getItemName());
					request.setAttribute("departmentList", dlist);
					disp=request.getRequestDispatcher("jsp/managedepartment.jsp");
						disp.forward(request, response);
					
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			/*-------------------To Search a Department Based on Given Name--------------------*/
			
			if(request.getParameter("mydropdown").equals("searchbyname"))
			{
				String name=request.getParameter("text");		
				System.out.println(name);
				 
				try {
					ArrayList<DepartmentBean> dlist=dimpl.searchByName(name);
					//out.print(ilist.get(0).getItemName());
					request.setAttribute("departmentList", dlist);
					disp=request.getRequestDispatcher("jsp/managedepartment.jsp");
						disp.forward(request, response);
					
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			/*-------------------To Search a Department Based on Status Availability--------------------*/
			
			
			if(request.getParameter("mydropdown").equals("searchbystatus"))
			{
				String name=request.getParameter("text");		
				System.out.println(name);
				 
				try {
					ArrayList<DepartmentBean> dlist=dimpl.searchByStatus(name);
					//out.print(ilist.get(0).getItemName());
					request.setAttribute("departmentList", dlist);
					disp=request.getRequestDispatcher("jsp/managedepartment.jsp");
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
