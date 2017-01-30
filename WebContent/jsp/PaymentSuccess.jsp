<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="val.js"></script>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
<script type="text/javascript" src="../js/sample1.js">
	
</script>
<link
	href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900'
	rel='stylesheet' type='text/css'>
	<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
	<%@ include file="customersideheader.jsp"%>
	<div class="main">
		<div class="container" style="height: 550px">
         
					<center><h3 style="color: #FE6847">Thanks for the Payment.</h3></center>
				
				<div class="clearfix"></div>

			
		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>

