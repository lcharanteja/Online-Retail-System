<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
<!DOCTYPE html>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/css/bootstrap1.css"
	rel='stylesheet' type='text/css' />
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
<body><%@ include file="adminsideheader.jsp"%>
	<div class="main">
		<div class="container">
		     <div class="row content">
		   	<div class="col-md-3 content_top">
		   	   <div class="category_box">
		   	  	<h3 class="cate_head">Manage</h3>
		   	     <ul class="category">
		   	     <li><a href="<%= request.getContextPath() %>/jsp/adminhome.jsp">Home</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=additem">Add Items</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/ItemController?source=viewallitems">View All Items</a></li>
			   	  	
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	  
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix" >
				 <label style="text-align: center;"> Click on the images to view the details of the item.</label>
				 <br><br>
				 	<table class="table table-bordered table-hover">
				 	<tr>
				 	<th>ITEM ID</th>
				 	<th>ITEM NAME</th>
				 	<th>PRICE</th>
				 	<th>&nbsp;QUANTITY</th>
				 	<th>&nbsp;&nbsp;FLAVOR</th>
				 	<th>CANCELLATION STATUS</th>
				 	<th>ITEM AVAILABILITY STATUS</th>
				 	<th>ITEM IMAGE</th>
				 	</tr>
<%

ArrayList<ItemBean> itemList=(ArrayList<ItemBean>)request.getAttribute("itemlist");
for(ItemBean ib:itemList)
{String imgPath=ib.getItemImage();
%>

<tr><td><%=ib.getItemId() %></td>
<td><%=ib.getItemName() %></td>
<td><%=ib.getItemPrice() %></td>
<td><%=ib.getItemQuantity() %></td>
<td><%=ib.getItemFlavor() %></td>
<td><%=ib.getCancellationStatus() %></td>
<td><%=ib.getAvailabilityStatus()%></td>
<td><a href="<%=request.getContextPath()%>/ItemController?source=viewbyid&&itemid=<%=ib.getItemId()%>">
<img alt="<%=ib.getItemName() %>" style="height:100px;width:100px;" 
src="<%= request.getContextPath()%>/itemimages/<%=imgPath%>"></a></td>
<%-- <td><img alt="<%=ib.getItemName() %>" style="height:100px;width:100px;" src="<%=request.getContextPath() %>/ImageController?itemid=<%=ib.getItemId() %>"></td> --%>
</tr>
<!-- <tr><td>&nbsp;</td></tr> -->
<% 
}
%>

</table>
				 </div>
		</ul>
	
		    </div>
		   </div>
		   </div>
		   </div>
		   
	<%@ include file="footer.jsp"%>
			

</body>
</html>