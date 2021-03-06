<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="com.tcs.ilp.ors.bean.OutletBean"%>
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
<script type="text/javascript" src="<%= request.getContextPath() %>/js/sample1.js"></script>

<script type="text/javascript" src="<%= request.getContextPath()%>/js/PaymentDDL.js"></script>
<script src="<%= request.getContextPath() %>/js/val.js"></script>
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
	
	<div class="main" style="height:600px">
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
				 <div class="clearfix" style= "height:auto;">
					
							<form name="form" action="<%=request.getContextPath()%>/OutletController" onsubmit="return valoutlet()">
								<input type="hidden" name="source" value="searchoutlet">
								<%
									ArrayList<OutletBean> oList = (ArrayList<OutletBean>) request.getAttribute("outletlist");
									HashSet<String> hsetOutletName = new HashSet<String>();
									HashSet<String> hsetOutletState = new HashSet<String>();
									HashSet<String> hsetOutletCity = new HashSet<String>();
									HashSet<Integer> hsetOutletZip = new HashSet<Integer>();
								%>
								<table align="center" cellspacing="10">
								<tr><td colspan="4"><center><h3 style="color: #FE6847"><b>Please select an Outlet</b></h3></center></td></tr>
									<tr>
										<td><input type="radio" name="search" value="outletname"
											onclick="configureddl(this.value)">SEARCH BY NAME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
										<td><input type="radio" name="search" value="state"
											onclick="configureddl(this.value)">SEARCH BY STATE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
										<td><input type="radio" name="search" value="city"
											onclick="configureddl(this.value)">SEARCH BY CITY  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									
										<td><input type="radio" name="search" value="zipcode"
											onclick="configureddl(this.value)">SEARCH BY ZIPCODE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
						 		
									<tr>
									</tr>	<tr><td>&nbsp;</td></tr>
									<tr class="row1">
								
									<td colspan="4" style="padding-left: 200px"><div id= "outletname" style="display: none;"><h3 style="color: #FE6847">Select Outlet Name:</h3>
										<select name="searchname" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													int i = 0;
													for (OutletBean ob : oList) {
														hsetOutletName.add(ob.getOutletname());
													}
												%>
												<%
													for (String s : hsetOutletName) {
												%>
												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
                                       	</select><SPAN STYLE="color: red" ID="outlet_error"></SPAN>
                                               <br><br><input type="submit" value="SEARCH" class="myButton"></input>
                                               </div>

									

										<div id= "state" style="display: none;"><h3 style="color: #FE6847">Select Outlet State:</h3><select name="searchstate" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													for (OutletBean ob : oList) {
														hsetOutletState.add(ob.getState());
													}
												%>
												<%
													for (String s : hsetOutletState) {
												%>




												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><SPAN STYLE="color: red" ID="outlet_error1"></SPAN>
										<br><br><input type="submit" value="SEARCH" class="myButton"></input></div>


									<div id= "city" style="display: none;"><h3 style="color: #FE6847">Select Outlet City:</h3><select name="searchcity" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													for (OutletBean ob : oList) {
														hsetOutletCity.add(ob.getCity());
													}
												%>
												<%
													for (String s : hsetOutletCity) {
												%>




												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><SPAN STYLE="color: red" ID="outlet_error2"></SPAN>
										<br><br><input type="submit" value="SEARCH" class="myButton"></input></div>
										
										<div id= "zipcode" style="display: none;"><h3 style="color: #FE6847">Select Outlet ZipCode:</h3><select name="searchzip" onblur="validatsearch()">
												<option value="select">--Select--</option>
												<%
													for (OutletBean ob : oList) {
														hsetOutletZip.add(ob.getZipcode());
													}
												%>
												<%
													for (Integer s : hsetOutletZip) {
												%>




												<option value="<%=s%>"><%=s%></option>
												<%
													}
												%>
										</select><SPAN STYLE="color: red" ID="outlet_error3"></SPAN>
										<br><br><input type="submit" value="SEARCH" class="myButton"></input></div></td>

									</tr>
									<tr>
									</tr>
									<tr>
										<td></td>
									</tr>
								</table>
							</form>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp"%>
</body>
</html>