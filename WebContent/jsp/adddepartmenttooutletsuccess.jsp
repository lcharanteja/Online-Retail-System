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
		   	  
		   	
				
 <center>
				 <h3 style="color:red">&#10008; DEPARTMENT ALREADY EXISTS </h3>
				 <br>
				
				 <input type="button" class="acount-btn" value="Home" onclick="location.href='<%=request.getContextPath() %>/jsp/adminhome.jsp';"/>
				 </center>

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