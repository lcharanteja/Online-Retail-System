<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<html>
<head>
<title>Bon Appetit</title>

<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
<script type="text/javascript" src="sample1.js"></script>

<script src="js/PaymentDDL.js"></script>
<script src="val.js"></script>
<!----webfonts---->
<link
	href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
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
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=addoutlet">Add Outlets</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=adminsearch">Search Outlets</a></li>
			   	  	<li><a href="<%=request.getContextPath() %>/OutletController?source=viewalloutlets">View All  Outlets</a></li>
			   	  	
			   	  	
			   	  	
		   	     </ul>
		   	   </div>
		   	 
		   	   
		   	
		   	</div>
		   	<div class="col-md-9">
		   	   <ul class="feature">
		   	   
		   	   	
		   	   </ul>
		   	   <ul class="feature_grid">	   	
				 <div class="clearfix" style= "height:200px;margin-top:60px">
				 <center>
				 <h3 style="color:green">OUTLET DELETED SUCCESSFULLY </h3>
				 <br>
				 <input class="myButton" type="button" name="source" value="HOME" onclick="location.href='adminhome.jsp';">
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