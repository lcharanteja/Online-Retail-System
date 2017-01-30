<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="com.tcs.ilp.ors.bean.OutletBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%= request.getContextPath() %>/js/validation.js"></script>
<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
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
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=addoutlet">Add Outlets</a></li>
			   	  		<li><a href="<%=request.getContextPath() %>/OutletController?source=adminsearch">Search Outlets</a></li>
			   	  	
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=viewalloutlets">View All Outlets</a></li>
			   	  	
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix" >
 <h3 style="text-align:center">OUTLET DETAILS</h3>

<p style="color:#A4A4A4;text-align: right">(all fields are mandatory)</p>
<form name="form" action="<%=request.getContextPath() %>/OutletController" onsubmit="return Submit()">

<table style="margin-left:50px" height="545px">

<%
OutletBean ob=(OutletBean)request.getAttribute("outlet");
						System.out.println("in view by id");
						System.out.println(ob.getOutletid());
%>


<tr><td>Outlet Id</td>
<td> <input type="text" name="outletid" value=<%=ob.getOutletid()%> readonly onclick="return alert('You cannot change this value')"></td></tr>
<tr><td>Outlet Name</td>
<td><input type="text" name="outletname"  onblur="checkfname()" value=<%=ob.getOutletname() %>></td>
<td><span STYLE="color: red" ID="fname_error"></span></td></tr>
<tr><td>Outlet City</td>
<td> <input type="text" name="city" onblur="checkcity()" value=<%=ob.getCity()%>></td>
<td><span STYLE="color: red" ID="city_error"></span></td></tr>
<tr><td>Outlet State</td>
<td><input type="text" name="state" onblur="checkstate()" value=<%=ob.getState() %>></td>
<td><span STYLE="color: red" ID="state_error"></span></td></tr>
<tr><td>Outlet Zipcode</td>
<td><input type="text" name="zipcode"  onblur="checkstate()" value=<%=ob.getZipcode()%>></td>
<td><span STYLE="color: red" ID="zip_error"></span></td></tr>
<tr><td>Availability Status</td>
<td><select name="status" onblur="checkstatus()">
<option value="<%=ob.getStatus()%>" selected="selected"><%=ob.getStatus()%></option>
<%if(ob.getStatus().equalsIgnoreCase("available")) {%>
<option value="NOT_AVAILABLE">NOT_AVAILABLE</option>
<%} else if(ob.getStatus().equalsIgnoreCase("NOT_AVAILABLE")) {%>
 

<option value="AVAILABLE">AVAILABLE</option>
<%} %></select>
<td><span STYLE="color: red" ID="status_error"></span></td></tr>
<tr>
<td style="text-align:left"><input class="btn btn-warning" type="submit" value="Update"></td>
<td style="text-align:right"><input class="btn btn-warning" type="reset" value="Reset" onclick="location.reload()"></td></tr>
<tr style="text-align:center"><td colspan="2" ><a class="btn btn-warning" href="<%=request.getContextPath() %>/OutletController?source=adddepartmenttooutlet&&outletid=<%=ob.getOutletid()%>">Add Department</a></td></tr>
<tr style="text-align:center"><td colspan="2"><a class="btn btn-warning" href="<%=request.getContextPath()%>/OutletController?source=viewdepartmentsinoutlet&&outletid=<%=ob.getOutletid()%>&&outletname=<%=ob.getOutletname()%>">View Departments</a></td></tr>

</table> 
<input type="hidden" name="source" value="updateoutlet">

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