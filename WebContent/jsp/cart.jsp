<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE HTML>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="sample1.js"></script>

<link href="<%=request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
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
		<div class="container">
		  <ul class="feature_grid" style="margin-top: 10px">	
		   <div class="clearfix">
			<div id="cart" align="center" style="min-height: 300px;background-color:#Ffffcc">
				
				
					<%
						ArrayList<ItemBean> iList = (ArrayList<ItemBean>) session.getAttribute("List");
					%>
					<%
						double total_bill = 0;
					%>
                  <% if(!iList.isEmpty() ){%>
                  	<h3 style="color: #FE6847">Your Cart</h3>
					<table border="2px" class="table table-bordered">
						<th>Item Name</th>
												<th>Item price(&#8377)</th>
						<th>Item quantity</th>
						<th colspan="2">Price (&#8377)</th>
						<%
							for (ItemBean ib : iList) {
						%>
						<%
							total_bill = total_bill + ib.getItemPrice() * ib.getBuyQuantity();
						%>

						<tr>
							<td><%=ib.getItemName()%></td>
							
							<td><%=ib.getItemPrice()%></td>
							<td><%=ib.getBuyQuantity()%></td>
							<td><%=ib.getItemPrice() * ib.getBuyQuantity()%></td>
							<td><a
								href="<%=request.getContextPath() %>/CartController?source=removeconfirm&itemid=<%=ib.getItemId()%>"><img
									src="<%=request.getContextPath() %>/images/rib.jpg" style="width: 20px; height: 20px"></a><a
								href="<%=request.getContextPath() %>/CartController?source=updatequan&itemid=<%=ib.getItemId()%>"><img
									src="<%=request.getContextPath() %>/images/Refresh.png" style="width: 20px; height: 20px"></a>



									</td>
						</tr>
						   <%
							}
						%>
					
						<tr>
							<td colspan="3" align="center" style="color: #FE6847">Your Total bill</td>
							<td colspan="2"><%=total_bill%></td>
						</tr>
					
					<%
						session.setAttribute("totalbill", total_bill);
					%>
					<tr><td colspan="5" align="center" style="border: none;"><a href="indexItem.jsp" >Buy More</a>&nbsp &nbsp &nbsp&nbsp &nbsp &nbsp<a
						href="<%=request.getContextPath() %>/CustomerController?source=customersearch">Pay Now</a></td></tr>
				</table>
				   <% }else{%>
				   
						<h3  style="color: #FE6847"> Your Cart is empty  </h3>
						<a href="index.jsp" >Buy Now</a>
						<%
						session.setAttribute("totalbill", total_bill);
					%>
						<%} %>
				
			</div>
			</ul>			
			</div>
			<div class="clearfix"></div>

			</form>
		</div>
	</div>

<%@ include file="footer.jsp"%>


</body>
</html>

