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


import com.tcs.ilp.ors.bean.CustomerBean;
import com.tcs.ilp.ors.bean.ItemBean;
import com.tcs.ilp.ors.bean.LoginBean;
import com.tcs.ilp.ors.dao.CustomerImpl;
import com.tcs.ilp.ors.service.LoginService;


/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	doPost(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestSource = request.getParameter("source");
		RequestDispatcher disp = null;
		PrintWriter out=response.getWriter();
		LoginService model=new LoginService();
		HttpSession session=request.getSession();
		LoginBean lbean=new LoginBean();
		
		CustomerImpl cimpl= new CustomerImpl();
		
		if(requestSource.equalsIgnoreCase("login")){
			lbean.setLoginId(request.getParameter("id"));
			lbean.setPassword(request.getParameter("pwd"));
			
			try {
				String role=model.login(lbean);
				String status=model.loginStatus(lbean);
				if(role==null){
					//response.setContentType("text/html");
					//out.println("invalid Email id / password");
					disp=request.getRequestDispatcher("jsp/invalidaccount.jsp");
					disp.include(request, response);
				}
				else if((role.equals("customer"))){
					session.setAttribute("email", request.getParameter("id"));
				if(status.equalsIgnoreCase("active")){
					
				    int buyquan=0;
				    session.setAttribute( "BuyQuan", buyquan );
				    
				    
				    
				   // out.print(quan);
				    ArrayList<ItemBean> iList= new ArrayList<ItemBean>();
				    session.setAttribute( "List", iList );
				
					
					CustomerBean custbean = cimpl.viewProfile(request.getParameter("id"));
					session.setAttribute("custName", custbean.getFirstName());
					
					response.sendRedirect("jsp/indexItem.jsp");
					}else
					{
						response.sendRedirect("jsp/invalidaccount.jsp");
					}
					/*session.setAttribute("emailid", request.getParameter("id"));
					response.sendRedirect("jsp/custhome.jsp");*/
				}
				else if((role.equals("admin"))){
					
					session.setAttribute("email", request.getParameter("id"));
					response.sendRedirect("jsp/adminhome.jsp");
				
				}
				
				
				 
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		if(requestSource.equalsIgnoreCase("logout")){

			
		/*	session.removeAttribute("custName");
			session.removeAttribute("totalbill");
			session.removeAttribute("List");*/
			session.invalidate();
			
			HttpSession session1=request.getSession();
			ArrayList<ItemBean> iList= new ArrayList<ItemBean>();
			session1.setAttribute("List", iList);

		
			
			//session.removeAttribute("BuyQuan");
			int quan=0;
			session1.setAttribute("BuyQuan", quan);
			
			//session.removeAttribute("email");
			
			String email=null;
			session1.setAttribute("email", email);
			//session.invalidate();
			disp=request.getRequestDispatcher("jsp/logout.jsp");
			disp.include(request, response);
			
			
		}
		else if(requestSource.equalsIgnoreCase("adminlogout")){
			/*session.removeAttribute("email");
			session.removeAttribute("custName");
			session.removeAttribute("totalbill");
			session.removeAttribute("iList");*/

			
			//HttpSession session1=request.getSession();
			//ArrayList<ItemBean> iList= new ArrayList<ItemBean>();
			//session1.setAttribute("List", iList);

		
			
			session.removeAttribute("BuyQuan");
			//int quan=0;
			//session1.setAttribute("BuyQuan", quan);
			
			
			
			String email=null;
			//session1.setAttribute("email", email);
			//session.invalidate();
			session.removeAttribute("email");
			session.invalidate();
			disp=request.getRequestDispatcher("jsp/logout.jsp");
			disp.include(request, response);
			
			
		}
		}

}
