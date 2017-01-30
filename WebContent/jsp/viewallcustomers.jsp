<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="com.tcs.ilp.ors.bean.CustomerBean"%>
    <%@page import="java.util.ArrayList"%>
    <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />

<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/conform.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/activeconfirm.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>


<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<%@ include file="adminsideheader.jsp"%>
	
	<div class="main" style="height:680px">
		<div class="container">
		  <ul class="feature_grid" style="margin-top: 10px;margin-bottom: 10px">	   	
				 <div class="clearfix" >
		<center><h2 style="color:#3399FF">View Customers</h2></center>
		<%
		ArrayList<CustomerBean> clist = (ArrayList<CustomerBean>)request.getAttribute("userlist"); 
 if(clist==null)
{
	%>
	
	
	
<center><form class="form-inline" name ="form" action="<%= request.getContextPath()%>/ProfileController" onsubmit="return (Submit())">
<div class="form-group">

<!--  <input type="hidden" name="source" value="searching">  -->

<table><tr><td>
</td>
<td>&nbsp&nbsp&nbsp</td>
<td> <label for="exampleInputEmail1"><h4>Search</h4></label>&nbsp;&nbsp;&nbsp;&nbsp;
 <select class="form-control" name="mydropdown">
<option value="select">-Select-</option>
<option value="searchbyid">Customer Id</option>
<option value="searchbyname">Name</option>
<option value="searchbystatus">Status</option>
<option value="searchbyemail">Email</option>
</select>

</td><td>&nbsp&nbsp&nbsp&nbsp&nbsp</td><td><input type="text" name="text" class="form-control" id="search" placeholder="search here" onblur="searchtext()"></td>&nbsp

<td><input type="submit" name="source" value="Search" class="btn btn-default">
<span STYLE="color: red" ID="field_error"></span>
 
 </td>
 </tr>
<tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp</td></tr>
</table>

</div>
</form>	</center>
		  
			 	<%ArrayList<CustomerBean> cList = (ArrayList<CustomerBean>)request.getAttribute("userList");
						
						%>
						<center><display:table  id="cList1" name="userList" sort="list" pagesize="8" export="true" requestURI="ProfileController" class="table">
						<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
						<display:column property="customerId" title="Customer Id" sortable="true"/>
						<display:column property="userName" title="Name" sortable="true"/>
						
						<display:column property="gender" title="Gender" sortable="true"/>
						<display:column property="eMail" title="Email" sortable="true"/>
						<display:column property="phoneNo" title="Phone No." sortable="true"/>
						<display:column property="status" title= "Status" />
							<display:column title="View"><a href="<%=request.getContextPath() %>/ProfileController?emailid=${cList1.eMail}&&source=viewindividual"><input type="button" value="view" class="btn btn-warning" "></a></display:column>
					<%-- 	<display:column title="Deactivate"><a href="<%=request.getContextPath() %>/ProfileController?emailid=${cList1.eMail}&&source=admindeactivate"><input type="button" value="Deactivate" class="btn btn-warning" onclick="return conform();"></a></display:column>
						<display:column title="Activate"><a href="<%=request.getContextPath() %>/ProfileController?emailid=${cList1.eMail}&&source=adminactivate"><input type="button" value="Activate" class="btn btn-warning" onclick="return aconform();"></a></display:column>
						 --%>
						</display:table></center>
						<%
}else{
%>
		<form class="form-inline" name = "form" action="<%= request.getContextPath()%>/ProfileController" onsubmit="return (Submit())">
<div class="form-group">

<!--  <input type="hidden" name="source" value="searching">  -->
<table><tr><td>
</td>
<td>&nbsp&nbsp&nbsp</td>
<td> <label for="exampleInputEmail1"><h4>Search</h4></label>&nbsp;&nbsp;&nbsp;&nbsp;
 <select class="form-control" name="mydropdown">
<option value="select">-Select-</option>
<option value="searchbyid">Customer Id</option>
<option value="searchbyname">Name</option>
<option value="searchbystatus">Status</option>
<option value="searchbyemail">Email</option>
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

	<display:table  id="clist1" name="userlist" sort="list" pagesize="8" export="true" requestURI="ProfileController" class="table">
						
						<display:setProperty name="paging.banner.placement" value="bottom"></display:setProperty>
						<display:column property="customerId" title="Customer Id" sortable="true"/>
						
						<display:column property="userName" title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Customer Name" sortable="true"/>
					
						<display:column property="gender" title="Gender" sortable="true"/>
						<display:column property="eMail" title="Email" sortable="true"/>
						<display:column property="phoneNo" title="Mobile No." sortable="true"/>
						<display:column property="status" title="Status" />
						<display:column title="View"><a href="<%=request.getContextPath() %>/ProfileController?emailid=${clist1.eMail}&&source=viewindividual"><input type="button" value="view" class="btn btn-warning" "></a></display:column>
					<%-- 	<display:column title="Deactivate"><a href="<%=request.getContextPath() %>/ProfileController?emailid=${cList1.eMail}&&source=admindeactivate"><input type="button" value="Deactivate" class="btn btn-warning" onclick="return conform();"></a></display:column>
						<display:column title="Activate"><a href="<%=request.getContextPath() %>/ProfileController?emailid=${cList1.eMail}&&source=adminactivate"><input type="button" value="Activate" class="btn btn-warning" onclick="return aconform();"></a></display:column>
						 --%></display:table>
					<%} %>
						</div>
		</ul>
		   </div>
		   </div>
		   
		   
<%@ include file="footer.jsp"%>

</body>
</html>