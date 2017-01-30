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
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="../css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/help.js"></script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>	
	<%@include file="customersideheader.jsp"%>	
	
	<%-- <div class="header" style="height:200px">
		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right">
		
	
			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="<%=request.getContextPath() %>/jsp/index.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="index.jsp"><img src="images/logo.png" class="img-responsive" alt="logo"/></a></h3>
			 <br> <div class="container-fluid">
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
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav menu1">
			      	<li class="active"><a href="<%=request.getContextPath() %>/jsp/indexItem.jsp">HOME</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customersearch">LOCATE OUTLET</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/contactus.jsp">CONTACT US</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/help.jsp">HELP</a></li>
			       
			       
		          </ul>
		          <ul class="login">
		          	<a href="account.jsp"><li class="login_top"><i class="sign"> </i><span>Sign In</span></li></a>
		            <a href="<%=request.getContextPath() %>/ProfileController?source=viewRegisterPage" ><li class="login_bottom"><i class="register"> </i><span>Register</span></li></a>
		          </ul>
			      <div class="clearfix"></div>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
            <div class="clearfix"></div>
           </div>
           
		 </div>  
		</div>
	</div> --%>
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
		       <ul class="feature_grid">
		   	  <div class="breadcrumb">
				<a>Home</a>  
				&gt;&gt;  <span class="last">Help</span>
	          </div>
	          <div class="contact-form">
				    <p align="left">
						Fields marked with asterisk( <label style="color: red">*</label>
						)are mandatory
					</p>
					    <form name="helpform" method="get" action="<%=request.getContextPath()%>/ProfileController" onsubmit="return Submit()">
					    <input type="hidden" name="source" value="help">
					    	<div>
						    	<span><label>Name<sup class="red" style="font-size:15px">*</sup></label></span>
						    	<span><input name="userName" type="text" class="textbox" onblur="checkfname()"></span>
						    	<span STYLE="color: red" ID="fname_error"></span>
						    </div>
						    <div>
						    	<span><label>E-Mail<sup class="red" style="font-size:15px">*</sup></label></span>
						    	<span><input name="userEmail" type="text" class="textbox" onblur="checkemail()"></span>
						    	<span STYLE="color: red" ID="email_error"></span>
						    </div>
						    <div>
						     	<span><label>Subject<sup class="red" style="font-size:15px">*</sup></label></span>
						    	<span><input name="userSub" type="text" class="textbox" onblur="checksub()"></span>
						    	<span STYLE="color: red" ID="sub_error"></span>
						    </div>
						    <div>
						    	<span><label>Message</label></span>
						    	<span><textarea name="userMsg"></textarea></span>
						    
						    </div>
						   <div>
						   		<span><input type="submit" value="Submit" onclick="return Submit()"></span>
						  </div>
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

