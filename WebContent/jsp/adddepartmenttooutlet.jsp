<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>  
   <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/deptoutlet.js"></script>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<%@ include file="adminsideheader.jsp"%>
	<div class="main" style="height:455px">
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
				 <div class="clearfix" >
 <center><h2>Add Department to Outlet</h2></center>
<form name="form" action="<%=request.getContextPath()%>/OutletController" method="get" onsubmit="return Submit()">
<%ArrayList<DepartmentBean> oList = (ArrayList<DepartmentBean>) request.getAttribute("departmentlist");

HashSet<String> hsetDepartmentname = new HashSet<String>();
%>
<table height=200px>
 <tr>
<td>Outlet Id</td>
<td><input type="text" name="outletid" value="<%=request.getParameter("outletid")%>" readonly onclick="return alert('You cannot change this value')"></input></td>
</tr>

<tr>
<td>Department name</td>
	<td><select name="dname1" onblur="checkdname1()">
												<option value="select">--Select--</option>
												<%
													for (DepartmentBean ob : oList) {
														hsetDepartmentname.add(ob.getDepartmentname());
													}
												%>
												<%
													for (String s : hsetDepartmentname) {
												%>
												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select></td>
<td><span STYLE="color: red" ID="dname1_error"></span></td>
</tr>
<tr><td><input class="btn btn-warning" type="submit" value="Add"></td>
<td><input class="btn btn-warning" type="reset" value="Reset" onclick="location.reload()"></td></tr>

</table >
<input type="hidden" name="source" value="registerdepartmenttooutlet">
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