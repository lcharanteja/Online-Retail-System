package com.tcs.ilp.ors.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.security.util.DisabledAlgorithmConstraints;

import com.tcs.ilp.ors.bean.ItemBean;
import com.tcs.ilp.ors.dao.ItemDAO;
import com.tcs.ilp.ors.dao.ItemImpl;

/**
 * Servlet implementation class CartController
 */
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String reqsource = request.getParameter("source");
		PrintWriter out = response.getWriter();
		RequestDispatcher rdisp;
		ItemImpl iimpl = new ItemImpl();
	/*------------------------------------------To set new cart(array list) for customer---------------------- */
		if (reqsource.equals("start")) {
			HttpSession session = request.getSession();
			int buyquan = 0;
			session.removeAttribute("BuyQuan");
			session.setAttribute("BuyQuan", buyquan);
			session.removeAttribute("email");
			String email = null;
			session.setAttribute("email", email);
			// out.print(quan);
			session.removeAttribute("List");
			ArrayList<ItemBean> iList = new ArrayList<ItemBean>();
			session.setAttribute("List", iList);
			response.sendRedirect("jsp/index.jsp");

		} else if (reqsource.equals("backfromcustomerviewbyid")) {
			response.sendRedirect("jsp/indexItem.jsp");

		} 
		/*------To show item details when customer adds item to cart(Array list) and enables customer to select quantity------------------*/
		else if (reqsource.equals("buy")) {

			String id = request.getParameter("itemid");

			ItemBean ibean;
			try {
				ibean = iimpl.viewByItemId(id);
				request.setAttribute("ibean", ibean);
				rdisp = request
						.getRequestDispatcher("jsp/buyproductwithquantity.jsp");
				rdisp.forward(request, response);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (reqsource.equals("payment")) {

			response.sendRedirect("jsp/PaymentSuccess.jsp");
		}

		else if (reqsource.equals("searchoutlet")) {
			// out.print("hi");
			RequestDispatcher disp = request
					.getRequestDispatcher("jsp/customersearch.jsp");
			disp.forward(request, response);
		}
/*---------------------------------------Inserts Item into cart before displaying the cart-------------------------------*/
		else if (reqsource.equals("precart")) {
			out.print(reqsource);
			System.out.println("inside pre");
			String id = request.getParameter("itemid");
			out.print(id);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			out.print(quantity);
			HttpSession session = request.getSession(true);
			int showquan = quantity;

			try {
				ItemBean ibean = iimpl.viewByItemId(id);
				ibean.setBuyQuantity(quantity);

				// session.getAttribute("emailid");
				ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session
						.getAttribute("List");
				// String name = (String) session.getAttribute("Name");
				ListIterator<ItemBean> it = iList.listIterator();
				boolean b = false;
				while (it.hasNext()) {
					// boolean b = false;

					ItemBean ib = it.next();
					if (ib.getItemId().equalsIgnoreCase(id)) {
						showquan = showquan + ib.getBuyQuantity();
						ib.setBuyQuantity(quantity + ib.getBuyQuantity());
						b = true;

					}
				}
				if (!b)
					iList.add(ibean);
				response.sendRedirect("jsp/cart.jsp");

				session.setAttribute("BuyQuan", showquan);

			} catch (ClassNotFoundException | SQLException
					| NullPointerException e) {
				// TODO Auto-generated catch block
				response.sendRedirect("jsp/404.jsp");
			}

		}
/*---------------------------To remove item from cart(Array list)---------------------------------*/

		else if (reqsource.equals("remove")) {
			String id = request.getParameter("itemid");
			// out.print(id);

			HttpSession session = request.getSession();
			ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session
					.getAttribute("List");
			ListIterator<ItemBean> it = iList.listIterator();
			while (it.hasNext()) {
				ItemBean ib = it.next();
				if (ib.getItemId().equalsIgnoreCase(id)) {
					it.remove();

				}

			}
			response.sendRedirect("jsp/cart.jsp");

		}
/*------------------------To update quantity in cart(Array list)------------------------------------------------*/
		else if (reqsource.equals("updatequan")) {

			String id = request.getParameter("itemid");
			HttpSession session = request.getSession();
			ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session
					.getAttribute("List");
			ListIterator<ItemBean> it = iList.listIterator();
			while (it.hasNext()) {
				ItemBean ib = it.next();
				if (ib.getItemId().equalsIgnoreCase(id)) {
					it.remove();

				}

			}

			ItemBean ibean;
			try {
				ibean = iimpl.viewByItemId(id);
				request.setAttribute("ibean", ibean);
				rdisp = request
						.getRequestDispatcher("jsp/updateproductwithquantity.jsp");
				rdisp.forward(request, response);
				// out.print(ibean.getItemName());
				/*
				 * HttpSession session = request.getSession();
				 * ArrayList<ItemBean> iList= (ArrayList<ItemBean>)
				 * session.getAttribute("List"); String name = (String)
				 * session.getAttribute("Name"); iList.add(ibean);
				 * response.sendRedirect("cart.jsp");
				 */

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
/*---------------------------confirmation for removing item from cart(Array list)---------------------------------*/
		else if (reqsource.equals("removeconfirm")) {
			String id = request.getParameter("itemid");

			ItemBean ibean = null;
			HttpSession session = request.getSession();

			ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session
					.getAttribute("List");
			ListIterator<ItemBean> it = iList.listIterator();
			while (it.hasNext()) {
				ItemBean ib = it.next();
				if (ib.getItemId().equalsIgnoreCase(id)) {
					ibean = ib;

				}

			}
			request.setAttribute("ibean", ibean);
			rdisp = request.getRequestDispatcher("jsp/confirmremove.jsp");
			rdisp.forward(request, response);

		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
