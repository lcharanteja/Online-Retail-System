<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="com.tcs.ilp.ors.bean.*" %>
        <%@ page import="com.tcs.ilp.ors.dao.*" %>
        <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/css/bootstrap1.css"
	rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
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
	<%@ include file="customersideheader.jsp"%>
    <div class="main">
		<div class="container">
		   <div class="banner">
			 <img src="images/banner1.jpg" class="img-responsive" alt=""/>
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
		   	   
		   	   	 <h3><i class="arrow"> </i><span>Our Specialities</span></h3>
		   	   </ul>
				 <ul class="feature_grid">	   	
				 <div class="clearfix" >
				 	<table border="2" >
				 	<tr>
				 	
				 	<th>ITEM NAME</th>
				 	
				 	<th>ITEM</th>
				 	</tr>
<%

ArrayList<ItemBean> itemList=(ArrayList<ItemBean>)request.getAttribute("itemlist");
						
for(ItemBean ib:itemList)
{
	System.out.println(ib.getItemId());
	String imgPath=ib.getItemImage();
%>

<tr>
<td><%=ib.getItemName() %></td>
<td><img alt="<%=ib.getItemName() %>" style="height:100px;width:100px;" class="img-responsive"
src="<%= request.getContextPath()%>/itemimages/<%=imgPath%>"></td>
<td><a href="<%=request.getContextPath()%>/ItemController?source=viewbyidcustomer&&itemid=<%=ib.getItemId()%>">view</a></td></tr>

<% 
}
%>

</table>
				 </div>
		</ul>
		<ul class="pagination">
  <li><a href="#">&laquo;</a></li>
  <li><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#">&raquo;</a></li>
</ul>
		    </div>
		   </div>
		   </div>
		   </div>
		   
		 <%@ include file="footer.jsp"%>
</body>
</html>