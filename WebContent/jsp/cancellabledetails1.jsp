<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.tcs.ilp.ors.bean.*"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="java.util.ArrayList"%>
 <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon AppetitBon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel="stylesheet" type="text/css" />
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
		<h3 align="center">Cancellable Items</h3>
	<% ArrayList<OrderDetailsBean> orderdetails1=(ArrayList<OrderDetailsBean>)session.getAttribute("cancellable"); %>
<form action="<%=request.getContextPath()%>/OrderController">

			<display:table  id="cancellable1" name="cancellable" sort="list" pagesize="10" export="true" requestURI="OrderController" class="table">
			<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
						<display:column property="orderDetailId"  sortable="true"/>
						<display:column property="itemId"  sortable="true"/>
						<display:column property="itemName"  sortable="true"/>
						<display:column property="orderId"  sortable="true"/>
						<display:column property="quantity"  sortable="true"/>
						<display:column property="price"  sortable="true"/>
						
						<display:column title="Cancel" ><a href="<%=request.getContextPath() %>/OrderController?source=cancel&&orderdetailid=${cancellable1.orderDetailId}"><input type="button" value="Cancel" class="btn btn-warning"></a></display:column>
						
						<%-- <display:column ><input type="checkbox" name="cancel" value="${cancellable1.orderDetailId}"></display:column> --%>
						</display:table>
						<!-- <input type="submit" name="source" value="cancelItems">
<input type="submit" name="source" value="return"> -->
		</form>	
		
		   </div>
		   </div>


				
				<div class="clearfix"></div>

		
	

<%@ include file="footer.jsp"%>


</body>
</html>
