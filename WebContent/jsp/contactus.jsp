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

<!----webfonts---->
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body>
	
	<%-- 	
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
			 <br> <div class="container-fluid">
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
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customersearch">LOCATE OUTLET</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/contactus.jsp">CONTACT US</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/help.jsp">HELP</a></li>
			       
		          </ul>
		          <br>
		          <ul class="login">
		          	<a href="account.jsp"><li class="login_top"><i class="sign"> </i><span>Sign In</span></li></a>
		            <a href="<%=request.getContextPath() %>/ProfileController?source=viewRegisterPage" ><li class="login_bottom"><i class="register"> </i><span>Register</span></li></a>
		          </ul>
			      <div class="clearfix"></div>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
            <div class="clearfix"></div>
           </div>
           
		 </div>  
		</div>
	</div> --%>
		<%@include file="customersideheader.jsp"%>	
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
		       <ul class="feature_grid">
		   	  <div class="breadcrumb">
				<a href="index.jsp">Home</a>  
				&gt;&gt;  <span class="last">Contact Us</span>
	          </div>
	          <div class="contact-form">
				  
					    <input type="hidden" name="source" value="help">
		<div class="justify">		    
Hello!<br>
It's nice of you to take the time to get to know us better. Here are some things about us that we thought you might like to know.

Bonappetite went live in 2007 with the objective of making foods easily available to anyone who had internet access. Today, we're present across various categories including seafood,bakery,wine ,flowers and still counting!<br>

<br>Be it our path-breaking services like Cash on Delivery, a 30-day replacement policy, EMI options, free shipping - and of course the great prices that we offer, everything we do revolves around our obsession with providing our customers a memorable online shopping experience. Then there's our dedicated Flipkart delivery partners who work round the clock to personally make sure the packages reach on time.

So it's no surprise that we're a favourite online shopping destination.<br>
</div>	
<br>Call us. We're available 24 hours a day.
(866) 498-0213 (U.S. and Canada) or +1-800-2233-0033 (toll-free outside of U.S. or Canada).
<br>
Need assistance in buying?
Call our product experts @ <b>1800 1080 1800</b><br>
<br>
Mail us @ <b> cs@bonappetite.com</b>
<br><br>
Write to us at
<b><br>
Bonappetit Internet Private Limited,<br>
Ozone Manay Tech Park,<br>
PO BOX 1022<br>
#56/18 & 55/09, 7th Floor,<br>
Seattle WA,USA<br>
<br></b>

					    
				  </div>
				  </ul>
		   </div>
	    </div>
	  </div>
	 </div>
   		   
	<%@ include file="footer.jsp"%>
</body>
</html>

