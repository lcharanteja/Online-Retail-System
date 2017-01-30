<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.tcs.ilp.ors.bean.ItemBean"%>
<%@ page import="com.tcs.ilp.ors.bean.DepartmentBean"%>
<%@ page import="com.tcs.ilp.ors.dao.DepartmentImpl"%>
<!DOCTYPE html>
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
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>

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

		
	<div class="header" style="height:175px">
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
	</div>
	<div class="main">

		<div class="container">
			<br>
			<h3>Frequently Asked Questions</h3>
		
			<div style="margin: 50px">

				<ol>
					<li><p class="red">How do I select items to purchase?</p>
						<p class="faq">As you browse through the BonAppettit
							Online Store, click on the "add to shopping cart" button beneath
							the items that you wish to purchase.</p> <br></li>
					<li>

						<p class="red">How do I know what is in my shopping cart?</p>
						<p class="faq">When browsing through BonAppettit, simply
							look to the right-side of the screen to see which items you have
							in your shopping cart. Use the arrows to move between items in
							your cart.</p>
						<br>
					</li>
					<li>
						<p class="red">How do I remove an item from my shopping cart?</p>
						<p class="faq">Click the "remove" check box and click
							"modify cart" to remove that item from your cart. You may also
							change the quantity of items to "0" (zero) to remove the item
							from your shopping cart.</p>
						<br>
					</li>

					<li>
						<p class="red">How do I modify the quantity of a product in my
							shopping cart?</p>
						<p class="faq">Click on "shopping cart" button to see an
							itemized list of the products in your shopping cart. Change the
							quantity of the item and select quantity to update the contents
							of your shopping cart.</p>
						<br>
					</li>
					<li>
						<p class="red">How do I empty out my shopping cart?</p>
						<p class="faq">To remove items from your shopping cart
							click on "view cart", check the "remove" box for each item that
							you would like to remove from your shopping cart and then click
							on "update total".</p>
						<br>
					</li>
					<li>
						<p class="red">How do I pay for my merchandise?</p>
						<p class="faq">We accept Visa, Mastercard, American
							Express, and Discover for online orders, subject to proper
							authorization. In some cases, we can bill your Airway Manual
							Customer Account if you have one (subject to approval). If you
							wish to pay by another method, simply submit your request via
							email without any payment information to:
							product_orders@BonAppettit.com, and we will contact you to make
							arrangements for payment.</p>
						<br>
					</li>

					<li><p class="red">Is it safe to give you my credit card
							number over the Internet?</p>
						<p class="faq">Yes, read about BonAppettit web site
							security here. However, if you are still uncomfortable providing
							your credit card information over the Internet -- no problem.
							Simply submit your request via email without any payment
							information to: product_orders@BonAppettit.com, and we will
							contact you to make arrangements for payment.</p>
						<br></li>

					<li><p class="red">How do I know that BonAppettit has
							received my order?</p>
						<p class="faq">Our ordering system will automatically send
							you an email confirming that your order was successfully
							submitted. Please make certain that the email address you provide
							is correct. Upon processing, we will send you an additional email
							message confirming your order with applicable taxes and shipping
							charges calculated, and a shipping order number for your records.</p>
						<br></li>
					<li>
						<p class="red">How safe is my information and credit card
							number?</p>
						<p class="faq">Your information is very safe at
							BonAppettit.com and we take site and data security as a serious
							issue. The BonAppettit.com website uses 128-bit encryption to
							ensure that your data is secure. With regards to the safety and
							privacy of your credit card, we've implemented a state-of-the-art
							e-commerce solution for the new BonAppettit.com. The new site
							offers improved security over our previous site and many other
							existing websites by encrypting your credit card information in
							such a way that it is not accessible by employees within
							BonAppettit, or by anyone who would try to compromise the
							security of BonAppettit.com. As a result, our site meets the
							rigorous security standards set by many privacy watchdog groups
							and standards set by the Internet community in general. When you
							entered your credit card in our store, only the last four digits
							of your card are visible on the site. Even you (or anyone who
							logs in as you) cannot access the details of your credit card
							from our store.</p>
						<br>
					</li>
					<li>
						<p class="red">Can I pay off my delinquent account online?</p>
						<p class="faq">Unfortunately, BonAppettit is not offering
							this option at the present time online, but we hope to be able to
							offer it in the future.</p>
						<br>
					</li>

					<li><p class="red">I'm trying to register a new account or
							check out and my country is not listed. Why?</p>
						<p class="faq">If your country is not listed in the
							drop-down, you reside in a country that is possibly under embargo
							and we cannot register accounts or ship to parties residing in
							countries embargoed. Please contact us using the information
							below. In addition, you may not see your country listed when
							you’re attempting to change your billing address from one country
							to another. If so, please contact us for assistance and we’ll
							gladly help you update your information. For further information,
							please contact our customer support staff toll-free at (866)
							498-0213 (U.S. and Canada) or +1-800-2233-0033 (toll-free outside
							of U.S. or Canada).</p><br></li>

					<li><p class="red">I'm a customer living in Australia, but
							I'm not able to purchase anything through BonAppettit. Why?</p>
						<p class="faq">Online purchases cannot be made from
							Australia at this time. Please contact one of our dedicated
							Customer Service Representatives who can handle your order. We
							apologize for any inconvenience and appreciate your purchase.</p>
						<br></li>
				</ol>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>