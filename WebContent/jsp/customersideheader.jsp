<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="com.tcs.ilp.ors.bean.DepartmentBean"%>
<%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<div class="header" style="height:200px">
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
				
						total_bill1 = total_bill1 + ib.getItemPrice() * ib.getBuyQuantity();
						}}
						%><%=total_bill1%>&#8377</span></li></a>
			   <div class="clearfix"> </div>
			  
			</ul>

			<div class="clearfix">
			</div>
		</div>
			</div>
		<div class="header_bottom">
		  <div class="header_nav">
      		<div class="logo">
				<a href="<%=request.getContextPath() %>/jsp/indexItem.jsp"><img src="images/logo4.png" alt=""/ width = 120px height = 120px><br></a>
			 </div>
			 <nav class="navbar navbar-default menu" role="navigation"><h3 class="nav_right"><a href="<%=request.getContextPath() %>/jsp/indexItem.jsp"><img src="images/logo.png" class="img-responsive" alt=""/></a></h3>
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
			        <li class="active"><a href="<%=request.getContextPath() %>/CustomerController?source=customeroutletsearch">LOCATE OUTLET</a></li>
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
		          	<a href="<%=request.getContextPath() %>/jsp/account.jsp"><li class="login_top"><i class="sign"> </i><span>Sign In</span></li></a>
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
	</div>
</body>
</html>