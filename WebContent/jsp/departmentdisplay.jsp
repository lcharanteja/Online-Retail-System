<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>
  
     <%@ page import="com.tcs.ilp.ors.bean.OutletBean" %>
       <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
<body>

<form action="<%=request.getContextPath()%>/DepartmentController" method="get">

<input type="hidden" name="source" value="departmentdisplay">
<%ArrayList<DepartmentBean> oList = (ArrayList<DepartmentBean>) request.getAttribute("departmentlist");

HashSet<String> hsetDepartmentname = new HashSet<String>();
%>
<table>
 <tr>
<td>Outlet Id</td>
<td><input type="text" name="outletid" value="<%= request.getParameter("outletid") %> "></input></td>
</tr>
<tr>
<td>Department name</td>
	<td><ul class="category" name="departmentname">
												
												<%
													for (DepartmentBean ob : oList) {
														hsetDepartmentname.add(ob.getDepartmentname());
													}
												%>
												<%
													for (String s : hsetDepartmentname) {
												%>
												<li><%=s%></li>
												<%
													}
												%>
										</ul></td>
										</tr>
										</table>

</form>
</body>
</html>

