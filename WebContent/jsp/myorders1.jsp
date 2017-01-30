<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.OrderBean"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>
  <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >
  <link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/sample1.js" ></script>

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/sample1.js">

</script>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>
<body>
	<%@ include file="customersideheader.jsp"%>
	<div class="main"  style="height:500px">
		<div class="container">
     	 <ul class="feature_grid" style="margin-top: 10px">	
		 	<div class="clearfix"> 
		  
			 	<%
			 	ArrayList<OrderBean>  myorders=(ArrayList<OrderBean>)session.getAttribute("myorders");
			 	//if(myorders!=null&&!myorders.isEmpty()){
			 	%>
			 	
						<display:table  id="myorders1" name="myorders" sort="list" pagesize="6" export="true" requestURI="OrderController" class="table">
						<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
		
						<display:column property="orderid" title="Order Id" sortable="true"/>
						<display:column property="price" title="Price(&#8377)" sortable="true"/>
						<display:column property="status" title="Order Status" sortable="true"/>
						<display:column property="customerid" title="Email" sortable="true"/>
						<display:column title="View Order"><a href="<%=request.getContextPath() %>/OrderController?source=vieworderdetails&&orderid=${myorders1.orderid}"><input type="button" value="View Order" class="btn btn-warning"></a></display:column>
						<display:column title="Cancel Order"><a href="<%=request.getContextPath() %>/OrderController?source=cancelorderdetails&&orderid=${myorders1.orderid}"><input type="button" value="Cancel Order" class="btn btn-warning"></a></display:column>
						
						
						</display:table>

						</div>
						</ul>

					<%-- 	<%}else{%><center>
				 <h3 style="color:green"> &#9888; You don't have any previous orders </h3>
				 <br>
				 <input class="myButton" type="button" name="source" value="Back" onclick="window.history.back()">
				 </center><%} %> --%>

		
		   </div>
		   </div>

 <%@ include file="footer.jsp" %>  

</body>
</html>
