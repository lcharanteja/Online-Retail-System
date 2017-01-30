package com.tcs.ilp.ors.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.ors.bean.CustomerBean;
import com.tcs.ilp.ors.dao.CustomerImpl;
import com.tcs.ilp.ors.service.CustomerModel;

/**
 * Servlet implementation class ProfileController
 */
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestSource = request.getParameter("source");
		System.out.println(requestSource);
		RequestDispatcher disp = null;
		PrintWriter out=response.getWriter();
		CustomerModel model=new CustomerModel();
		CustomerImpl cimpl=new CustomerImpl();
		CustomerBean cbean=new CustomerBean();
		HttpSession session=request.getSession(true);
		ArrayList<CustomerBean> cList = new ArrayList<CustomerBean>();
	/*	String date=request.getParameter("date");
		SimpleDateFormat formatter = new SimpleDateFormat();*/
		if(requestSource.equalsIgnoreCase("help"))
		{
			response.sendRedirect("jsp/formsubmitted.jsp");
		}
		
		if(requestSource.equalsIgnoreCase("viewRegisterPage")){
			response.sendRedirect("jsp/register.jsp");
		}
		
		if(requestSource.equalsIgnoreCase("register")){
			cbean.setFirstName(request.getParameter("firstname"));
			cbean.setMiddleName(request.getParameter("middlename"));
			cbean.setLastName(request.getParameter("lastname"));
			cbean.seteMail(request.getParameter("email"));
			cbean.setGender(request.getParameter("sex"));
			cbean.setPhoneNo(Long.parseLong(request.getParameter("phone")));
			cbean.setPassword(request.getParameter("password"));
			/*cbean.setDOB(request.getParameter("date"));*/
			String date=request.getParameter("date");
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date utilDate;
				try {
					utilDate = formatter.parse(date);
					
					cbean.setDOB(utilDate);
					//out.println(cbean.getDOB());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
		try {
				if(model.addCustomers(cbean)){
					
					//out.println("Dear "+cbean.getFirstName()+" your customerId is generated");
					session.setAttribute("success","Dear "+cbean.getFirstName()+" your are successfully registered.Your email id is your loginId");
					disp=request.getRequestDispatcher("jsp/registersuccess.jsp");
					disp.forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				session.setAttribute("error","User with this email or mobile number is already registered");
				response.sendRedirect("jsp/404.jsp");
			}
		}
		
		if(requestSource.equalsIgnoreCase("viewprofile")){
			String email=(String) session.getAttribute("email");
			if(null==email)
			   {
			
			    disp=request.getRequestDispatcher("jsp/sessionlogin.jsp");
			     disp.forward(request,response);
			   }else{
			try {
				
				
				cbean=model.viewProfile(email);
				request.setAttribute("custdetails", cbean);
				disp=request.getRequestDispatcher("jsp/viewprofile.jsp");
				disp.include(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
			
		}
		if(requestSource.equalsIgnoreCase("adminviewprofile")){
			
			try {
				
				//String email=(String) session.getAttribute("email");
				String email=request.getParameter("emailid");
				cbean=model.viewProfile(email);
				request.setAttribute("custdetails", cbean);
				disp=request.getRequestDispatcher("jsp/adminviewprofile.jsp");
				disp.include(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		if(requestSource.equals("edit")){
			String email=(String) session.getAttribute("email");
			if(email==null)
			   {
			
			   response.sendRedirect("jsp/sessionlogin.jsp");
			    
			   }else{
			
			try {
				
				cbean=model.viewProfile(email);
				//out.println(cbean.geteMail());
				response.setContentType("html");
				request.setAttribute("custdetails", cbean);
				
				disp=request.getRequestDispatcher("jsp/update.jsp");
				disp.include(request, response);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   }
		}
		if(requestSource.equals("update"))
		{
			String email=(String) session.getAttribute("email");
			if(null==email)
			   {
			
			    disp=request.getRequestDispatcher("jsp/sessionlogin.jsp");
			     disp.forward(request,response);
			   }else{
			try {
				cbean=model.viewProfile(email);
				cbean.setFirstName(request.getParameter("firstname"));
				cbean.setMiddleName(request.getParameter("middlename"));
				//cbean.setGender(request.getParameter("sex"));
				cbean.setLastName(request.getParameter("lastname"));
				cbean.setPhoneNo(Long.parseLong(request.getParameter("phone")));
				try {
					if(model.update(cbean)){
							
									//out.println("<html><body><centre><h3>updated successfully</h3></body></html>");
									request.setAttribute("custdetails", cbean);
									disp=request.getRequestDispatcher("jsp/updateviewprofile.jsp");
									disp.forward(request, response);
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		
		/*String date=request.getParameter("date");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilDate;
			try {
				utilDate = formatter.parse(date);
				
				cbean.setDOB(utilDate);
				//out.println(cbean.getDOB());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
			   }
		}
		if(requestSource.equalsIgnoreCase("viewcustomers")){
			String email=(String) session.getAttribute("email");
			if(null==email)
			   {
			
			    disp=request.getRequestDispatcher("jsp/sessionlogin.jsp");
			     disp.forward(request,response);
			   }else{
			try {
				cList = model.viewAllUsers();
				request.setAttribute("userList", cList);
				disp = request.getRequestDispatcher("jsp/viewallcustomers.jsp");
				disp.include(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			   }
		}
		if(requestSource.equals("deactivate")){
			String email=(String) session.getAttribute("email");
			if(email==null)
			   {
			    //request.setAttribute("Error" , "Session has expired.....Please Login");
			     RequestDispatcher rd=request.getRequestDispatcher("jsp/sessionlogin.jsp");
			     rd.forward(request,response);
			   }else{
			try {
				if(model.deactivate(email)){
					;
					session.invalidate();
					disp = request.getRequestDispatcher("jsp/deactivatesuccess.jsp");
					disp.forward(request, response);
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}}
		}
		if(requestSource.equals("admindeactivate")){
			String email=(String) request.getParameter("emailid");
			try {
				if(model.deactivate(email)){
					//out.println("Deactivated successfully");
					cList = model.viewAllUsers();
					request.setAttribute("userList", cList);
					disp = request.getRequestDispatcher("jsp/viewallcustomers.jsp");
					disp.include(request, response);
					
				}
				else{
					out.print("deactive");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(requestSource.equals("adminactivate")){
			String email=(String) request.getParameter("emailid");
			try {
				if(model.activate(email)){
					cList = model.viewAllUsers();
					request.setAttribute("userList", cList);
					disp = request.getRequestDispatcher("jsp/viewallcustomers.jsp");
					disp.include(request, response);
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
if(requestSource.equals("Search"))
			{   
	if(request.getParameter("mydropdown").equals("searchbyid"))
	{
		String id=request.getParameter("text");		
		
		 
		try {
			ArrayList<CustomerBean>clist=cimpl.searchById(id);
			//out.print(clist.get(0).getFirstName());
			request.setAttribute("userlist", clist);
			disp=request.getRequestDispatcher("jsp/viewallcustomers.jsp");
				disp.forward(request, response);
			
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	if(request.getParameter("mydropdown").equals("searchbyname"))
			{
				String name=request.getParameter("text");		
				
				 
				try {
					ArrayList<CustomerBean>clist=cimpl.searchByName(name);
					//out.print(clist.get(0).getFirstName());
					request.setAttribute("userlist", clist);
					disp=request.getRequestDispatcher("jsp/viewallcustomers.jsp");
						disp.forward(request, response);
					
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
				
				if(request.getParameter("mydropdown").equals("searchbystatus"))
				{
					String status=request.getParameter("text");		
					System.out.println(status);
					 
					try {
						ArrayList<CustomerBean>clist=cimpl.searchByStatus(status);
						//out.print(clist.get(0).getFirstName());
						request.setAttribute("userlist", clist);
						disp=request.getRequestDispatcher("jsp/viewallcustomers.jsp");
							disp.forward(request, response);
						
					
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(request.getParameter("mydropdown").equals("searchbyemail"))
				{
					String emailuser=request.getParameter("text");		
					System.out.println(emailuser);
					 
					try {
						System.out.println("hi");
						ArrayList<CustomerBean>clist=cimpl.searchByemail(emailuser);
							//System.out.println(clist .get(0).geteMail());
							request.setAttribute("userlist", clist);
							disp=request.getRequestDispatcher("jsp/viewallcustomers.jsp");
							disp.forward(request, response);
						
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(request.getParameter("mydropdown").equals("select"))
				{
					response.sendRedirect("jsp/viewallcustomers.jsp");
				}
			}
if(requestSource.equals("forgotpassword"))
{
	response.sendRedirect("jsp/forgotpassword.jsp");
}





if(requestSource.equals("password"))
{
	String email=request.getParameter("email");
	String lastname=request.getParameter("lastname");
	try {
		
		String pass=cimpl.forgotPassword(email,lastname);
		//System.out.println(pass);
		request.setAttribute("password", pass);
		disp=request.getRequestDispatcher("jsp/password.jsp");
		disp.forward(request, response);
		
	} catch (Exception e) {
		e.printStackTrace();
	} 	
}
if(requestSource.equals("viewindividual"))
{
	
	String email=(String) request.getParameter("emailid");
	
	try {
		
		
		cbean=model.viewProfile(email);
		request.setAttribute("custdetails", cbean);
		disp=request.getRequestDispatcher("jsp/viewindivdualbyadmin.jsp");
		disp.include(request, response);
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
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
