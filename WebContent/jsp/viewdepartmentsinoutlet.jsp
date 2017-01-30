<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
        <%@ page import="java.util.ArrayList" %>
           <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel='stylesheet' type='text/css' />
<%-- <link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' /> --%>
<!-- Custom Theme files -->
<link href="<%=request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>


<%@ include file="adminsideheader.jsp"%>
	<div class="main" style="height:500px">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=addoutlet">Add Outlets</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=adminsearch">Search Outlets</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=viewalloutlets">View All Outlets</a></li>
			   	  	
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	   
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix" style="text-align: center">
<h3 align="center">Departments in <%=request.getParameter("outletname") %></h3>
	
<%
ArrayList<DepartmentBean> oList=(ArrayList<DepartmentBean>)request.getAttribute("departmentlist");

%>


<%-- <table border="2" width=100% height=200px>
<tr><td colspan='3'><%=request.getParameter("outletid") %></td></tr>
<tr><td>DEPARTMENT ID</td><td>DEPARTMENT NAME</td><td>STATUS</td></tr>
<% 
for(DepartmentBean ob:oList){
		
%>

<tr><td><%=ob.getDepartmentid() %></td><td><%=ob.getDepartmentname() %></td><td><%=ob.getStatus() %></td></tr>

<% 
}
%>
</table> --%>


<center> <display:table  id="oList3" name="departmentlist" sort="list" pagesize="8" export="true" requestURI="OutletController" class="table">
							<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>	
						<display:column property="departmentid" title = "Department Id" sortable="true"/>
						<display:column property="departmentname" title="Department Name" sortable="true"/>
						<display:column property="status" title="Status"  />
						 </display:table> </center>
						 

</div>
		</ul>
		    </div>
		   </div>
		   </div>
		   </div>
		   
		   
		
		<%@ include file="footer.jsp"%>
</body>
</html>