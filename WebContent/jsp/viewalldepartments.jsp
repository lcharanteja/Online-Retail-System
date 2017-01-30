<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file="adminhome.jsp" %>
      <%@ page import="java.util.ArrayList" %>
     
    <%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bon Appetit</title>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/conform.js"></script>
</head>
<body>
<%@ include file="adminsideheader.jsp"%>
<div class="main" style="border: solid; color: black;">
		<div class="container">
		   <div class="banner">
		<%

ArrayList<DepartmentBean> oList=(ArrayList<DepartmentBean>)request.getAttribute("departmentlist");

%>
<table border="2">
<% 
for(DepartmentBean ob:oList)
{
		
%>

<display:table  id="oList" name="departmentlist" sort="list" pagesize="10" export="true" >
						<display:column property="DeptId" sortable="true"/>
						<display:column property="DeptName" sortable="true"/>
						<display:column property="status"/>
						<display:column ><a href="<%=request.getContextPath()%>/DepartmentController?source=viewbydepartmentid&&departmentid=<%=ob.getDepartmentid() %>">view</a></display:column>
</display:table>




<% 
}
%>
</table>
		</div>
		</div>
		</div>	


</body>
</html>