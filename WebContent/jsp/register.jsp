<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="../js/sample1.js" ></script>

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
			

			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				&nbsp;<a href="<%=request.getContextPath() %>/jsp/indexItem.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="indexItem.jsp"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
			<br>  <div class="container-fluid">
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
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/help.jsp">HELP</a></li> </ul>
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
	</div>
	<div class="main">
		<div class="container">
		<ul class="feature_grid" style="margin-top: 10px">	   	
				 <div class="clearfix" >
          
			<form name="form" action="<%=request.getContextPath() %>/ProfileController" onsubmit="return Submit()">
 <input type="hidden" name="source" value="register">
				<table id="xyz" >

					<tr>
						<td colspan="2">

							<h3 style="color: #FE6847">PERSONAL INFORMATION</h3>
						</td>
					</tr>

					<p align="left">
						Fields marked with asterisk( <label style="color: red">*</label>
						)are mandatory
					</p>


					<tr style="margin-top: 10px">
						<td>First Name<label style="color: red">*</label></td>
						<td><input type="text" name="firstname" placeholder="Enter your FirstName" onblur="checkfname()"></td>
						<td><span STYLE="color: red" ID="fname_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
						<tr style="margin-top: 10px">
						<td>Middle Name<label style="color: red">*</label></td>
						<td><input type="text" name="middlename" placeholder="Enter your MiddleName" onblur="checkmname()"></td>
						<td><span STYLE="color: red" ID="mname_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<td>Last Name<label style="color: red">*</label></td>
						<td><input type="text" name="lastname" placeholder="Enter your LastName" onblur="checklname()"></td>
						<td><span STYLE="color: red" ID="lname_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Email Address<label style="color: red">*</label></td>
						<td><input type="text" name="email" placeholder="xyz@domain.com" onblur="checkemail()"></td>
						<td><SPAN STYLE="color: red" ID="email_error"></SPAN></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Gender<label style="color: red">*</label></td>
						<td><input type="radio" name="sex" value="Male" onmouseover="checkradio()">Male<br> 
						<input type="radio" name="sex" value="Female">Female</td>
						<td><span STYLE="color: red" ID="radio_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Mobile no<label style="color: red">*</label></td>
						<td><input type="text" name="phone" placeholder="Enter your MobileNumber" onblur="checkphone()"></td>
						<td><span STYLE="color: red" ID="phone_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Date of Birth<label style="color: red">*</label></td>
						<td><input type="Date" onblur="checkdate()" name="date"></td>
						<td><span STYLE="color: red" ID="date_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>




					<tr>
						<td colspan="2">
							<h3 style="color: #FE6847">LOGIN INFORMATION</h3>
						</td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Password<label style="color: red">*</label></td>
						<td><input type="password" name="password"  placeholder="Follow password policy" onblur="checkpwd()"></td>
						<td><a onclick="alert('Password should be  between 7 to 15 characters having at least one numeric digit and a special character.')"><i><u>Password Policy</u></i></a>&nbsp;&nbsp;<span STYLE="color: red" id="pwd_error"></span></td>
					</tr>
					<tr>
					                   
					
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Confirm Password<label style="color: red">*</label></td>
						<td><input type="password"  placeholder="Confirm password." name="conpassword" place onblur="checkconpwd()" ></td>
						<td><span STYLE="color: red" ID="conpwd_error"></span></td>
						
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td><input type="submit" value="Register" class="myButton" onclick="return confirm('Do you want to confirm registration?')"></td>
						<td><input type="reset" class="myButton" value="Reset" onclick="location.reload()"></td>
					</tr>
				</table>
				
				<div class="clearfix"></div>

			</form>
			</div>
			</ul>
		</div>
	</div>


<%@ include file="footer.jsp"%>

</body>
</html>
