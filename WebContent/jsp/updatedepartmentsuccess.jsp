<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="../js/validation.js"></script>
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
	
	<div class="main" style="height:410px;">
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
		   	      
			   <ul class="feature_grid" style="height:300px;">	   	
				 <div class="clearfix" style="margin-top:50px" >
		   	  
 <center>
				 <h3 style="color:green">DEPARTMENT UPDATED SUCCESSFULLY </h3>
				 
				 <br>
				 <input class="btn btn-warning" type="button" name="source" value="Home" onclick="location.href='adminhome.jsp';">
				 
				 </center>

</ul>
		
</div>
		
		    </div>
		   </div>
		   </div>
		  
		   
		   
		 <%@ include file="footer.jsp"%>
</body>
</html>