package com.tcs.ilp.ors.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.channels.SeekableByteChannel;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tcs.ilp.ors.bean.DepartmentBean;
import com.tcs.ilp.ors.bean.ItemBean;
import com.tcs.ilp.ors.bean.OrderBean;
import com.tcs.ilp.ors.bean.OrderDetailsBean;
import com.tcs.ilp.ors.bean.OutletBean;
import com.tcs.ilp.ors.bean.OutletManagementBean;
import com.tcs.ilp.ors.dao.ItemImpl;
import com.tcs.ilp.ors.dao.OrderImpl;
import com.tcs.ilp.ors.service.OutletService;

/**
 * Servlet implementation class OrderController
 */
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderController() {
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
		HttpSession session = request.getSession(true);
		OutletBean obean = new OutletBean();
		ItemImpl iipl = new ItemImpl();
		DepartmentBean db = new DepartmentBean();
		OutletManagementBean od = new OutletManagementBean();
		PrintWriter out = response.getWriter();
		OutletService os = new OutletService();
		OrderImpl oimpl = new OrderImpl();
		RequestDispatcher disp = null;
		String requestSource = request.getParameter("source");
		if (requestSource.equals("afterpay")) {
			String payMethod = request.getParameter("pay");
			if (payMethod.equalsIgnoreCase("atm")
					|| payMethod.equalsIgnoreCase("mobilebanking")) {
				String outletid = request.getParameter("outletid");
				request.setAttribute("outletid", outletid);
				disp = request.getRequestDispatcher("jsp/paymentsecond.jsp");
				// disp=request.getRequestDispatcher("jsp/netbanking.jsp");
				disp.forward(request, response);

			}

			else if (payMethod.equalsIgnoreCase("netbanking")) {
				String outletid = request.getParameter("outletid");
				request.setAttribute("outletid", outletid);
				// disp=request.getRequestDispatcher("jsp/paymentsecond.jsp");
				disp = request.getRequestDispatcher("jsp/netbanking.jsp");
				disp.forward(request, response);
			}

		}

		/*-----------------------------------------------After making payment-----------------------------------*/
		else if (requestSource.equals("dummypay")) {
			String orderid = null;
			// HttpSession session= request.getSession();
			String email = (String) session.getAttribute("email");
			String outletid = request.getParameter("outletid");
			OrderBean ob = new OrderBean();
			double totalprice = (double) session.getAttribute("totalbill");
			ob.setPrice(totalprice);
			ob.setCustomerid(email);
			ob.getObean().setOutletid(outletid);
			OutletBean ot1 = null;
			OrderBean ob2 = null;
			ArrayList<ItemBean> iList2 = null;
			HttpSession session1 = request.getSession();

			ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session.getAttribute("List");
			System.out.println("hiii hellooooooo" + iList.size());
			if (iList.size() > 0) {
				// iList2=iList;
				session.setAttribute("refreshlist", iList);
				
				
				
/*--------------------------------------------------PLACE ORDER(insert into order table)---------------------------------------------*/

				try {
					System.out.println("hiii" + iList.size());
					orderid = oimpl.addOrder(ob);
					session.setAttribute("orderid", orderid);
					// out.print(st);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
/*--------------------------------------------------PLACE ORDER(insert into order details table)---------------------------------------------*/

				if (orderid != null && iList.size() > 0) {
					out.print(orderid);

					request.setAttribute("outletbean", obean);
					if (oimpl.insertOrderDetail(iList, orderid)) {

						System.out.println("inside oimpl.insert");
						for (ItemBean ibean1 : iList) {
							if (ibean1.getBuyQuantity() < ibean1
									.getItemQuantity()) {
								ibean1.setItemQuantity((ibean1
										.getItemQuantity() - ibean1
										.getBuyQuantity()));
								try {
									iipl.updateItem(ibean1);
								} catch (ClassNotFoundException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}

							} else if (ibean1.getBuyQuantity() == ibean1
									.getItemQuantity()) {

								ibean1.setItemQuantity(0);
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
						// String outletid= request.getParameter("outletid");
						try {
							OutletBean outbean = os.viewbyoutletid(outletid);
							session.setAttribute("outletbean", outbean);
						} catch (ClassNotFoundException | SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

						try {
							OrderBean ob1 = oimpl.vieworder(orderid);
							ob2 = ob1;
							request.setAttribute("orderbean", ob1);

						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					disp = request.getRequestDispatcher("jsp/receipt.jsp");
					disp.forward(request, response);
					session1.removeAttribute("List");
					session1.removeAttribute("BuyQuan");
					int quan = 0;
					ArrayList<ItemBean> iList1 = new ArrayList<ItemBean>();
					session1.setAttribute("BuyQuan", quan);
					session.setAttribute("List", iList1);
					// session.setAttribute(arg0, arg1)

				}
			}
			
			
			
/*---------------------------------code to generate same receipt even after refreshing the page or pressing browser back button--------------------------------*/
			if (iList.size() == 0) {
				System.out.println("inside 0 size loop");
				iList2 = (ArrayList<ItemBean>) session.getAttribute("refreshlist");
				System.out.println("list2" + iList2.get(0).getItemName());
				try {
					String orderid2 = (String) session.getAttribute("orderid");
					System.out.println(orderid2);
					OrderBean ob3 = oimpl.vieworder(orderid2);
					request.setAttribute("orderbean", ob3);
					System.out.println(ob3.getOrderDate());
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// request.setAttribute("outletbean", obean);
				// System.out.println(obean.getCity());
				try {

					OutletBean outbean = os.viewbyoutletid(outletid);
					session.setAttribute("outletbean", outbean);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				session.setAttribute("ilist1", iList2);
				disp = request.getRequestDispatcher("jsp/receipt.jsp");
				disp.forward(request, response);
			}

			// out.print(iList.get(0).getPrice());
		}
/*--------------------------------------------------for customer to view order history----------------------------*/
		if (requestSource.equals("vieworders")) {

			ArrayList<OrderBean> myorders = new ArrayList<OrderBean>();
			// HttpSession session=request.getSession(true);
			String id = (String) session.getAttribute("email");
			// String id=(String) request.getAttribute("email");

			try {
				System.out.println(id);
				myorders = oimpl.vieworders(id);
				request.setAttribute("myorders", myorders);
				disp = request.getRequestDispatcher("jsp/myorders1.jsp");
				disp.forward(request, response);

			} catch (Exception e) {
				System.out.println(e);
			}
		}
/*--------------------------------------------------for customer to view order details----------------------------*/

		else if (requestSource.equals("vieworderdetails")) {

			String orderid = request.getParameter("orderid");
			ArrayList<OrderDetailsBean> orderdetails = new ArrayList<OrderDetailsBean>();
			try {
				// HttpSession session=request.getSession(true);
				orderdetails = oimpl.vieworderbyid(orderid);
				System.out.println("ok");
				request.setAttribute("particularorder", orderdetails);
				disp = request.getRequestDispatcher("jsp/orderdetails1.jsp");
				disp.forward(request, response);

			} catch (Exception e) {
				System.out.println(e);
			}
		}
/*--------------------------------------------------for customer to cancel orders which are eligible before 6 hours after placing order----------------------------*/

		else if (requestSource.equals("cancelorderdetails")) {
			OrderBean myorder;
			ArrayList<OrderDetailsBean> orderdetails1 = new ArrayList<OrderDetailsBean>();
			String orderid = request.getParameter("orderid");

			boolean flag = false;
			Date d2 = null;
			Date d1 = new java.util.Date();

			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");

			try {
				myorder = oimpl.vieworder(orderid);
				String orderDate = myorder.getOrderDate();

				d2 = format.parse(orderDate);

				long diff = d1.getTime() - d2.getTime();
				long diffSeconds = diff / 1000 % 60;
				long diffMinutes = diff / (60 * 1000) % 60;
				long diffHours = diff / (60 * 60 * 1000) % 24;
				long diffDays = diff / (24 * 60 * 60 * 1000);

				if (diffDays < 1) {
					if (diffHours <= 5 & diffMinutes <= 59 & diffSeconds <= 59) {

						flag = true;
					}
				}
				if (flag) {
					orderdetails1 = oimpl.cancelorder(orderid);
					request.setAttribute("cancellable", orderdetails1);
					disp = request
							.getRequestDispatcher("jsp/cancellabledetails1.jsp");
					disp.forward(request, response);

				} else {
					// out.println("cant be done");

					request.setAttribute("date", d2);
					disp = request.getRequestDispatcher("jsp/CanNotCancel.jsp");
					disp.forward(request, response);

				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}

		else if (requestSource.equals("cancelItems")) {// out.print(requestSource);
			String[] cancellist = new String[100];
			cancellist = request.getParameterValues("cancel");
			// System.out.println(cancellist[0]);
			ArrayList<String> cancellist1 = new ArrayList<String>();
			for (int i = 0; i < cancellist.length; i++) {

				cancellist1.add(cancellist[i]);
				System.out.println(cancellist1.get(i));
			}

			try {
				oimpl.cancelfinal(cancellist1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (requestSource.equals("cancel")) {
			String orderdetailid = request.getParameter("orderdetailid");
			try {
				oimpl.cancel(orderdetailid);
				session.setAttribute("success", "your order" + orderdetailid
						+ "is successfully cancelled");
				response.sendRedirect("jsp/customersuccess.jsp");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
