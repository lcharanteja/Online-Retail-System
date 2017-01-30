<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.*"%>
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
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
	<%@ include file="customersideheader.jsp"%>
	<div class="main">
		<div class="container" style="height:500px">
		 <ul class="feature_grid">	   	
				 <div class="clearfix" >
				 <h3 align="center">View Order Details</h3>
		
         <% ArrayList<OrderDetailsBean> orderdetails=(ArrayList<OrderDetailsBean>)request.getAttribute("particularorder"); 
        %>
	<display:table  id="particularorder" name="particularorder" sort="list" pagesize="10" export="true" requestURI="OrderController" class="table">
	<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
		
						<display:column property="orderDetailId" sortable="true"/>
						<display:column property="itemId"  sortable="true"/>
						<display:column property="itemName"  sortable="true"/>
						<display:column property="orderId"  sortable="true"/>
						<display:column property="quantity"  sortable="true"/>
						<display:column property="price" title="Price(&#8377)" sortable="true"/>
						
						
						</display:table>
		</div>
		</ul>
		   </div>
		   </div>

<%@ include file="footer.jsp"%>

</body>
</html>
