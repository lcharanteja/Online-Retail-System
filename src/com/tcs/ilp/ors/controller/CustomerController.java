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
import com.tcs.ilp.ors.dao.ItemImpl;
import com.tcs.ilp.ors.dao.OrderImpl;

import com.tcs.ilp.ors.service.*;

/**
 * Servlet implementation class CustomerController
 */
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		OutletBean obean=new OutletBean();
		DepartmentBean db=new DepartmentBean();
		OutletManagementBean od=new OutletManagementBean();
		ItemBean ibean = new ItemBean();
		PrintWriter out=response.getWriter();
		OutletService os=new OutletService();  
		OrderImpl oimpl = new OrderImpl();
		ItemImpl iipl= new ItemImpl();
		RequestDispatcher disp=null;
		String requestSource=request.getParameter("source");
		if(requestSource.equals("customersearch"))
		{ ArrayList<OutletBean> oList;
		try {
			oList = os.viewall();
			request.setAttribute("outletlist", oList);
			disp=request.getRequestDispatcher("jsp/selectoutletandemail.jsp");
			disp.forward(request,response);


		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			out.println("will direct to customer search");
			//response.sendRedirect("jsp/customersearch.jsp");
		}
		
		
		
		else if(requestSource.equals("customeroutletsearch"))
		{ ArrayList<OutletBean> oList;
		try {
			oList = os.viewall();
			request.setAttribute("outletlist", oList);
			disp=request.getRequestDispatcher("jsp/Locateoutlet.jsp");
			disp.forward(request,response);


		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			out.println("will direct to customer search");
			//response.sendRedirect("jsp/customersearch.jsp");
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
			out.println(zip);
			String eml=request.getParameter("email");
		
			HttpSession session = request.getSession();
			String email=(String)session.getAttribute("email");
			//eml;
			if(email==null)
			session.setAttribute("email", eml);
			
			if(searchby.equalsIgnoreCase("outletname"))
			{     
				String name=request.getParameter("searchname");
					try {
						ArrayList<OutletBean>  oList = os.viewbyoutletname(name);
						request.setAttribute("olist", oList);
						disp=request.getRequestDispatcher("jsp/viewbyoutletnames.jsp");
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
						disp=request.getRequestDispatcher("jsp/viewbyoutletstate.jsp");
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
						disp=request.getRequestDispatcher("jsp/viewbyoutletcity.jsp");
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
						disp=request.getRequestDispatcher("jsp/viewbyoutletzipcode.jsp");
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
		else if(requestSource.equals("searchoutletlocate"))
		{
			out.println(requestSource);
			String searchby=request.getParameter("search");
			out.println(searchby);
			String city=request.getParameter("searchcity");
			out.println(city);
			
			String state=request.getParameter("searchstate");
			out.println(state);
			String zip=request.getParameter("searchzip");
			out.println(zip);
			String eml=request.getParameter("email");
		
			HttpSession session = request.getSession();
			String email=(String)session.getAttribute("email");
			//eml;
			if(email==null)
			session.setAttribute("email", eml);
			
			if(searchby.equalsIgnoreCase("outletname"))
			{     
				String name=request.getParameter("searchname");
					try {
						ArrayList<OutletBean>  oList = os.viewbyoutletname(name);
						request.setAttribute("olist", oList);
						disp=request.getRequestDispatcher("jsp/outletbyname.jsp");
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
						disp=request.getRequestDispatcher("jsp/outletbystate.jsp");
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
						disp=request.getRequestDispatcher("jsp/outletbycity.jsp");
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
						disp=request.getRequestDispatcher("jsp/outletbyzip.jsp");
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
		
		else if(requestSource.equals("ordersummary"))
		{
			String outletid= request.getParameter("outletid");
			request.setAttribute("outletid", outletid);
			disp=request.getRequestDispatcher("jsp/payment.jsp");
			disp.forward(request, response);
			//out.print(outletid+requestSource);
			
			
		}
		
		
	
		
		else if(requestSource.equals("selectoutletid"))
		{
			
			
			String outletid= request.getParameter("outletid");
			try {
				OutletBean outbean = os.viewbyoutletid(outletid);
				request.setAttribute("outletbean", outbean);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			disp=request.getRequestDispatcher("jsp/ordersummary1.jsp");
			disp.forward(request, response);
			
		}
	
		else if(requestSource.equals("afterpay"))
		{
			String orderid=null;
			HttpSession session= request.getSession();
			String email=(String)session.getAttribute("email");
			String outletid= request.getParameter("outletid");
			OrderBean ob= new OrderBean();
			double totalprice= (double)session.getAttribute("totalbill");
			ob.setPrice(totalprice);
			ob.setCustomerid(email);
			ob.getObean().setOutletid(outletid);
			
			
			
			
			
			
			try {
				orderid = oimpl.addOrder(ob);
				
				//out.print(st);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(orderid!=null)
			{
				out.print(orderid);
				HttpSession session1= request.getSession();
				
				ArrayList<ItemBean> iList= (ArrayList<ItemBean>) session.getAttribute("List");
				
				
				
				
				
				
				
				if(oimpl.insertOrderDetail(iList, orderid)){
					
					
					
					System.out.println("inside oimpl.insert");
					for(ItemBean ibean1 : iList)
					{
					if(ibean1.getBuyQuantity()<ibean1.getItemQuantity())
					{
						ibean1.setItemQuantity((ibean1.getItemQuantity()-ibean1.getBuyQuantity()));
						try {
							iipl.updateItem(ibean1);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
					}
					else if(ibean1.getBuyQuantity()==ibean1.getItemQuantity())
					{
						
						ibean1.setItemQuantity((ibean1.getItemQuantity()-ibean1.getBuyQuantity()));
						ibean1.setAvailabilityStatus("NOTAVAILABLE");
						try {
							iipl.updateItem(ibean1);
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					}
					
					
					
					
					
					session1.invalidate();
					disp=request.getRequestDispatcher("jsp/index.jsp");
					disp.forward(request, response);
				}
				
				//out.print(iList.get(0).getPrice());
				
				
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
