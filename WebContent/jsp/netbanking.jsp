<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Pay By net banking</title>
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(-1); }
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/payment.js"></script>
<link href="css/net.css" rel='stylesheet' type='text/css' />
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body onload="noback();">
<div class="container">
	<section id="content">
			<form name="netpayment" action="<%=request.getContextPath() %>/OrderController"
				onsubmit="return validateall()">
				<%String id=(String) request.getAttribute("outletid"); %>
				 <input type="hidden" name="outletid" value="<%=id%>">
<input type="hidden" name="source" value="dummypay">
		<div style="height: 30px ;width: 100">
		<h1> Welcome to MoneyBank</h1></div>
			<h3>Please login</h3>
			<div style="height: 60px;">
				<input type="text" placeholder="Username" required="" name="username" id="username" onblur="validId()"/>
				<span id="id_error" style="color: red">&nbsp</span>
			</div>
			<div style="margin-top: 40px; height: 60px">
				<input type="password" placeholder="Password" required="" name="passward" id="password" onblur="validPwd()" />
				<span id="pwd_error" style="color: red">&nbsp</span>
			</div>
			<div>
				<input type="submit" value="Log in" />
				
			</div>
		</form><!-- form -->
		<div class="button">
			
		</div><!-- button -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>