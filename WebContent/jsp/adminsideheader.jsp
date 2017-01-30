<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<div class="header" style="height:200px">
		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right" style="float:right;text-align: right">
			
		
		 <a class="acount-btn" href="<%=request.getContextPath() %>/LoginController?source=adminlogout"><span>Log Out</span></a>
			 
			 		  
			
		
			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="<%=request.getContextPath() %>/jsp/adminhome.jsp"><img src="images/logo4.png" alt="" width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="index.html"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
			  <br><div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			    </div>
				<!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="width:800px">
			       <ul class="nav navbar-nav menu1"> 
			        <li class="active"><a href="<%=request.getContextPath() %>/ProfileController?source=viewcustomers">MANAGE CUSTOMERS</a></li>
			      	<li class="active"><a href="<%=request.getContextPath() %>/ItemController?source=viewallitems">MANAGE ITEMS</a><br></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/DepartmentController?source=viewalldepartments">MANAGE DEPARTMENTS</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/OutletController?source=viewalloutlets">MANAGE OUTLETS</a></li>
			     	          </ul>
		          
			      <div class="clearfix"></div>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
            <div class="clearfix"></div>
           </div>
           
		 </div>  
		</div>
	</div>

</body>
</html>