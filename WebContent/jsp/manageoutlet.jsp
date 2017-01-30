<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.OutletBean" %>
    <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<%

ArrayList<OutletBean> oList=(ArrayList<OutletBean>)request.getAttribute("outletlist");

%>

<body>
<%@ include file="adminsideheader.jsp"%>
	<div class="main">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=addoutlet">Add Outlets</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=adminsearch">Search Outlets</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=viewalloutlets">View All  Outlets</a></li>
			   	  	
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	   

		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   	
				
			   <ul class="feature_grid">	   	
				 <div class="clearfix" >	 	
				 	
		<h3 align="center">View Outlets</h3>

<display:table  id="oList1" name="outletlist" sort="list" pagesize="8" export="true" requestURI="OutletController" class="table">
			<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>			

						<display:column property="outletid" title="Outlet Id" sortable="true"/>
						<display:column property="outletname" title="Outlet Name" sortable="true"/>
						<display:column property="city" title="City" sortable="true"/>
						<display:column property="state" title="State" sortable="true"/>
						<display:column property="zipcode" title="Zipcode" sortable="true"/>
						
					
					 <display:column  title="VIEW">
						<a href="<%=request.getContextPath()%>/OutletController?source=viewbyoutletid&&outletid=${oList1.outletid}"><input type="button" value="VIEW" class="btn btn-warning"></a></display:column>
		</display:table>
</div>
		</ul>
				 </div>
		
		
		    </div>
		   </div>
		   </div>
		  
<%@ include file="footer.jsp"%>
			

</body>
</html>