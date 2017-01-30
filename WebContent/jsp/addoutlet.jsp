<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<script type="text/javascript" src="../js/validation.js"></script>

<link href="<%= request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="<%= request.getContextPath() %>/css/bootstrap1.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%= request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+-2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
 
<%@ include file="adminsideheader.jsp"%>

	<div class="main" style="height:450px">
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
				 <div class="clearfix">
		   	  
<form name="form" action="<%=request.getContextPath()%>/OutletController" method="get"  onsubmit="return Submit()">


<% 
String msg=(String)session.getAttribute("msg");
if(msg.equals(""))
{
%>
<center>
	<font color="red" size="4">Name already exists.</font></center>
	<%
}
%>
<h3>Add Outlet</h3>

<input type="hidden" name="source" value="registeroutlet">
<table height="250px">
<tr>
<td colspan="2">Outlet Id</td>
<td><input type="text" name="outletid" onblur="checkfname()" disabled></input></td>
</tr>
<tr>
<td colspan="2">Outlet Name</td>
<td><input type="text" name="outletname" onblur="checkfname()"></input></td>
<td><span STYLE="color: red" ID="fname_error"></span></td>
</tr>
<tr>
<td colspan="2">City</td>
<td><input type="text" name="city" onblur="checkcity()"></input></td>
<td><span STYLE="color: red" ID="city_error"></span></td>
</tr>
<tr>
<td colspan="2">State</td>
<td><input type="text" name="state" onblur="checkstate()"></input></td>
<td><span STYLE="color: red" ID="state_error"></span></td>
</tr>
<tr>
<td colspan="2">Zipcode</td>
<td><input type="text" name="zipcode" onblur="checkzip()"></input></td>
<td><span STYLE="color: red" ID="zip_error"></span></td>
</tr>
<tr>
<td colspan="2">Status</td>
<td><select name="status" onblur="checkstatus()">
<option value="select" Selected>Select</option>
<option value="AVAILABLE">Available</option>
<option value="NOT_AVAILABLE">Not Available</option>
</select></td>
<td><span STYLE="color: red" ID="status_error"></span></td>
</tr>
<tr>
<td><input type="submit" class="btn btn-warning" value="Add"></td>
<td>&nbsp;</td>
<td><input type="reset"  class="btn btn-warning" value="Reset" onclick="location.reload()"></td></tr>
</table>
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