<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet" type="text/css" >


<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="../js/sample1.js">

</script>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
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
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customeroutletsearch">LOCATE OUTLET</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/contactus.jsp">CONTACT US</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/help.jsp">HELP</a></li>
		       
		          </ul>
		          <ul class="login">
		          	<a href="<%=request.getContextPath() %>/jsp/account.jsp"><li class="login_top"><i class="sign"> </i><span>Sign In</span></li></a>
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
	</div>
    <div class="main" style="height:450px">
		<div class="container">
		  <div class="Product_top">
		  
		      <div class="col-md-9" style="width:900px">
		   	  <div class="breadcrumb">
				<a>Home</a>  
				&gt;&gt;  <span class="last">Account/Login</span>
	          </div>
	          <div class="account_grid">
			   <div class="col-md-6 login-left" style="width:400px">
			  	 <h3>NEW CUSTOMERS</h3>
				 <p style="text-align: justify;">By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
				 <a class="acount-btn" href="<%=request.getContextPath() %>/jsp/register.jsp">Create an Account</a>&nbsp;
				  <a class="acount-btn" href="<%=request.getContextPath() %>/jsp/indexItem.jsp">Continue As Guest</a>
			   </div>
			   <div class="col-md-6 login-right" style="margin-left:35px" >
			  	<h3>REGISTERED CUSTOMERS</h3>
				<p>If you have an account with us, please log in.</p>
				<p style="color: #FE6847 "><b>Invalid Login/Password</b></p>
				<form action="<%=request.getContextPath() %>/LoginController">
				<input type="hidden" name="source" value="login">
				  <div>
					<span>Email ID<label>*</label></span>
					<input type="text" name="id"> 
				  </div>
				  <div>
					<span>Password<label>*</label></span>
					<input type="password" name="pwd" style="width:388px;height:40px"> 
				  </div>
				  <a class="forgot" href="#">Forgot Your Password?</a>
				  <input type="submit" value="Login">
				 
			    </form>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>	
		   </div>
	    </div>
	  </div>
	  </div>
	
<%@ include file="footer.jsp"%>
</body>
</html>
