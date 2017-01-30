<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="js/sample1.js" ></script>

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="../js/sample1.js">

</script>

<SCRIPT type="text/javascript">
    
    function noBack() { if(window.history.forward(1) != null)
    	window.history.forward(1);}
</SCRIPT>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body onload="noBack();"  onpageshow="if (event.persisted) noBack();">
<%String email=(String)session.getAttribute("email");
if(email==null){
	response.sendRedirect("jsp/logout.jsp");
}%>



<div class="header" style="height:200px">

		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right">
		
	
			<div class="clearfix"></div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="jsp/index.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="index.jsp"><img src="images/logo.png" class="img-responsive" alt="logo"/></a></h3>
			<br>  <div class="container-fluid">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			    </div>
				<!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav menu1">
			      	     	<li class="active"><a href="<%=request.getContextPath() %>/jsp/indexItem.jsp">HOME</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customeroutletsearch">LOCATE OUTLET</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/contactus.jsp">CONTACT US</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/help.jsp">HELP</a></li>
		      
		          </ul>
		         
			      <div class="clearfix"></div>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
            <div class="clearfix"></div>
           </div>
           
		 </div>  
		</div>
	</div>
	<div class="main" style="height:320px;">
		<div class="container" style="height:300px;">
		<ul class="feature_grid" style="margin-top:10px">	   	
				 <div class="clearfix" >
		<br><br><br>
          
			<center><p><h2 style="color:green"> &#10004; THANK YOU! YOU ARE SUCCESSFULLY LOGGED OUT</h2>
	<br><h3 style="color:green"><a  href="<%=request.getContextPath() %>/jsp/account.jsp">Click here </a>to login</h3>	
	
	</center>
	</div>
	</ul>
		</div>
	</div>



<%@ include file="footer.jsp"%>

</body>
</html>
