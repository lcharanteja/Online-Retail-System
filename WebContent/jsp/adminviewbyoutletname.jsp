<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="com.tcs.ilp.ors.bean.OutletBean"%>
<%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
  <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
<script type="text/javascript" src="sample1.js"></script>

<script src="js/PaymentDDL.js"></script>
<script src="val.js"></script>
<!----webfonts---->

<link
	href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
	<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
	<%@ include file="adminsideheader.jsp"%>
	
	<div class="main"  style="height:600px">
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
		   	   
		   	   	<h3>
							<i class="arrow"> </i><span>Display by Outlet Names</span>
						</h3>
		   	   </ul>
		   	 
<%
ArrayList<OutletBean> oList=(ArrayList<OutletBean>)request.getAttribute("olist");
%>
<display:table  id="oList1" name="olist" sort="list" pagesize="10" export="true" requestURI="OutletController" class="table" >
			<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>			
						<display:column property="outletid" sortable="true"/>
						<display:column property="outletname" sortable="true"/>
						<display:column property="city" sortable="true"/>
						<display:column property="state" sortable="true"/>
						<display:column property="zipcode" sortable="true"/>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td> <display:column  title="View">
<a href="<%=request.getContextPath()%>/OutletController?source=viewbyoutletid&&outletid=${oList1.outletid}"><input type="button" value="VIEW" class="btn btn-warning"></a></display:column>
						</display:table>
</div>
		
		
				</div>
			</div>
		</div>
	
<%@ include file="footer.jsp"%>
</body>
</html>

