<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tcs.ilp.ors.bean.OutletBean"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />

<script type="text/javascript" src="sample1.js"></script>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
<script type="text/javascript" src="../js/sample1.js">
	
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
		<div class="container" style="height: 1000px"><br><br><center>
          <div id="cart" align="center" style=" width: 600px; border: 2px solid; background-color: #FFFFCC">
          
				
				
					<%
						ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session.getAttribute("List");
					%>
					<%OutletBean ob = (OutletBean)request.getAttribute("outletbean"); %>
                
                  	<h3 style="color: #FE6847"><b>Order Summary<b></h3>
					<table border="2px" class="table table-bordered">
					<tr><td colspan="6"><h3 style="color: #FE6847">Item Summary</h3></td></tr>
						<tr><th>Item Name</th>
						<th>Item Id</th>
						<th>Item price(&#8377)</th>
						<th>Item quantity</th>
						<th colspan="2">Price(&#8377)</th></tr>
						<%
							for (ItemBean ib : iList) {
						%>
						

						<tr>
							<td><%=ib.getItemName()%></td>
							<td><%=ib.getItemId()%></td>
							<td><%=ib.getItemPrice()%></td>
							<td><%=ib.getBuyQuantity()%></td>
							<td><%=ib.getItemPrice() * ib.getBuyQuantity()%></td>
							
						</tr>
						   <%
							}
						%>
						<tr>
							<td colspan="4" align="center" style="color: #FE6847">Your Total bill</td>
							<td colspan="2"><%=session.getAttribute("totalbill")%></td>
						</tr>
										<tr><td colspan="6"><h3 style="color: #FE6847">Outlet Summary</h3></td></tr>
										<tr><th>Outlet Id</th>
						<th>Outlet Name</th>
						<th>City</th>
						<th>State</th>
						<th colspan="2">ZipCode</th></tr>
					           <tr><td><%=ob.getOutletid() %></td><td><%=ob.getOutletname() %></td><td><%=ob.getCity() %><td><%=ob.getState() %><td><%=ob.getZipcode() %></td></tr>
						
					
					<tr><td colspan="6" align="center" style="border: none;"><a href="<%=request.getContextPath() %>/CustomerController?source=ordersummary&outletid=<%=ob.getOutletid() %>"><input type="button" class= "myButton" value="Pay Now"></a></td></tr>
				</table><br><br>
          
          
          
          
          
          
          
		
				<div class="clearfix"></div>

			</form>
			</center>
		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>

    