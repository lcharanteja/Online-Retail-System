<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/viewitem.js"></script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>



<%@ include file="adminsideheader.jsp"%>
	
	<div class="main" style="height:470px">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=additem">Add Items</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitems">View All Items</a></li>
			   	  	
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid" style="height:400px">	   	
				 <div class="clearfix" >


	<h3 align="center">View Item</h3>



<form name="form" action="<%=request.getContextPath() %>/ItemController" onsubmit="return Submit()" >
<div style="width:48%;float: left">
<table>
<%
ItemBean itemBean=(ItemBean)request.getAttribute("item");
						String imgPath=itemBean.getItemImage();
%>
<tr><td>Item Id:</td>

<td> <input type="text" name="itemid" value="<%=itemBean.getItemId()%>" readonly onclick="return alert('You cannot change this value')"><br></td>

<tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Item Name: </td>
<td><input type="text" name="itemname" value="<%=itemBean.getItemName()%>"></td>
<td><span STYLE="color: red" ID="itemname_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Price(&#8377;):</td>
<td><input type="text" name="price" value="<%=itemBean.getItemPrice()%>"></td>
<td><span STYLE="color: red" ID="itemprice_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Quantity:</td>
<td><input type="text" name="quantity" value="<%=itemBean.getItemQuantity()%>"></td>
<td><span STYLE="color: red" ID="itemquantity_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Flavor:</td>
<td><input type="text" name="flavor" value="<%=itemBean.getItemFlavor()%>"></td>
<td><span STYLE="color: red" ID="itemflavor_error"></span></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Cancellation Status</td>
<td><select name="cancellationStatus" onblur="itemstatus()">
<option value="<%=itemBean.getCancellationStatus()%>" selected="selected"><%=itemBean.getCancellationStatus()%></option>
<%if(itemBean.getCancellationStatus().equalsIgnoreCase("yes")) {%>
<option value="NO">NO</option>
<%} else if(itemBean.getCancellationStatus().equalsIgnoreCase("NO")) {%>
 

<option value="YES">YES</option>
<%} %></select>
<td><span STYLE="color: red" ID="itemavailstatus_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td>Availability Status</td>
<td><select name="availabilityStatus" onblur="checkstatus()">
<option value="<%=itemBean.getAvailabilityStatus()%>" selected="selected"><%=itemBean.getAvailabilityStatus()%></option>
<%if(itemBean.getAvailabilityStatus().equalsIgnoreCase("available")) {%>
<option value="NOTAVAILABLE">NOTAVAILABLE</option>
<%} else if(itemBean.getAvailabilityStatus().equalsIgnoreCase("NOTAVAILABLE")) {%>
 

<option value="AVAILABLE">AVAILABLE</option>
<%} %></select>
<td><span STYLE="color: red" ID="itemavailstatus_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>

</table>
<br><br>
<input type="submit" class="btn btn-warning"  onclick= "return confirm('Are you sure you want to update the details?')" value="Update">
<input type="reset" class="btn btn-warning" value="Reset" onclick="location.reload()">
<a class="btn btn-warning" href="<%=request.getContextPath() %>/ItemController?source=deleteitem&&itemid=<%=itemBean.getItemId()%>">Change Item Status</a><br>
<input type="hidden" name="source" value="updateitem">
</div>

<div style="width:50%;float:right">

<img alt="<%=itemBean.getItemName() %>" style="height:200px;width:200px;" src="<%=request.getContextPath() %>/itemimages/<%=imgPath%>"></td></tr>

</div>

<br>



</form>
</div>
		</ul>
		    </div>
		   </div>
		   </div>
		   </div>
<%@ include file="footer.jsp"%>
</body>
</html>