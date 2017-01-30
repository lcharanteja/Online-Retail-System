<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit Company- Online Retail Shopping</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="js/sample1.js" ></script>

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="../js/sample1.js">

</script>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>
<body>
		<div class="header" style="height:205px">
		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right">
			<ul class="account">
				<li><a href="<%=request.getContextPath() %>/ProfileController?source=viewprofile">My Account</a></li>
			</ul>
			<ul class="shopping_cart">
			   <a href="<%=request.getContextPath() %>/jsp/cart.jsp"><li class="shop_left"><i class="cart"> </i><span>Shop</span></li></a>
			   <a href="#"><li class="shop_right"><span><%double total_bill1=0;
						ArrayList<ItemBean> iList1 = (ArrayList<ItemBean>) session.getAttribute("List");
						if(iList1!=null){
						for (ItemBean ib : iList1) {
				
						total_bill1 = total_bill1 + ib.getItemPrice() * ib.getItemQuantity();
						}}
						%><%=total_bill1%>&#8377</span></li></a>
			   <div class="clearfix"> </div>
			  
			</ul>

			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="indexItem.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="indexItem.jsp"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
			  <div class="container-fluid">
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
			      	<li class="active"><a href="indexItem.jsp">HOME</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customersearch">LOCATE OUTLET</a></li>
			        <li class="active"><a href="contactus.jsp">CONTACT US</a></li>
			        <li class="active"><a href="help.jsp">HELP</a></li>
			       
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
	</div>
    <div class="main">
		<div class="container">
		  <div class="Product_top">
		  	  			<form name="form" action="<%=request.getContextPath() %>/ProfileController">
 <input type="hidden" name="source" value="register">
				<table id="xyz" >

					<tr>
						<td colspan="2">

							<h3 style="color: #6B6B6B">PERSONAL INFORMATION</h3>
						</td>
					</tr>

					<p align="right">
						Fields marked with asterisk( <label style="color: red">*</label>
						)are mandatory
					</p>


					<tr style="margin-top: 10px">
						<td>First Name<label style="color: red">*</label></td>
						<td><input type="text" name="firstname" required></td>
						<td><span STYLE="color: red" ID="fname_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr style="margin-top: 10px">
						<td>Middle Name<label style="color: red">*</label></td>
						<td><input type="text" name="middlename" required></td>
						<td><span STYLE="color: red" ID="fname_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>
					<tr>
						<td>Last Name<label style="color: red">*</label></td>
						<td><input type="text" name="lastname"></td>
						<td><span STYLE="color: red" ID="lname_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Email Address<label style="color: red">*</label></td>
						<td><input type="text" name="email"></td>
						<td><SPAN STYLE="color: red" ID="email_error"></SPAN></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Gender<label style="color: red">*</label></td>
						<td><input type="radio" value='male' name="sex">Male<br> <input
							type="radio" value='female' name="sex">Female</td>
						<td><span STYLE="color: red" ID="radio_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Mobile no<label style="color: red">*</label></td>
						<td><input type="text" name="phone"></td>
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
							<h3>LOGIN INFORMATION</h3>
						</td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Password<label style="color: red">*</label></td>
						<td><input type="text" name="pwd" required></td>
						<td><span STYLE="color: red" ID="pwd_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Confirm Password<label style="color: red">*</label></td>
						<td><input type="text" name="pwd"></td>
						<td><span STYLE="color: red" ID="pwd_error"></span></td>
					</tr>

					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td><input type="submit" value="Register"
							class="myButton" onclick="Submit()"></td><td><input type="reset" class="myButton" value="reset"></td>
					</tr>
				</table>
				
				<div class="clearfix"></div>

			</form>
					</div>
			</div>
	  </div>
	
  <%@ include file="footer.jsp"%>
	
</body>
</html>
