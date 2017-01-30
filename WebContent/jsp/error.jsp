<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
     <%@ page import="com.tcs.ilp.ors.bean.DepartmentBean" %>
      <%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl" %>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath() %>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath() %>/css/style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
</script>
<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<%@ include file="adminsideheader.jsp"%>
  <div class="main" style="height:400px">
		<div class="container">
		     <div class="row content">
		   	
		   	<div class="col-md-9">		   	  
		   	   <ul class="feature_grid"  style="height:300px;margin-top:50px;margin-left:250px">	   	
				 <div class="clearfix" >
<br><br><br>
<%

String msg=(String)session.getAttribute("msg");
if(msg.equals("additemsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Item <%=session.getAttribute("msgvalue") %> is added successfully</font></center>
	
	<%
}
%>
<% 
if(msg.equals("adddepartmenttooutletfail"))
{
%>
<center>

	<font color="red"size="4">&#10008; Department <%=session.getAttribute("msgvalue") %> already exists</font></center>
	
	<%
}
%>
<% 
if(msg.equals("adddepartmentsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Department <%=session.getAttribute("msgvalue") %> is added successfully</font></center>
	
	<%
}
%>

<% 
if(msg.equals("adddepartmenttooutletsuccess"))
{
%>
<center>
	<font color="green"size="4">&#10004; Department <%=session.getAttribute("msgvalue") %> is added successfully </font></center>
	
	<%
}
%>
<% 
if(msg.equals("additemtodeptsuccess"))
{
%>
<center>
	<font color="green"size="4">&#10004; Item <%=session.getAttribute("msgvalue") %> is added successfully </font></center>
	
	<%
}
%>

<% 
if(msg.equals("additemtodeptfail"))
{
%>
<center>
	<font color="red"size="4">&#10008; Item <%=session.getAttribute("msgvalue") %> already exists</font></center>
	
	<%
}
%>
<%
//String msg1=(String)session.getAttribute("msg");
if(msg.equals("updateitemsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Item <%=session.getAttribute("msgvalue") %> is updated successfully.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deleteitemsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Item <%=session.getAttribute("msgvalue") %> Status is changed successfully. </font></center>
<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatecustdetailsuccess"))
{
%>
<center>
	<font color="green" size="4">Customer details are updated successfully.</font></center>
<%
}
%>



<% 
if(msg.equals("namealreadyexist"))
{
%>
<center>
	<font color="red" size="4">&#10008; Item <%=session.getAttribute("msgvalue") %> already exists.Please try again with another name</font></center>
<%
}
%>


<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("additemsysfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while loading add item page.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("additemfailure"))
{
%>
<center>
	<font color="red" size="4">&#10008; Item <%=session.getAttribute("msgvalue") %> is not added due to error.Please try again</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("viewallitemfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while viewing all the items.</font></center>
	<%
}
%>

<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("viewitembyidfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while viewing all item details.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatebyidfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while updating the item details.</font></center>
	<%
}
%>

<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updateitemfailure"))
{
%>
<center>
	<font color="red" size="4">&#10008; Item <%=session.getAttribute("msgvalue") %> is not updated successfully.</font></center>
	<%
}
%>

<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deleteitemfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; Status of the item <%=session.getAttribute("msgvalue") %> is not updated.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deleteitempgfail"))
{
%>
<center>
	<font color="red" size="4">&#10008;System fails while loading change status page.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("addtocartclsnotfound")||msg.equals("addtocartsqlex"))
{
%>
<center>
	<font color="red" size="4">System fails while loading cart page.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("viewprofilebyemailidfail"))
{
%>
<center>
	<font color="red" size="4">System fails while loading customer profile.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("viewallcustfail"))
{
%>
<center>
	<font color="red" size="4">System fails while loading all customer's details.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatecustpgfail"))
{
%>
<center>
	<font color="red" size="4">System fails while loading update customer profile page.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatecustdetailfail"))
{
%>
<center>
	<font color="red" size="4">Customer details are not updated successfully.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("imagesqlex"))
{
%>
<center>
	<font color="red" size="4">System fails while viewing image.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("generateorderex"))
{
%>
<center>
	<font color="red" size="4">System fails while generating order.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("adminviewallorderexp"))
{
%>
<center>
	<font color="red" size="4">System fails while viewing all orders.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("orderbyidexp"))
{
%>
<center>
	<font color="red" size="4">System fails while viewing the order.</font></center>
	<%
}
%>                                   
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("startexp"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while viewing the home page.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("changedeptexp"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while changing department.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("addoutletsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Outlet <%=session.getAttribute("msgvalue") %> is added successfully.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("addoutletfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; Outletname "<%=session.getAttribute("msgvalue") %>" already exists.Please try again with another name</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals(" viewalloutletfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while viewing all the outlets</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("viewoutletfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while viewing outlet details</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updateoutletsysexp"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while loading update outlet page</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updateoutletsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Outlet <%=session.getAttribute("msgvalue") %> is updated successfully</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updateoutletfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; Outlet details are not updated due to an error</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deleteoutletsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Outlet Status is changed successfully.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deleteoutletfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; Outlet Status not changed due to an error</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deptregsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Department <%=session.getAttribute("msgvalue") %> is added successfully.</font></center>
	<%
}
%>
<% 
if(msg.equals("deptnamealreadyexist"))
{
%>
<center>
	<font color="red" size="4">&#10008; Department <%=session.getAttribute("msgvalue") %> already exists.Please try again with another name</font></center>
<%
}
%>

<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deptregfail"))
{
%>
<center>
	<font color="red" size="4">&#10008;Department <%=session.getAttribute("msgvalue") %> is not added due to an error.Please try again</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals(" viewalldeptfail"))
{
%>
<center>
	<font color="red" size="4"> Nothing found to display</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals(" viewdeptidfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; Department <%=session.getAttribute("msgvalue") %> cannot be viewed due to an error.Please try again</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatedeptsysexp"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while loading update department page</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatedeptsuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Department <%=session.getAttribute("msgvalue") %> is updated successfully.</font></center>
	<%
}
%>


<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("updatedeptfail"))
{
%>
<center>
	<font color="red" size="4">&#10008;Department <%=session.getAttribute("msgvalue") %> is not updated due to an error</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deletedeptexp"))
{
%>
<center>
	<font color="red" size="4">&#10008; System fails while loading change status of department page.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deptchgstatussuccess"))
{
%>
<center>
	<font color="green" size="4">&#10004; Department status is changed successfully.</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("deptchgstatusfail"))
{
%>
<center>
	<font color="red" size="4">&#10008; Department status is not changed due to an error</font></center>
	<%
}
%>
<%
//String msg=(String)session.getAttribute("msg");
if(msg.equals("searchfail"))
{
%>
<center>
	<font color="red" size="4">&#10008;Searching outlet failed due to error</font></center>
	<%
}
%>
<br><br><center>
<input type="button" class="acount-btn" value="Home" onclick="location.href='<%=request.getContextPath() %>/jsp/adminhome.jsp';"/>
</center>
</div>
		</ul>
		 </div>
		   </div>
		   </div>
		   </div>
		   
	<%@ include file="footer.jsp"%>
</body>
</html>