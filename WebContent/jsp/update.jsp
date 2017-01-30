<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.tcs.ilp.ors.bean.CustomerBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bon Appetit</title>
<link href="<%=request.getContextPath()%>/css/bootstrap.css" rel="stylesheet" type="text/css" >
<link href="<%=request.getContextPath()%>/css/bootstrap1.css" rel="stylesheet" type="text/css" >

<script type="text/javascript" src="js/sample1.js" ></script>

<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<script type="text/javascript" src="../js/sample1.js"></script>
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
<link href='http://fonts.googleapis.com/css?family=Exo+2:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<body onload=noback();>
	<%@ include file="customersideheader.jsp"%>
	<div class="main">
		<div class="container">
          <%
				CustomerBean cBean=(CustomerBean)request.getAttribute("custdetails");
				%>
			<form name="form" action="<%=request.getContextPath() %>/ProfileController" onsubmit="return Submitupdate()">
 <input type="hidden" name="source" value="update">
				<table id="xyz" class="table table-bordered" >

					<tr style="margin-top: 10px">
						<td colspan="2">

							<h3 style="color: #FE6847">PERSONAL INFORMATION</h3>
						</td>
					</tr>

					<p align="left">
						Fields marked with asterisk( <label style="color: red">*</label>
						)are mandatory
					</p>


					<tr style="margin-top: 10px">
						<td style="width: 40%">First Name<label style="color: red">*</label></td>
						<td align="left" style="width: 60%"><input type="text" name="firstname" value=<%=cBean.getFirstName()%> onblur="checkfname()">
						<span STYLE="color: red" ID="fname_error"></span></td>
					</tr>
					
						<tr style="margin-top: 10px">
						<td style="width: 40%">Middle Name<label style="color: red">*</label></td>
						<td align="left" style="width: 60%"><input type="text" name="middlename" value=<%=cBean.getMiddleName()%> onblur="checkmname()">
						<span STYLE="color: red" ID="mname_error"></span></td>
					</tr>
					
					<tr>
						<td style="width: 40%">Last Name<label style="color: red">*</label></td>
						<td align="left" style="width: 60%"><input type="text" name="lastname" value=<%=cBean.getLastName()%> onblur="checklname()">
						<span STYLE="color: red" ID="lname_error"></span></td>
					</tr>
					

				 	<tr>
						<td style="width: 40%">Email Address</label></td>
						<td align="left" style="width: 60%"><input type="text" disabled name="email" value=<%=cBean.geteMail()%> onblur="checkemail()">
						<SPAN STYLE="color: red" ID="email_error"></SPAN></td>
					</tr>
				
					<tr>
						<td style="width: 40%">Gender</td>
						<td align="left" style="width: 60%"><input type="text" name="sex" disabled value=<%=cBean.getGender()%>>
						<span STYLE="color: red" ID="radio_error"></span></td>
					</tr>
				 

					<tr>
						<td style="width: 40%">Mobile no<label style="color: red">*</label></td>
						<td align="left" style="width: 60%"><input type="text" name="phone" value=<%=cBean.getPhoneNo()%> onblur="checkphone()">
						<span STYLE="color: red" ID="phone_error"></span></td>
					</tr>
					

					<%-- <tr>
						<td>Date of Birth<label style="color: red">*</label></td>
						<td><input type="Date" onblur="checkdate()" value=<%=cBean.getDOB()%> name="date"></td>
						<td><span STYLE="color: red" ID="date_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr> --%>




					<!-- <tr>
						<td colspan="2">
							<h3 style="color: #FE6847">LOGIN INFORMATION</h3>
						</td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr> -->

					<!-- <tr>
						<td>Password<label style="color: red">*</label></td>
						<td><input type="password" name="password" onblur="checkpwd()"></td>
						<td><span STYLE="color: red" id="pwd_error"></span></td>
					</tr>
					<tr>
						<td>&nbsp</td>
					</tr>

					<tr>
						<td>Confirm Password<label style="color: red">*</label></td>
						<td><input type="text" name="conpassword" onblur="checkconpwd()"></td>
						<td><span STYLE="color: red" ID="conpwd_error"></span></td>
					</tr>

					<tr>
						<td>&nbsp</td>
					</tr> -->

					<tr>
						<td><input type="submit" value="confirm"
							class="myButton" onclick="return confirm('Do you want to update your information?')"></td>
							<td><input type="reset" class="myButton" value="reset" onclick="window.location.reload();"></td>
					</tr>
				</table>
				
				<div class="clearfix"></div>

			</form>
		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>
