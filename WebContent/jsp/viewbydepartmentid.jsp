<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/departmentval.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
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
			   	  	<li><a href="<%=request.getContextPath() %>/DepartmentController?source=adddepartment">Add Department</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/DepartmentController?source=viewalldepartments">View All Departments</a></li>
			   	  	  	
		   	     </ul>
		   	   </div>		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid" style="height:300px">	   	
				 <div class="clearfix" >
<h3>View Department</h3>
<br>
<form name="form1" action="<%=request.getContextPath() %>/DepartmentController" onsubmit="return Submit()" >
<%
DepartmentBean ob=(DepartmentBean)request.getAttribute("department");

%>
<table style="height:200px">
<tr>
<td>Department Id:</td>
<td><input type="text" name="departmentid" value=<%= ob.getDepartmentid() %> readonly onclick="return alert('You cannot change this value')" ></td>
</tr>
<tr>
<td>Department Name:</td>
<td><input  type="text" name="departmentname" onblur="checkdname()" value="<%= ob.getDepartmentname()%>"></td>
<td><span STYLE="color: red" ID="dname_error"></span></td>
</tr>

<tr><td>Availability Status</td>
<td><select name="status" onblur="checkdstatus()">
<option value="<%=ob.getStatus()%>" selected="selected"><%=ob.getStatus()%></option>
<%if(ob.getStatus().equalsIgnoreCase("available")) {%>
<option value="NOT_AVAILABLE">NOT_AVAILABLE</option>
<%} else if(ob.getStatus().equalsIgnoreCase("NOT_AVAILABLE")) {%>
 

<option value="AVAILABLE">AVAILABLE</option>
<%} %></select>




<td><span STYLE="color: red" ID="dstatus_error"></span></td></tr>
<tr><td style="text-align:center"><input class="btn btn-warning"  type="submit" value="Update" onclick= "return confirm('Are you sure you want to update the details?')" >
<input class="btn btn-warning"  type="reset" value="Reset" onclick="location.reload()"></td>
<td>&nbsp;<a class="btn btn-warning"  href="<%=request.getContextPath() %>/DepartmentController?source=additemtodepartment&&departmentid=<%=ob.getDepartmentid()%>">Add Item </a></td></tr>


</table>
<input type="hidden" name="departmentid" value="<%=ob.getDepartmentid()%>">
<input type="hidden" name="source" value="updatedepartment">
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