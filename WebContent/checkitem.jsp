<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>
<body>
	<div class="header">
		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right">
			<ul class="account">
				<li><a href="viewprofile.jsp">My Account</a></li>
			</ul>
			<ul class="shopping_cart">
			   <a href="#"><li class="shop_left"><i class="cart"> </i><span>Shop</span></li></a>
			   <a href="#"><li class="shop_right"><span>$0.00</span></li></a>
			   <div class="clearfix"> </div>
			  
			</ul>
		
			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="jsp/index.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="index.html"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
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
			      	<li class="active"><a href="index.jsp">HOME</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customersearch">LOCATE OUTLET</a></li>
			        <li class="active"><a href="products.html">CONTACT US</a></li>
			        <li class="active"><a href="store.html">HELP</a></li>
			       
		          </ul>
		          <ul class="login">
		          	<a href="account.html"><li class="login_top"><i class="sign"> </i><span>Sign In</span></li></a>
		            <a href="register.html"><li class="login_bottom"><i class="register"> </i><span>Register</span></li></a>
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
		   <div class="banner">
			 <img src="images/banner1.jpg" class="img-responsive" alt=""/>
		   </div>
		   <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Departments</h3>
		   	     <ul class="category">
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitemscustomer">Bakery</a></li>
			   	  	<li><a href="#">Sea Foods</a></li>
			   	  	<li><a href="#">Deli</a></li>
			   	  	<li><a href="#">Flowers</a></li>
			   	  	<li><a href="#">Wine Items</a></li>
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	   <ul class="product_reviews">
		   	   	 <h3><i class="arrow"> </i><span>Payment Methods</span></h3>
		   	   	 <img src="images/payment.png" class="img-responsive" alt=""/>
		   	   </ul>
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	 <h3><i class="arrow"> </i><span>Our Specialities</span></h3>
		   	   </ul>
				 <ul class="feature_grid">	   	
				 <div class="clearfix" >
					
<form action="<%=request.getContextPath() %>/CartController" >
<center>
<table >

<%
ItemBean itemBean=(ItemBean)request.getAttribute("item");String imgPath=itemBean.getItemImage();
%>
<tr>
<td colspan="2" align="center"><img alt="<%=itemBean.getItemName() %>" style="height:200px;width:400px;" 
src="<%= request.getContextPath()%>/itemimages/<%=imgPath%>"></td></tr>
<tr><td><span style="color: #FE6847">Item id:</span><%=itemBean.getItemId() %><br></td>
<td><span style="color: #FE6847">Item Name:</span><%=itemBean.getItemName() %><br></td></tr>
<tr><td><span style="color: #FE6847">Price:</span><%=itemBean.getItemPrice() %><br></td>
<td><span style="color: #FE6847">Availability Status:</span><%=itemBean.getAvailabilityStatus()%><br></td></tr>
<tr><td><span style="color: #FE6847">Flavor:</span><%=itemBean.getItemFlavor() %><br></td>
<td><span style="color: #FE6847">Cancellation status:</span><%=itemBean.getCancellationStatus() %><br></td>
</tr>
<tr><td colspan="2" align="center"><input type="submit" class="myButton" value="ADD TO CART"></td></tr>
</table>
</center>


<input type="hidden" name="source" value="buy">

</form>
					
</div>
		</ul>
		    </div>
		   </div>
		   </div>
		   </div>
		   
		   
				<div class="footer">
		<div class="container">
			<div class="footer-grid footer-grid1">
			  <h3 class="m_2">Company</h3>
			  <ul class="list1">
			  	<li><a href="#">Home</a></li>
			    <li><a href="#">About Us</a></li>
			   
			    <li><a href="#">Login</a></li>
			
			  </ul>
		   </div>
		   
		   <div class="footer-grid footer-grid3">
			  <h3 class="m_2">Information</h3>
			  <ul class="list1">
			  	<li><a href="#">My Account</a></li>
			   
			    <li><a href="#">Terms & Conditions</a></li>
			    <li><a href="#">Buying Guide</a></li>
			    <li><a href="#">FAQ</a></li>
			  </ul>
		   </div>
		  
		   <div class="footer-grid footer-grid_last">
	          <ul class="secure">
			  	<li class="secure_img"><img src="images/secure.png" alt=""/></li> 
			  	
			  	<div class="clearfix"> </div>
			  </ul>
			  <ul class="secure">
			  	<li class="secure_img"><img src="images/order.png" alt=""/></li> 
			  
			  	<div class="clearfix"> </div>
			 </ul>
		   </div>
		   <div class="clearfix"> </div>
		   <div class="copy">
		    <p>&copy; 2014 Website by <a href="#" target="_blank"> Bon Appetit concern</a></p>
		</div>
	   </div>
	</div>
</body>
</html>