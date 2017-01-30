<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
        <%@ page import="java.util.ArrayList" %>
        
     <%@ page import="com.tcs.ilp.ors.bean.*" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
       <%@ page import="java.util.HashSet" %>
    
    
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
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
<script src="js/val.js"></script>
<script src="<%=request.getContextPath() %>/js/PaymentDDL.js"></script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>

<%@ include file="customersideheader.jsp"%>

	<%-- <div class="header">
		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right">
			<ul class="account">
				<li><a href="account.html">My Account</a></li>
			</ul>
			<ul class="shopping_cart">
			   <a href="cart.jsp"><li class="shop_left"><i class="cart"> </i><span>Shop</span></li></a>
			   <a href="#"><li class="shop_right"><span><%=session.getAttribute("totalbill")%><% if(session.getAttribute("totalbill")!=null){%>&#8377<%}%></span></li></a>
			   <div class="clearfix"> </div>
			  
			</ul>
		
			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="index.html"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
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
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitemscustomer"><%=dbean1.getDepartmentname()%></a></li>
			   	  	
			   	  	<%} %>
		   	     </ul>
		   	   </div>
		   	 
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	 <h3><i class="arrow"> </i><span>Please select outlet.</span></h3>
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix" style="height: 280px"> 
				 <% String email=(String)session.getAttribute("email"); %>
<form action="<%=request.getContextPath()%>/CustomerController" name="form" onsubmit="return valall('<%=email%>')">
								<input type="hidden" name="source" value="searchoutlet">
								<%
									ArrayList<OutletBean> oList = (ArrayList<OutletBean>) request.getAttribute("outletlist");
									HashSet<String> hsetOutletName = new HashSet<String>();
									HashSet<String> hsetOutletState = new HashSet<String>();
									HashSet<String> hsetOutletCity = new HashSet<String>();
									HashSet<Integer> hsetOutletZip = new HashSet<Integer>();
								%>
								
								<table align="center" >
								
								
								<%if(email==null) {%>
							    <tr><td colspan="4"><center><h3 style="color: #FE6847"><b>Please Enter your email</b></h3></center></td></tr>
							    <tr><td colspan="1">Enter your EmailId:</td><td colspan="3" style="padding-left: 35px"><input type="text" name= "email" onblur="checkmail(<%=(String)session.getAttribute("email")%>)">
							    <SPAN STYLE="color: red" ID="email_error">&nbsp;</SPAN></td>
								<%} %>
								<tr><td colspan="4">&nbsp;</td></tr>
								<tr><td colspan="4"><center><h3 style="color: #FE6847"><b>Please select an Outlet</b></h3></center></td></tr>
									<tr>
										<td><input type="radio" name="search" value="outletname"
											onclick="configureddl(this.value)">SEARCH BY NAME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
										<td><input type="radio" name="search" value="state"
											onclick="configureddl(this.value)">SEARCH BY STATE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
										<td><input type="radio" name="search" value="city"
											onclick="configureddl(this.value)">SEARCH BY CITY  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
										<td><input type="radio" name="search" value="zipcode"
											onclick="configureddl(this.value)">SEARCH BY ZIPCODE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
						 		
									<tr>
									</tr>
									<tr class="row1">
									<td colspan="4" style="padding-left: 200px"><div id= "outletname" style="display: none;"><h3 style="color: #FE6847">Select Outlet Name:</h3>
										<select name="searchname" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													int i = 0;
													for (OutletBean ob : oList) {
														hsetOutletName.add(ob.getOutletname());
													}
												%>
												<%
													for (String s : hsetOutletName) {
												%>
												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
                                       </select><SPAN STYLE="color: red" ID="outlet_error"></SPAN>
										<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SEARCH" class="myButton" ></input></div>

									

										<div id= "state" style="display: none;"><h3 style="color: #FE6847">Select Outlet State:</h3><select name="searchstate" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													for (OutletBean ob : oList) {
														hsetOutletState.add(ob.getState());
													}
												%>
												<%
													for (String s : hsetOutletState) {
												%>




												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><SPAN STYLE="color: red" ID="outlet_error1"></SPAN>
										<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SEARCH" class="myButton" ></input></div>


									<div id= "city" style="display: none;"><h3 style="color: #FE6847">Select Outlet City:</h3><select name="searchcity" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													for (OutletBean ob : oList) {
														hsetOutletCity.add(ob.getCity());
													}
												%>
												<%
													for (String s : hsetOutletCity) {
												%>




												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><SPAN STYLE="color: red" ID="outlet_error2"></SPAN>
										<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SEARCH" class="myButton" ></input></div>

										
										<div id= "zipcode" style="display: none;"><h3 style="color: #FE6847">Select Outlet ZipCode:</h3><select name="searchzip" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													for (OutletBean ob : oList) {
														hsetOutletZip.add(ob.getZipcode());
													}
												%>
												<%
													for (Integer s : hsetOutletZip) {
												%>




												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><SPAN STYLE="color: red" ID="outlet_error3"></SPAN>
										<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="SEARCH" class="myButton" ></input></div>

									</tr>
									<tr>
									</tr>
									<tr>
										<td></td>
									</tr>
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
