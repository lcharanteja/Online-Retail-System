
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> <%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>  
   <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
   <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
     

<html>
<head>
<title>Bon Appetit</title>
<link href="jsp/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="jsp/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/itemdept.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+-2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<%@ include file="adminsideheader.jsp"%>
	
	<div class="main" style="height:450px">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/DepartmentController?source=adddepartment">Add Departments</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/DepartmentController?source=viewalldepartments">View All Departments</a></li>
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix">
<h2>Add Item to Department</h2>

<form name="form" action="<%=request.getContextPath()%>/DepartmentController" method="get" onsubmit="return Submit()">

<input type="hidden" name="source" value="registeritemtodepartment">
<%ArrayList<ItemBean> oList = (ArrayList<ItemBean>) request.getAttribute("itemlist");

HashSet<String> hsetItemname = new HashSet<String>();
%>
<table height="150px">
 <tr>
<td>Department Id &nbsp;&nbsp; </td>
<td><input type="text" name="departmentid"   value="<%= request.getParameter("departmentid") %> " readonly onclick="return alert('You cannot change this value')"></input></td>
</tr>
<tr>
<td>Item name </td>
	<td><select name="itemname" onblur="checkiname()">
												<option value="select">--Select--</option>
												<%
													for (ItemBean ob : oList) {
														hsetItemname.add(ob.getItemName());
													}
												%>
												<%
													for (String s : hsetItemname) {
												%>
												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select></td>
										<td><span STYLE="color: red" ID="iname_error"></span></td>
</tr>
<tr><td><input class="btn btn-warning" type="submit" value="Add"></td>
<td><input class="btn btn-warning" type="reset" value="Reset" onclick="location.reload()"></td></tr>
</table>


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


