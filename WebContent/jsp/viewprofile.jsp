<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tcs.ilp.ors.bean.CustomerBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet" type="text/css" >
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel="stylesheet" type="text/css" >


<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="../js/sample1.js"></script>
<!-- <script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script> -->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>

</head>
<body >

	<%@ include file="customersideheader.jsp"%>
	
    <div class="main" style="height:600px">
		<div class="container">
		  <div class="Product_top">
		   <div class="row content">
		   	<div class="col-md-3">
		   	  
		   	 </div>
		   	  <ul class="feature_grid" style="width:600px ;margin-left:300px;">	   	
				 <div class="clearfix" >
		     
		   	  <div class="breadcrumb">
				<a >Home</a>  
				&gt;&gt;  <span class="last">Account/Login</span>
	          </div>
	    
			  <%--  <div class="col-md-6 login-left">
			  	 <h3>NEW CUSTOMERS</h3>
				 <p>By creating an account with our store, you will be able to move through the checkout process faster, store multiple shipping addresses, view and track your orders in your account and more.</p>
				 <a class="acount-btn" href="<%=request.getContextPath() %>/jsp/register.jsp">Create an Account</a><br><br>
				  <a class="acount-btn" href="index.html">Continue As Guest</a>
			   </div> --%>
			
			  	<!-- <h3>REGISTERED CUSTOMERS</h3> 
				<p>If you have an account with us, please log in.</p>-->
				<%response.setHeader("Cache-Control","no-cache,must-revalidate"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
				<%
				CustomerBean cBean=(CustomerBean)request.getAttribute("custdetails");
				%>
				<form action="<%=request.getContextPath() %>/ProfileController">
				<!-- <input type="hidden" name="source" value ="edit"> -->
				<table id="xyz" style="align:center" class="table table-condensed">

					<tr>
						<td colspan="2">

							<h3 style="color: #6B6B6B">PERSONAL INFORMATION</h3>
						</td>
					</tr>

					

					<tr style="margin-top: 10px">
						<td>Customer id</td>
						<td><%=cBean.getCustomerId() %><td>
					
					</tr>
					
					<tr>
						<td>Customer Name:</td>
						<td><%=cBean.getFirstName() + "   "+ cBean.getMiddleName() +"   " +cBean.getLastName() %></td>
						
					</tr>
					

					<tr>
						<td>Gender: </td>
						<td><%=cBean.getGender() %></td>
					</tr>
					

					<tr>
						<td>Mobile No: </td>
						<td><%=cBean.getPhoneNo() %></td>
						
					</tr>
					
					<tr>
						<td>Email:</td>
						<td> <%=cBean.geteMail() %></td>
						
					</tr>
				

					<tr>
						<td>Date of Birth (YYYY-MM-DD)</td>
						<td><%=cBean.getDOB()%></td>
					</tr>
				
<tr><td colspan="2"><center>
	 <input type="submit" name="source" value="edit" class="myButton" onclick="return confirm('Do you want to edit your profile')">
				<input type="submit"  name="source" value="deactivate" class="myButton" onclick="return confirm('Do you want to deactivate your account?')"></center> </td></tr>


				
				
					</table>
			
				</form>
			   
			   </div>
			   </ul>
			   <div class="clearfix"> </div>
			 </div>	
		   </div>
	    </div>
	  </div>
	 </div>
	
<%@ include file="footer.jsp"%>
</body>
</html>
