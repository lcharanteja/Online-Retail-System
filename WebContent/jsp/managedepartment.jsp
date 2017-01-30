<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>

  
     <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/conform.js"></script>
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
	

	<div class="main" style="height:710px">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	    <li><a href="<%=request.getContextPath() %>/DepartmentController?source=adddepartment">Add New Department</a><br></li>
					  <li><a href="<%=request.getContextPath() %>/DepartmentController?source=viewalldepartments">View The Existing Departments</a><br></li>
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   
			   <ul class="feature_grid">	   	
				 <div class="clearfix" >
		   	   	<h3 align="center">View Departments</h3>
				 
				 
				 <%
				 ArrayList<DepartmentBean> oList1=(ArrayList<DepartmentBean>)request.getAttribute("departmentList");
 if(oList1==null)
{
	%>
	
	
	
<form class="form-inline" name="form"  action="<%= request.getContextPath()%>/DepartmentController" onsubmit="return (Submit())">
     <div class="form-group">
<!--  <input type="hidden" name="source" value="searching">  -->
<table><tr><td>
</td>
<td>&nbsp&nbsp&nbsp</td>
<td> <label for="exampleInputEmail1"><h4>Search</h4></label>&nbsp;&nbsp;&nbsp;&nbsp;
<select class="form-control" name="mydropdown">
<option value="select">-Select-</option>
<option value="searchbyid">Department Id</option>
<option value="searchbyname">Department Name</option>
<option value="searchbystatus">Status</option>
</select>

</td><td>&nbsp&nbsp&nbsp&nbsp&nbsp</td><td><input type="text" name="text" class="form-control" id="search" placeholder="search here" onblur="searchtext()"></td>&nbsp

<td><input type="submit" name="source" value="Search" class="btn btn-default">
 <span STYLE="color: red" ID="field_error"></span>
 </td>
 </tr>
<tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>
</table>
</div>
</form>	
				 			
		<%

ArrayList<DepartmentBean> oList=(ArrayList<DepartmentBean>)request.getAttribute("departmentlist");

%>

<display:table  id="oList3" name="departmentlist" sort="list" pagesize="8" export="true" requestURI="DepartmentController" class="table">
							<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>	
						<display:column property="departmentid" title = "Department Id" sortable="true"/>
						<display:column property="departmentname" title="Department Name" sortable="true"/>
						<display:column property="status" title="Status" />
					 <display:column  title="View">
						<a href="<%=request.getContextPath()%>/DepartmentController?source=viewbydepartmentid&&departmentid=${oList3.departmentid}"><input type="button" value="VIEW" class="btn btn-warning"></a></display:column>
						</display:table>
						<%
}else{
%>
	
<form class="form-inline" name="form"  action="<%= request.getContextPath()%>/DepartmentController" onsubmit="return (Submit())">
     <div class="form-group">
<!--  <input type="hidden" name="source" value="searching">  -->
<table><tr><td>
</td>
<td>&nbsp&nbsp&nbsp</td>
<td> <label for="exampleInputEmail1"><h4>Search</h4></label>&nbsp;&nbsp;&nbsp;&nbsp;
<select class="form-control" name="mydropdown">
<option value="select">-Select-</option>
<option value="searchbyid">Department Id</option>
<option value="searchbyname">Department Name</option>
<option value="searchbystatus">Status</option>
</select>

</td><td>&nbsp&nbsp&nbsp&nbsp&nbsp</td><td><input type="text" name="text" class="form-control" id="search" placeholder="search here" onblur="searchtext()"></td>&nbsp

<td><input type="submit" name="source" value="Search" class="btn btn-default">
 <span STYLE="color: red" ID="field_error"></span>
 </td>
 </tr>
<tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>
</table>
</div>
</form>	
<display:table  id="oList2" name="departmentList" sort="list" pagesize="8" export="true" requestURI="DepartmentController" class="table">
							<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>	
						<display:column property="departmentid" title ="Department Id" sortable="true"/>
						<display:column property="departmentname" title="Department Name" sortable="true"/>
						<display:column property="status" title="Status" />
					 <display:column  title="View">
						<a href="<%=request.getContextPath()%>/DepartmentController?source=viewbydepartmentid&&departmentid=${oList2.departmentid}"><input type="button" value="VIEW" class="btn btn-warning"></a></display:column>
						</display:table>
						<%} %>
						</div>
		</ul>
				 </div>
	
		    </div>
		   </div>
		   </div>
		 
		   
		<%@ include file="footer.jsp"%>
</body>
</html>














