<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
	<%@ include file="customersideheader.jsp"%>
    <div class="main">
		<div class="container">
		   <div class="banner">
			 <img src="images/banner1.jpg" class="img-responsive" alt=""/>
		   </div>
		   <div class="row content">
		   	<div class="col-md-3 content_top">
		   	    <div class="category_box">
		   	  	<h3 class="cate_head">Departments</h3>
		   	  	<%DepartmentBean dbean= new DepartmentBean(); 
		   	  	DepartmentImpl dimpl= new DepartmentImpl();
						ArrayList<DepartmentBean> dList = dimpl.viewalldepartments();
		   	  	
		   	  	%>
		   	  	
		   	     <ul class="category">
		   	    <%  for(DepartmentBean dbean1 : dList){%>
		   	    <% if(dbean1.getStatus().equalsIgnoreCase("Available")){ %>
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitemscustomer&&deptname=<%=dbean1.getDepartmentname()%>"><%=dbean1.getDepartmentname()%></a></li>
			   	  	
			   	  	<%}} %>
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	 <h3><i class="arrow"> </i><span>Item Details</span></h3>
		   	   </ul>
				 <ul class="feature_grid">	   	
				 <div class="clearfix" >
					<%
ItemBean itemBean=(ItemBean)request.getAttribute("item");
						String imgPath=itemBean.getItemImage();
						System.out.print(itemBean.getItemId());
%>
<form action="<%=request.getContextPath() %>/CartController" >
<input type="hidden" name="itemid" value=<%=itemBean.getItemId() %>>




<div style="width:48%;float: left">
<table>
<tr><td>Item Name: </td>

<td><%=itemBean.getItemName() %><br></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Price(&#8377;):</td>
<td><%=itemBean.getItemPrice() %><br></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Flavor:</td>
<td><%=itemBean.getItemFlavor() %><br></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Cancellation status<label style="text-align: right;color: red">*</label>:</td>
<td><%=itemBean.getCancellationStatus() %><br></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Availability Status:</td>
<td><%=itemBean.getAvailabilityStatus()%><br></td></tr>
<tr><td>&nbsp;</td></tr>
</table>
</div>


<div style="width:50%;float: right">

<img alt="<%=itemBean.getItemName() %>" style="height:200px;width:200px;" 
src="<%= request.getContextPath()%>/itemimages/<%=imgPath%>">
</div>


<label style="text-align: right;color: red">*Cancellation status shows whether the item can be cancelled or not.<br>Cancellation can be done only before six hours after placing the order. </label>
<br><br>
<%Integer quan=(Integer)session.getAttribute("BuyQuan");  %>
<%if(itemBean.getAvailabilityStatus().equalsIgnoreCase("available")& itemBean.getItemQuantity()!=0&(itemBean.getItemQuantity()- quan>0)){ %>
<center><span><input type="submit" class="myButton" value="Add To Cart"></span></center>
<%} else{%>
<center>
	<h3 style="color: #FE6847">Item out of stock.</h3>
<span><a href="<%=request.getContextPath() %>/CartController?source=backfromcustomerviewbyid"><input type="button" class="myButton" value="Back"></a></span></center>
<%} %>
<input type="hidden" name="source" value="buy">

</form>

		</ul>
</div>					
</div>

		</ul>
		    </div>
		   </div>
		   </div>
		   </div>
		   
		<%@ include file="footer.jsp"%>
</body>
</html></html>