<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>  
   <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >
<!-- Custom Theme files -->
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/additem.js"></script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<%@ include file="adminsideheader.jsp"%>
	
	<div class="main">
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
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix">
				 
				<h3 align="center"> Add new items here</h3>
				 

<p align="right">
						 <label style="color: red">All fields are mandatory</label>
						
					</p>

<form name="form" action="<%=request.getContextPath()%>/ItemController" onsubmit="return (Submit())">
<%ArrayList<DepartmentBean> oList = (ArrayList<DepartmentBean>) request.getAttribute("departmentlist");

HashSet<String> hsetDepartmentname = new HashSet<String>();
%>
<input type="hidden" name="source" value="registeritem" >

<table width="100%">



<tr  style="margin-top: 10px">
<td style="width: 30%">Item Name:</td>
<td style="width: 70%"><input type="text" name="itemname" onblur="checkItemName()"><span STYLE="color: red" ID="itemname_error"></span></td><tr>

<tr><td>&nbsp;</td></tr>
<tr><td  style="width: 30%">Price(in Rs.):</td>
<td style="width: 70%"> <input type="text" name="price" id="price" onblur="checkItemPrice()"><span STYLE="color: red" ID="itemprice_error"></span></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td style="width: 30%">Quantity:</td>
<td style="width: 70%"> <input type="text" name="quantity" onblur="checkItemQuantity()">
<span STYLE="color: red" ID="itemquantity_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td style="width: 30%">Flavor:</td>
<td style="width: 70%"> <input type="text" name="flavor" onblur="checkItemFlavor()"><span STYLE="color: red" ID="itemflavor_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td style="width: 30%">Cancellation status: </td>
<td style="width: 70%"><select name="cancellationstatus" onblur="checkItemStatus()">
<option value="-1">Select</option>
<option>YES</option>
<option>NO</option>
</select><span STYLE="color: red" ID="itemstatus_error"></span></td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr><td style="width: 30%">Availability status:  </td>
<td style="width: 70%"><select name="availabilitystatus"  onblur="checkItemAvailStatus()">
<option value="-1">Select</option>
<option>AVAILABLE</option>
<option>NOTAVAILABLE</option>
</select><span STYLE="color: red" ID="itemavailstatus_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td style="width: 30%">Portrait Photo:</label></td>
<td style="width: 70%"><input type="file" name="image" size="50" onclick="checkFile()" ><span STYLE="color: red" ID="itemavailstatus_error"></span></td></tr>
<tr><td>&nbsp;</td></tr>
<tr>
<td style="width: 30%">Department name</label></td>
	<td style="width: 70%"><select name="dname1"  onblur="checkDept()">
												<option value="-1">--Select--</option>
												<%
													for (DepartmentBean ob : oList) {
														hsetDepartmentname.add(ob.getDepartmentname());
													}
												%>
												<%
													for (String s : hsetDepartmentname) {
												%>
												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><span STYLE="color: red" ID="dname1_error"></span></td>
				<tr><td colspan="3">&nbsp</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr><td colspan="3" align="center"><input class="btn btn-warning" type="submit" value="Add Item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" class="btn btn-warning" value="Reset" onclick="location.reload()"></td></tr>


</table>
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