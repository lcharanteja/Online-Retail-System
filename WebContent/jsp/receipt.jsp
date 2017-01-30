<%@page import="com.tcs.ilp.ors.bean.OrderBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tcs.ilp.ors.bean.OutletBean"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap1.css" rel='stylesheet' type='text/css' />

<script type="text/javascript" src="sample1.js"></script>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sample1.js">
	
</script>
<link
	href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
	<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
	<%@ include file="customersideheader.jsp"%>
	<div class="main">
		<div class="container">
		<center><h3 style="color: #FE6847"><b>Receipt<b></h3></center>
          <div id="cart" name= "cart" align="center" style=" min-height: 400px;background-color:#F5FFFA">
				<% OrderBean obean=(OrderBean)request.getAttribute("orderbean"); %>
				<form action="#" name="form">
					<%
						ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session.getAttribute("List");
					%>
					<%OutletBean ob = (OutletBean)session.getAttribute("outletbean"); %>
                <%SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); %>
                <%String orderDate=obean.getOrderDate(); %>
                <% Date d2 = format.parse(orderDate) ;%>
                  	
					<table border="2px" class="table table-bordered">
					<tr><td colspan="5" align="center"><h2 style="color: #FE6847"><img src="images/logo4.png" alt=""/ width = 80px height = 80px> Bon Appetit</h2></td></tr>
                    <tr><td colspan="5">&nbsp;</td></tr>
					    <tr><td><span style="color: #FE6847">Customer EmailId:</span><%=session.getAttribute("email") %></td><td><span style="color: #FE6847">Orderid:</span><%= obean.getOrderid()%></td><td colspan="2"><span style="color: #FE6847">OrderDate:</span><%=d2 %></td></tr>
					<%if(iList.size()>0) {%>
					<tr><td colspan="5"><h3 style="color: #FE6847">Item Summary</h3></td></tr>
						<tr><th>Item Name</th>
						
						<th>Item price(&#8377)</th>
						<th>Item quantity</th>
						<th >Price(&#8377) </th></tr>
						<%
							for (ItemBean ib : iList) {
						%>
						

						<tr>
							<td><%=ib.getItemName()%></td>
							
							<td><%=ib.getItemPrice()%></td>
							<td><%=ib.getBuyQuantity()%></td>
							<td><%=ib.getItemPrice() * ib.getBuyQuantity()%></td>
							
						</tr>
						   <%
							}}else{
						%>
						<%
						ArrayList<ItemBean> freshlist = (ArrayList<ItemBean>) session.getAttribute("ilist1");
					%>
					<tr><td colspan="5"><h3 style="color: #FE6847">Item Summary</h3></td></tr>
						<tr><th>Item Name</th>
						
						<th>Item price(&#8377)</th>
						<th>Item quantity</th>
						<th >Price(&#8377) </th></tr>
						<%
							for (ItemBean ib : freshlist) {
						%>
						

						<tr>
							<td><%=ib.getItemName()%></td>
							
							<td><%=ib.getItemPrice()%></td>
							<td><%=ib.getBuyQuantity()%></td>
							<td><%=ib.getItemPrice() * ib.getBuyQuantity()%></td>
							
						</tr>
					
					
					<%} }%>
						<tr>
							<td colspan="3" align="center" style="color: #FE6847">Your Total bill</td>
							<td colspan="2"><%=session.getAttribute("totalbill")%></td>
						</tr>
										<tr><td colspan="6"><h3 style="color: #FE6847">Outlet Summary</h3></td></tr>
										
						<th>Outlet Name</th>
						<th>City</th>
						<th>State</th>
						<th colspan="2">ZipCode</th></tr>
					           <tr><td><%=ob.getOutletname() %></td><td><%=ob.getCity() %><td><%=ob.getState() %><td><%=ob.getZipcode() %></td></tr>
						
					
					<%-- <tr><td colspan="6" align="center" style="border: none;"><a href="<%=request.getContextPath() %>/CustomerController?source=ordersummary&outletid=<%=ob.getOutletid() %>"><input type="button" class= "myButton" value="Pay Now"></a></td></tr>
				 --%></table>
          
          
          




</form>
          
          
          
          </div>
          
		<center><input type="button"  style="width: 120px"  class="myButton" id="xyz" value="Print Receipt" onClick="printPage('cart')"></center>
				<div class="clearfix"></div>

			</form>
		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>

    