<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.tcs.ilp.ors.bean.ItemBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="style.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>

<script type="text/javascript">
function updatevalue()
{
	Document.getElementById("source").value="updateitem";

}

function deletevalue()
{
	Document.getElementById("source").value="deleteitem";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>

<body>
<%@ include file="adminsideheader.jsp"%>
	
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
				 <div class="clearfix" style="font-family: cursive;">




<form name="frmupdate" action="<%=request.getContextPath()%>/ItemController">
<input type="hidden" name="source" id="source" value="deleteitem">
<table border="2">
<%
ItemBean ib= (ItemBean) (request.getAttribute("itemlist"));
String imgPath=ib.getItemImage();
%>
<tr><td><input type="text" value=<%= ib.getItemId() %> name="itemid"></td>
	<td><input type="text" value=<%= ib.getItemName() %> name="itemname"></td>
	<td><input type="text" value=<%= ib.getItemPrice() %> name="price"></td>
		<td><input type="text" value=<%= ib.getItemQuantity() %> name="quantity"></td>
	<td><input type="text" value=<%= ib.getItemFlavor() %> name="flavor"></td>
	<td><input type="text" value=<%= ib.getCancellationStatus() %> name="cancellationStatus"></td>
	<td><input type="text" value=<%= ib.getAvailabilityStatus() %> name=availabilityStatus"></td>
</tr> 
</table> 
<input type="submit" value="Update" onclick="updatevalue();" >
<input type="reset" class="myButton" value="Reset" onclick="location.reload()">
<input type="submit" value="Delete" >
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