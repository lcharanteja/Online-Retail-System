<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="com.tcs.ilp.ors.bean.OutletBean"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
  <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<title>Bon Appetit</title>

<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
	<link href="<%=request.getContextPath()%>/css/bootstrap1.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
  <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<link href="<%=request.getContextPath()%>/css/style.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
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
	<%@ include file="customersideheader.jsp"%>
		<div class="main">
		<div class="container">
			<div class="banner">
				<img src="images/banner1.jpg" class="img-responsive" alt="" />
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
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitemscustomer&&deptname=<%=dbean1.getDepartmentname()%>"><%=dbean1.getDepartmentname()%></a></li>
			   	  	
			   	  	<%}} %>
		   	     </ul>
		   	   </div>


					
				</div>
				<div class="col-md-9">
					<ul class="feature">

						<h3>
							<i class="arrow"> </i><span>Display Outlet by Names</span>
						</h3>
					</ul>
					<ul class="feature_grid">
						<div class="clearfix" style="font-family: cursive;">
<%
ArrayList<OutletBean> oList=(ArrayList<OutletBean>)request.getAttribute("olist");
%>
<display:table  id="oList1" name="olist" sort="list" pagesize="10" export="true" requestURI="CustomerController" class="table">
			<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>			
						<display:column property="outletid" sortable="true"/>
						<display:column property="outletname" sortable="true"/>
						<display:column property="city" sortable="true"/>
						<display:column property="state" sortable="true"/>
						<display:column property="zipcode" sortable="true"/>
						
					
					
						<display:column title="Select"><a href="<%=request.getContextPath()%>/CustomerController?source=selectoutletid&&outletid=${oList1.outletid}"><input type="button" value="Select" class="btn btn-warning"></a></display:column>
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

