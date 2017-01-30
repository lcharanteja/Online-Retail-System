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


import com.tcs.ilp.ors.service.*;

/**
 * Servlet implementation class OutletController
 */
public class OutletController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OutletController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		OutletBean obean=new OutletBean();
		PrintWriter out=response.getWriter();
		OutletService os=new OutletService();  
		DepartmentService ds=new DepartmentService(); 
		session.setAttribute("msg","null");
		session.setAttribute("msgvalue","null");
		RequestDispatcher disp=null;
		String requestSource=request.getParameter("source");
		String returnMsg=null;
		if(requestSource.equals("addoutlet"))
		{
			response.sendRedirect("jsp/addoutlet.jsp");
		}
		
		else if(requestSource.equals("registeroutlet"))
		{
			
			String outletid=request.getParameter("outletid");
			String outletname=request.getParameter("outletname");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			int zipcode=Integer.parseInt(request.getParameter("zipcode"));
			String status=request.getParameter("status");			
			 obean.setOutletid(outletid);
			 obean.setOutletname(outletname);
			obean.setCity(city);
			obean.setState(state);
			obean.setZipcode(zipcode);
			 obean.setStatus(status);		
		
			try
			{
				boolean flag=os.addoutlet(obean);
				if(flag)
				{	
					returnMsg="addoutletsuccess";
					
					session.setAttribute("msg", returnMsg);
					
					session.setAttribute("msgvalue",obean.getOutletname());
					response.sendRedirect("jsp/error.jsp");
				}
				
				
			}	
			catch(Exception e)
	
			{
				returnMsg="addoutletfail";			
				session.setAttribute("msg", returnMsg);				
				session.setAttribute("msgvalue",obean.getOutletname());
				response.sendRedirect("jsp/error.jsp");				
				
			}
			
				}		
		
		else if(requestSource.equals("viewalloutlets"))
		{
			ArrayList<OutletBean> olist=new ArrayList<OutletBean>();
			try {
				
				olist = os.viewall();
			
				if(!olist.isEmpty())
				{
				
					request.setAttribute("outletlist", olist);
					
					disp=request.getRequestDispatcher("jsp/manageoutlet.jsp");
					
					disp.forward(request,response);
					
					
				}
				
			} catch (Exception e) {
				
				returnMsg="viewalloutletfail";
				session.setAttribute("msg", returnMsg);
				
				response.sendRedirect("jsp/error.jsp");
			}
			
		}
		else if(requestSource.equals("viewbyoutletid"))
		{
			System.out.println("inside view outlet");
			OutletBean ob;
			try {
				String outletId=(request.getParameter("outletid"));
				ob = os.viewbyoutletid(outletId);
				
					request.setAttribute("outlet", ob);
					disp=request.getRequestDispatcher("jsp/viewbyid.jsp");
					disp.forward(request,response);
				
			} catch (Exception e)
			{
				returnMsg="viewoutletbyidfail";
				session.setAttribute("msg", returnMsg);
				ob=(OutletBean)request.getAttribute("outlet");
				session.setAttribute("msgvalue",ob.getOutletname());
				response.sendRedirect("jsp/error.jsp");
			}
		}
		else if(requestSource.equalsIgnoreCase("updateoutlet"))
		{
		
			String outletid=request.getParameter("outletid");
			System.out.println(outletid);
			String outletname=request.getParameter("outletname");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			int zipcode=Integer.parseInt(request.getParameter("zipcode"));
			String status=request.getParameter("status");
			 obean=new OutletBean();
			 obean.setOutletid(outletid);
			 obean.setOutletname(outletname);
			 obean.setCity(city);
			 obean.setState(state);
			 obean.setZipcode(zipcode);
			 obean.setStatus(status);
			
			 request.setAttribute("outlet", obean);
				try
				{
					boolean flag=os.updateoutlet(obean);
					if(flag)
					{							
						returnMsg="updateoutletsuccess";
						obean=(OutletBean)request.getAttribute("outlet");
						session.setAttribute("msg", returnMsg);
						session.setAttribute("msgvalue",obean.getOutletname());
						response.sendRedirect("jsp/error.jsp");
						
					}
				}
				catch(Exception e)
		
				{
					returnMsg="updateoutletfail";
					session.setAttribute("msg", returnMsg);
					obean=(OutletBean)request.getAttribute("outlet");
					session.setAttribute("msgvalue",obean.getOutletname());					
					response.sendRedirect("jsp/error.jsp");
				}
				
		}
			
			else if(requestSource.equalsIgnoreCase("deleteoutlet"))
			{
						String outletid=request.getParameter("outletid");					
				
						try{
							boolean flag=os.deleteoutlet(outletid);
							if(flag)
							{
								returnMsg="deleteoutletsuccess";
								
								session.setAttribute("msg", returnMsg);
							
								response.sendRedirect("jsp/error.jsp");
						 	}
						}catch(Exception e)
						{
						returnMsg="deleteoutletfail";
						
						session.setAttribute("msg", returnMsg);
					
						response.sendRedirect("jsp/error.jsp");
						}
			}
			else if(requestSource.equals("adddepartmenttooutlet"))
			{
							
				ArrayList<DepartmentBean> oList;
				try {
					
					oList = ds.viewalldepartments();
					request.setAttribute("departmentlist", oList);
					disp=request.getRequestDispatcher("jsp/adddepartmenttooutlet.jsp");
					disp.forward(request,response);


				} catch (ClassNotFoundException | SQLException e) {
					
					e.printStackTrace();
				}
				
			}
				else if(requestSource.equals("registerdepartmenttooutlet"))
				{
				
					String outletid=request.getParameter("outletid");
					System.out.println(outletid);
					String departmentname=request.getParameter("dname1");
					String departmentid;
					System.out.println(departmentname);
					
					try {
						
						departmentid = ds.finddepartmentid(departmentname);
						System.out.println(departmentid);
						boolean flag = os.searchdepartmentinoutlet(outletid,departmentid);						
						if(flag)
						{
						OutletManagementBean om=new OutletManagementBean();
						om.setDepartmentid(departmentid);
						om.setOutletid(outletid);
						System.out.println(om.getDepartmentid()+om.getOutletid());
						
						boolean check=os.adddepartmenttooutlet(om);
						
						if(check)
						{
							returnMsg="adddepartmenttooutletsuccess";
							
							session.setAttribute("msg", returnMsg);
							
							session.setAttribute("msgvalue",departmentname);
							response.sendRedirect("jsp/error.jsp");
						}
						
						}
						else
						{
							
							response.sendRedirect("jsp/adddepartmenttooutletsuccess.jsp");	
						}
					
					}  catch (SQLException e1) {
					
						returnMsg="adddepartmenttooutletfail";						
						request.setAttribute("msg", returnMsg);						
						request.setAttribute("msgvalue",departmentname);
						response.sendRedirect("jsp/error.jsp");
					}
					catch (ClassNotFoundException e1) {
						out.println(e1);
						
									
					}
								
					}	
				else if(requestSource.equals("viewdepartmentsinoutlet"))
				{
					
					String outletid=request.getParameter("outletid");					
					
					ArrayList<DepartmentBean> olist=new ArrayList<DepartmentBean>();
					try {
						
						olist = os.viewdepartmentsinoutlet(outletid);
						
						if(!olist.isEmpty())
						{
							
							request.setAttribute("departmentlist",olist);						
							disp=request.getRequestDispatcher("jsp/viewdepartmentsinoutlet.jsp");
							disp.forward(request,response);
							
							
						}
						else
						{
							response.sendRedirect("jsp/nothingtodisplay.jsp");
						}
					} catch (Exception e) {
						
						returnMsg="viewalldeptfail";
						
						session.setAttribute("msg", returnMsg);
						
						response.sendRedirect("jsp/error.jsp");
					}
					
				}
				else if (requestSource.equals("adminsearch"))
				{
					ArrayList<OutletBean> olist=new ArrayList<OutletBean>();
					try {
						
						olist = os.viewall();
					
						/*if(!oblist.isEmpty())
						{*/
						
							request.setAttribute("outletlist", olist);
							
							disp=request.getRequestDispatcher("jsp/adminsearch.jsp");
							
							disp.forward(request,response);
							
							
					//	}
					} catch (Exception e) {
						out.println("Sorry.Could not find the page you requested." );
					}
					
					
				}
	
		else if(requestSource.equals("searchoutlet"))
		{
			out.println(requestSource);
			String searchby=request.getParameter("search");
			out.println(searchby);
			String city=request.getParameter("searchcity");
			out.println(city);
			
			String state=request.getParameter("searchstate");
			out.println(state);
			String zip=request.getParameter("searchzip");
						
			if(searchby.equalsIgnoreCase("outletname"))
			{     
				String name=request.getParameter("searchname");
					try {
						ArrayList<OutletBean>  oList = os.viewbyoutletname(name);
						request.setAttribute("olist", oList);
						disp=request.getRequestDispatcher("jsp/adminviewbyoutletname.jsp");
						disp.forward(request,response);
							//out.println("found this result")
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					//out.println("searched by name");
					
						/*;*/
			
			}
			
			
			
			if(searchby.equalsIgnoreCase("state"))
			{
				String state1=request.getParameter("searchstate");
			try {
						ArrayList<OutletBean>  oList = os.viewbyoutletstate(state1);
						request.setAttribute("olist", oList);
						disp=request.getRequestDispatcher("jsp/adminviewbyoutletstate.jsp");
						disp.forward(request,response);
							//out.println("found this result")
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					//out.println("searched by name");
					
						/*;*/
			
			}
			if(searchby.equalsIgnoreCase("city"))
			{
				String state1=request.getParameter("searchcity");
					try {
						ArrayList<OutletBean>  oList = os.viewbyoutletcity(city);
						request.setAttribute("olist", oList);
						disp=request.getRequestDispatcher("jsp/adminviewbyoutletcity.jsp");
						disp.forward(request,response);
							//out.println("found this result")
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					//out.println("searched by name");
					
						/*;*/
			
			}
			if(searchby.equalsIgnoreCase("zipcode"))
			{
				int zip1=Integer.parseInt(request.getParameter("searchzip"));
					try {
						ArrayList<OutletBean>  oList = os.viewbyoutletzipcode(zip1);
						request.setAttribute("olist", oList);
						disp=request.getRequestDispatcher("jsp/adminviewbyoutletzipcode.jsp");
						disp.forward(request,response);
							//out.println("found this result")
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (SQLException e) {
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
