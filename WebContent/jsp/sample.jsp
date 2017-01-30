<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>  
   <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bon Appetit</title>
</head>
<body>
<form name="form" action="<%=request.getContextPath()%>/OutletController" method="get" onsubmit="return Submit()">



<%ArrayList<DepartmentBean> oList = (ArrayList<DepartmentBean>) request.getAttribute("departmentlist");

HashSet<String> hsetDepartmentname = new HashSet<String>();
%>
<table>
 <tr>
<td>Outlet Id</td>
<td><input type="text" name="outletid" value="<%=request.getParameter("outletid")%>"></input></td>
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
</table>
<input type="hidden" name="source" value="registerdepartmenttooutlet">
<input type="submit" value="ADD">
<input type="reset" value="reset">
</form>

</body>
</html>