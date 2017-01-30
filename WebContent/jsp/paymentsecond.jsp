<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=request.getContextPath()%>/css/bootstrap.css"
	rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/css/style.css"
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/payment.css" type="text/css" />
	<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/payment.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bon Appetit</title>
<%response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Cache-Control","no-store"); 
response.setDateHeader("Expires", 0); 
response.setHeader("Pragma","no-cache"); %>
</head>
<div class="headas" id="headas"><table><tr><td><img src="<%=request.getContextPath() %>/images/paylogo.jpg" style="height: 100px; width: 190px"></td><td><p style="font-size: 70px; margin-left: 400px"><b><span style="color:#003366"><i>Pay</i></span><span style="color: #006699"><i>Pal</i></span></b></p></td></tr></table></div>
<body onload="noback();">
	
	
		
		
			<form name="cardpayment" action="<%=request.getContextPath() %>/OrderController"
				onsubmit="return valall()">
				 <%String id=(String) request.getAttribute("outletid"); %>
				 <input type="hidden" name="outletid" value="<%=id%>">
<input type="hidden" name="source" value="dummypay">

<center>
<h2 style="margin-top: 30px">Pay your bill.</h2>

				<table  >
				<tr><td colspan="4" align="center"><span style="color: red; font-size: 12px">All Fields are mandatory.</span></td></tr>
				
				<tr><td rowspan="13" style="width: 300px" align="center"><img src="<%=request.getContextPath() %>/images/Cards.bmp" style="height: 300px; width: 350px"></td><td colspan="2" style="margin-left: 20px">&nbsp;</td><td rowspan="7" style="width: 300px"><img src="<%=request.getContextPath() %>/images/cardnumber.jpg" style="height: 180px; width: 300px"></td></tr>
				
				
					<tr>
						<td style="padding-left: 30px">Card Number:</td>
						<td><input type="text" placeholder="Enter 16 digit number."  name="ccnumber" id="ccnumber"
							maxlength="16" onblur="validateCardNumber()"></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 165px"><span
							id="c_error" style="color: red">&nbsp</span></td>
					</tr>

					<tr>
						<td style="padding-left: 30px">Card Type:</td>
						<td><select class="styled" onblur="validateCardType()"
							name="cardtype">
								<option value="select">Select</option>
								<option>Visa</option>
								<option>Mastercard</option>
								<option>Maestro</option>
								<option>SBI Maestro</option>
						</select></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 165px"><span
							id="ct_error" style="color: red">&nbsp</span></td>

					</tr>
					<tr>
						<td style="padding-left: 30px">Your name:</td>

						<td><input type="text" name="name" id="name"
							placeholder="Enter Your Name" onblur="validateName()" /></td>
					</tr>
					<tr>

						<td colspan="2" style="padding-left: 165px"><span
							id="n_error" style="color: red">&nbsp</span></td>
					</tr>




					<tr>
						<td style="padding-left: 30px">Expires On:</td>
						<td><select class="styled" name="selectMonth"
							>
								<option value="select">Select Month</option>
								<option value="01">January</option>
								<option value="02">February</option>
								<option value="03">March</option>
								<option value="04">April</option>
								<option value="05">May</option>
								<option value="06">June</option>
								<option value="07">July</option>
								<option value="08">August</option>
								<option value="09">September</option>
								<option value="10">October</option>
								<option value="11">November</option>
								<option value="12">December</option>
						</select> <select class="styled" name="selectYear" onblur="validatExpire()">
								<option value="select">Select Year</option>

								<option value="2014">2014</option>
								<option value="2015">2015</option>
								<option value="2016">2016</option>
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
								<option value="2022">2022</option>
								<option value="2023">2023</option>
								<option value="2024">2024</option>
								<option value="2025">2025</option>
								<option value="2026">2026</option>
								<option value="2027">2027</option>
								<option value="2028">2028</option>
								<option value="2029">2029</option>
								<option value="2030">2030</option>
								<option value="2031">2031</option>
								<option value="2032">2032</option>
								<option value="2033">2033</option>
								<option value="2034">2034</option>
								<option value="2035">2035</option>
								<option value="2036">2036</option>
						</select></td><td rowspan="5" style="width: 300px"><img src="<%=request.getContextPath() %>/images/CVV.gif" style="height: 160px; width: 290px; margin-left: 25px"></td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 165px"><span
							id="mv_error" style="color: red">&nbsp</span> <span></span>
							</td>
					</tr>



					<tr>
						<td style="padding-left: 30px">CVV Number:</td>
						<td><input type="text" name="cvv" id="cvv" placeholder="000"
							maxlength="3" onblur="validateCCV()" /></td>
					</tr>
					<tr>
						<td colspan="2" align="left"
							style="padding-left: 165px; width: 450px"><span
							id="cc_error" style="color: red">&nbsp</span></td>
					</tr>


					<tr>
						<td colspan="2"><input type="submit"
							style="margin-top: 5px; margin-left: 90px" />&nbsp&nbsp<input type="reset"
							style="margin-top: 5px; margin-left: 30px" onclick="location.reload()"/></td>
					</tr>
				</table>
</center>

			</form>
		
	
</body>
<div class="footas" id="headas"></div>
</html>