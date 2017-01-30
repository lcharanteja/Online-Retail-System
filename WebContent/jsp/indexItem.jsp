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
<link href="<%=request.getContextPath() %>/css/bootstrap1.css" rel='stylesheet' type='text/css' />
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
<%@ include file="customersideheader.jsp"%>



<%-- 	<div class="header" style="height:200px">
	<% 
if (session.isNew())
{
   ArrayList<ItemBean> iList= new ArrayList<ItemBean>();
   session.setAttribute( "List", iList );
  
}
%>
		<div class="container">
		  <div class="header_top">
			 <div class="header_top_left">
		  <h1 style="color:white;font-family: cursive; font: xx-large;">BON APPETIT</h1>
		   <div class="clearfix"> </div>
			</div>
			<div class="header_top_right">
			
			<ul class="account">
			
				<%if(session.getAttribute("custName")!=null){ %><span style="color: #B7C9E0">Welcome&nbsp;<a href="<%=request.getContextPath() %>/ProfileController?source=viewprofile"> <%=session.getAttribute("custName") %>&nbsp;</span></li></a>
		          	 <%} else{%>
		          	 <span  style="color: #B7C9E0">Welcome Guest</span>
		          	 <%} %>
			</ul>
			
			<ul class="shopping_cart">
			   <a href="<%=request.getContextPath() %>/jsp/cart.jsp"><li class="shop_left"><i class="cart"> </i><span>Shop</span></li></a>
			   <a href="#"><li class="shop_right"><span><%double total_bill1=0;
						ArrayList<ItemBean> iList1 = (ArrayList<ItemBean>) session.getAttribute("List");
						if(iList1!=null){
						for (ItemBean ib : iList1) {
				
						total_bill1 = total_bill1 + ib.getItemPrice() * ib.getItemQuantity();
						}}
						%><%=total_bill1%>&#8377</span></li></a>
			   <div class="clearfix"> </div>
			  
			</ul>
>>>>>>> .r15776

<<<<<<< .mine
=======
			<div class="clearfix">
			</div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="<%=request.getContextPath() %>/jsp/indexItem.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="indexItem.jsp"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
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
			        <li class="active"><a  href=" " onclick="alert('You can select an outlet only when you select an item to buy')" >LOCATE OUTLET</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/contactus.jsp">CONTACT US</a></li>
			        <li class="active"><a href="<%=request.getContextPath() %>/jsp/help.jsp">HELP</a></li>
		            </ul>
		          <ul class="login">
		         <%if(session.getAttribute("custName")!=null){ %>
		          	<a href="<%=request.getContextPath() %>/OrderController?source=vieworders"><li class="login_top"><i class="sign"> </i><span>MY ORDERS</span></li></a>
		          	<a href="<%=request.getContextPath() %>/ProfileController?source=viewprofile"><li class="login_top"><i class="sign"> </i><span>My Account</span></li></a>

		          	  
		          	<a href="<%=request.getContextPath() %>/LoginController?source=logout" ><li class="login_bottom"><i class="register"> </i><span>Logout</span></li></a>
		          	<%}else{ %>
		          	<%if(session.getAttribute("email")!=null){ %>
		          			          	<a href="<%=request.getContextPath() %>/OrderController?source=vieworders"><li class="login_top"><i class="sign"> </i><span>MY ORDERS</span></li></a>
		          	
		          	<%} %>
		          	<a href="account.jsp"><li class="login_top"><i class="sign"> </i><span>Sign In</span></li></a>
		            <a href="<%=request.getContextPath() %>/ProfileController?source=viewRegisterPage" ><li class="login_bottom"><i class="register"> </i><span>Register</span></li></a>
		          <%} %>
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
				 <div class="clearfix" style="font-family: cursive;"> Bon Appetit is a leading online retail system in US. This company has outlets all around in US.
				 We provide twenty-four service to our customers providing a wide variety of choices in delicacies,
				 seafood,flowers,wine items and bakery products. The products are being prepared by highly-qualified 
				 professionals and made to undergone through various quality checks and standards. 99% of customers
				  of our company are repeaters which shows the quality and reliability of Bon Appetit.
				 </div>
		</ul>
		    </div>
		   </div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>