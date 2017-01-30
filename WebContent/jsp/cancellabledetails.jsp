<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.*"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="js/sample1.js" ></script>

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sample1.js">

</script>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>
<body>
	<%@ include file="customersideheader.jsp"%>
	<div class="main">
		<div class="container" style="height:500px">
          <form action="<%=request.getContextPath()%>/OrderController">
	<% ArrayList<OrderDetailsBean> orderdetails1=(ArrayList<OrderDetailsBean>)session.getAttribute("cancellable"); %>


<table>
<tr><td><input type="checkbox" onClick="for(c in document.getElementsByName('cancel')) document.getElementsByName('cancel').item(c).checked=this.checked"/>Select All</td></tr>
<tr><th>Order ID</th>
     <th>OrderDetaisID</th>
     <th>Item-Id</th>
     <th>Item-name</th>
     <th> Quantity</th>
     <th> Price</th>
     <th> select</th>
     </tr>
<% for(OrderDetailsBean c:orderdetails1) 
{
%>
<tr> 
<td><%=c.getOrderId() %></td>
<td><%=c.getOrderDetailId()%></td>
<td><%=c.getItemId() %></td>
<td><%=c.getItemName()%></td>
<td><%=c.getQuantity()%></td>
<td><%=c.getPrice()%></td>
<td><input type="checkbox" name="cancel" value=<%=c.getOrderDetailId()%>><%=c.getItemName()%></td>
</tr>
<%
}
%>
</table>
<input type="submit" name="source" value="cancelItems">
<input type="submit" name="source" value="return">
			
				
				<div class="clearfix"></div>

			</form>
		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>
