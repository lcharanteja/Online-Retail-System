<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
        <%@ page import="java.util.ArrayList" %>
        
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
    
    
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
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>


<%@include file="customersideheader.jsp"%>
    <div class="main" style="height:750px">
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
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitemscustomer"><%=dbean1.getDepartmentname()%></a></li>
			   	  	
			   	  	<%}} %>
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	 <h3><i class="arrow"> </i><span>Please enter quantity.</span></h3>
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix" style="font-family: cursive; height: 150px"> 
<% ItemBean ib = (ItemBean)request.getAttribute("ibean"); %>
<%Integer quan=(Integer)session.getAttribute("BuyQuan");  %>
<form name="itemindividual" action="<%=request.getContextPath() %>/CartController" onsubmit="return validateQuantity(<%=ib.getItemQuantity()%>)">
<br><br>
<center><span  style="color: #FE6847" >Item Name:</span><%=ib.getItemName()%>&nbsp;&nbsp;&nbsp;&nbsp;

<span  style="color: #FE6847">Price(&#8377):</span><%= ib.getItemPrice()%><span>&nbsp;&nbsp;&nbsp;&nbsp;

<span  style="color: #FE6847">Available Quantity:</span><%= (ib.getItemQuantity()-quan)%><span>&nbsp;&nbsp;<br></center>
<center><span  style="color: #FE6847">Select Quantity: </span><input type="text" value="1" name="quantity" style="width: 50px; height: 25px;" onblur="validateQuantity(<%= (ib.getItemQuantity()-quan)%>)"></center>
<input type="hidden" value="precart" name="source">
<input type="hidden" value="<%=ib.getItemId() %>" name="itemid">
<center><span STYLE="color: red" ID="quan_error">&nbsp;</span></center>


<center><span><input type="submit" class="myButton" value="Add To Cart"></span></center>

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











	