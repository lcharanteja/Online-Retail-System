<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.OrderBean"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>
  <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
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
	<% ArrayList<OrderBean>  myorders=(ArrayList<OrderBean>)session.getAttribute("myorders"); %>
<table border=3px align="center">


<tr><th>Order ID</th>
     <th>Order Date</th>
     <th>Order Price</th>
     <th>Order Status</th>
     <th> Customer ID</th>
     <th> view</th>
     <th> cancel</th>
     </tr>
     <%for(OrderBean c:myorders) 
{
%>
     <tr><td><%=c.getOrderid()%></td>
     <td><%=c.getOrderDate() %></td>
     <td><%=c.getPrice() %></td>
     <td><%=c.getStatus() %></td>
     <td><%=c.getCustomerid()%></td>
     <td><a href="<%=request.getContextPath() %>/OrderController?source=vieworderdetails&&orderid=<%=c.getOrderid()%>">view order</a></td>
     <td><a href="<%=request.getContextPath() %>/OrderController?source=cancelorderdetails&&orderid=<%=c.getOrderid()%>">cancel order</a></td>
    </tr>
    

<%
}
%>
				</table>
				
			</div>

			</form>
		</div>
	</div>
	</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>
