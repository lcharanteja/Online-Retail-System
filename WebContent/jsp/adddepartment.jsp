<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/dval.js"></script>
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
	
	<div class="main">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/DepartmentController?source=adddepartment">Add Departments</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/DepartmentController?source=viewalldepartments">View All Departments</a></li>
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	      
			   <ul class="feature_grid">	   	
				 <div class="clearfix" >
		   	  
<h2 align="center"><u>Add Department</u></h2>
<form name="form" action="<%=request.getContextPath()%>/DepartmentController" method="get" onsubmit="return Submit()">
<input type="hidden" name="source" value="registerdepartment">

<table height="100px" cellspacing="5px" cellpadding="5px">
<tr>
<td>Department Name</td>
<td><input type="text" name="departmentname" onblur="checkdname()"></input></td>
<td><span STYLE="color: red" ID="dname_error"></span></td>

</tr>

<tr>
<td>Status</td>
<td><select name="dstatus" onblur="checkdstatus()">
<option value="select" Selected>--Select--</option>
<option value="AVAILABLE">Available</option>
<option value="NOT AVAILABLE">Not Available</option>
</select></td>
<td><span STYLE="color: red" ID="dstatus_error"></span></td>
</tr>
<tr>
<td><input class="btn btn-warning" type="submit" value="Add"></td>
<td><input class="btn btn-warning"  type="reset" value="Reset"></td>
</tr>
</table>
<center>

</center>
</form>

</ul>
		
</div>
		
		    </div>
		   </div>
		   </div>
		  
 <%@ include file="footer.jsp"%>
</body>
</html>