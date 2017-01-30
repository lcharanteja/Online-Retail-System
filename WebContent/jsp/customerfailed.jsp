<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
<%@ include file="customersideheader.jsp"%>
<div class="main">
		<div class="container">
		  
		   	   <ul class="feature_grid" style="margin-top:25px">	   	
				 <div class="clearfix" style= "height:200px;margin-top:60px">
				 <center>
				 <h3 style="color:red"> 	&#10008; Failed 	</h3>
				 <br>
				 <input class="myButton" type="button" name="source" value="Back" onclick="window.history.back()">
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