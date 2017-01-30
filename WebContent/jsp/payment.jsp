<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Bon Appetit</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="js/val.js"></script>

<link href="css/style.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	
</script>
<script type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
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
<body onload="noback()">
	<%@ include file="customersideheader.jsp"%>
	<div class="main">
		<div class="container" style="height: 550px">
          
			<form name="payment" action="<%=request.getContextPath() %>/OrderController" onsubmit="return checkall()" >
<input type="hidden" value="afterpay" name="source">
<table style="width: 100%">
<tr><td colspan="4">&nbsp;</td></tr>
<tr><td colspan="4">&nbsp;</td></tr>


<tr >

<td align="left" width="25%"><h3 style="color: #FE6847">Payment Option: </h3></td>
<td align="left" width="25%"><input type="radio" name="pay" value="atm" onclick="selectradio(this.value)">Debit Card</td>
     <td align="left" width="25%">  <input type="radio" name="pay" value="netbanking" onclick="selectradio(this.value)">NetBanking</td>
          <td align="left" width="25%">    <input type="radio" name="pay" value="mobilebanking" onclick="selectradio(this.value)">Credit Card</td>
     </tr>  </table>
       <br>
       <div id="atm"   style="display: none;" >
       <center><h3 style="color: #FE6847"><b>Payment By Debit Card</b></h3></center>
      <table style="width: 100%">
<tr><td colspan="4">&nbsp;</td></tr>
<tr><td colspan="4">&nbsp;</td></tr>


<tr >
      
     <td align="left" width="25%"><h3 style="color: #FE6847">Choose Your Bank :</h3></td>
      <td align="left" width="25%"> <input type="radio"  name="atmddl" value="SBI">PNB </td>
      <td align="left" width="25%"> <input type="radio"  name="atmddl"  value="SBI">SBI </td>
       <td align="left" width="25%"><input type="radio"  name="atmddl"  value="SBI">HDFC </td></tr>
       <tr>  <td align="left" width="25%">&nbsp;</td>
     <td align="left" width="25%"> <input type="radio"  name="atmddl"  value="SBI">ICICI </td>
      <td align="left" width="25%"> <input type="radio"  name="atmddl"  value="SBI">INDIAN </td>
       <td align="left" width="25%"><input type="radio"  name="atmddl" value="SBI">PRATHMA </td></tr>
      <tr> <td align="left" width="25%">&nbsp;</td> 
      <td align="left" width="25%"> <input type="radio"  name="atmddl"  value="SBI">Oriental Bank of Commerce  </td>
      <td align="left" width="25%"> <input type="radio"  name="atmddl"  value="SBI">UCO Bank </td>
      <td align="left" width="25%"> <input type="radio"  name="atmddl"  value="SBI">Union Bank of India </td></tr>
         <tr>   <td align="left" width="25%">&nbsp;</td>
             <td align="left" width="25%"><input type="radio"  name="atmddl" value="SBI">Allahabad Bank </td>
               <td align="left" width="25%">  <input type="radio"  name="atmddl"  value="SBI">Vijaya Bank </td>
               <td align="left" width="25%">  <input type="radio"  name="atmddl"  value="SBI">Allahabad Bank </td></tr>
                             <tr>   <td align="left" width="25%">&nbsp;</td>
             <td align="left" width="25%"><input type="radio"  name="atmddl" value="SBI">Allahabad Bank </td>
               <td align="left" width="25%">  <input type="radio"  name="atmddl"  value="SBI">Vijaya Bank </td>
               <td align="left" width="25%">  <input type="radio"  name="atmddl"  value="SBI">Allahabad Bank </td></tr>
                            
                     <tr><td colspan="4">&nbsp;</td></tr>
                     
                     
         <tr><td colspan="4" align="center"><input type="submit" value="Proceed to pay" class="btn btn-warning" >&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="reset" class="btn btn-warning" value="RESET" ></td></tr></table>
       
</div>
                                        <div id="internet"   style="display: none;" >
            
                  <center> <h3 style="color: #FE6847"><b>Payment By Internet Banking</b></h3></center>
            
                <table style="width: 100%">
<tr><td colspan="4">&nbsp;</td></tr>
<tr><td colspan="4">&nbsp;</td></tr>


<tr >
      
     <td align="left" width="25%"><h3 style="color: #FE6847">Choose Your Bank :</h3></td>
      <td align="left" width="25%"> <input type="radio"  name="internetddl" value="SBI">SBI </td>
      <td align="left" width="25%"> <input type="radio"  name="internetddl"  value="SBI">PNB </td>
       <td align="left" width="25%"><input type="radio"  name="internetddl"  value="SBI">HDFC </td></tr>
        
     <tr>  <td align="left" width="25%">&nbsp;</td>
     <td align="left" width="25%"> <input type="radio"  name="internetddl"  value="SBI">ICICI </td>
      <td align="left" width="25%"> <input type="radio"  name="internetddl"  value="SBI">INDIAN </td>
       <td align="left" width="25%"><input type="radio"  name="internetddl" value="SBI">PRATHMA </td></tr>
      <tr> <td align="left" width="25%">&nbsp;</td> 
      <td align="left" width="25%"> <input type="radio"  name="internetddl"  value="SBI">Oriental Bank of Commerce</td>
      <td align="left" width="25%"> <input type="radio"  name="internetddl"  value="SBI">UCO Bank </td>
      <td align="left" width="25%"> <input type="radio"  name="internetddl"  value="SBI">Union Bank of India</td></tr>
         <tr>   <td align="left" width="25%">&nbsp;</td>
             <td align="left" width="25%"><input type="radio"  name="internetddl" value="SBI">Allahabad Bank</td>
               <td align="left" width="25%">  <input type="radio"  name="internetddl"  value="SBI">Vijaya Bank</td>
               <td align="left" width="25%">  <input type="radio"  name="internetddl"  value="SBI">Allahabad Bank </td></tr>
                            
                     <tr><td colspan="4">&nbsp;</td></tr>
                     
                     
         <tr><td colspan="4" align="center"><input type="submit" value="Proceed to pay" class="btn btn-warning" >&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="reset" class="btn btn-warning" value="RESET"></td></tr></table>
         </div>
      <div id="mobile"   style="display: none;" >
                        <center><h3 style="color: #FE6847"><b>Payment By Credit Card</b></h3></center> 
      
    <table style="width: 100%">
<tr><td colspan="4">&nbsp;</td></tr>
<tr><td colspan="4">&nbsp;</td></tr>


<tr >
      
     <td align="left" width="25%"><h3 style="color: #FE6847">Choose Your Bank :</h3></td>
      <td align="left" width="25%"> <input type="radio"  name="mobileddl" value="SBI">Allahabad bank</td>
      <td align="left" width="25%"> <input type="radio"  name="mobileddl"  value="SBI">PNB </td>
       <td align="left" width="25%"><input type="radio"  name="mobileddl"  value="SBI">HDFC </td></tr>
        
     <tr>  <td align="left" width="25%">&nbsp;</td>
     <td align="left" width="25%"> <input type="radio"  name="mobileddl"  value="SBI">ICICI </td>
      <td align="left" width="25%"> <input type="radio"  name="mobileddl"  value="SBI">INDIAN </td>
       <td align="left" width="25%"><input type="radio"  name="mobileddl" value="SBI">PRATHMA </td></tr>
      <tr> <td align="left" width="25%">&nbsp;</td> 
      <td align="left" width="25%"> <input type="radio"  name="mobileddl"  value="SBI">Oriental Bank of Commerce</td>
      <td align="left" width="25%"> <input type="radio"  name="mobileddl"  value="SBI">SBI</td>
      <td align="left" width="25%"> <input type="radio"  name="mobileddl"  value="SBI">Union Bank of India</td></tr>
       
                     <tr><td colspan="4">&nbsp;</td></tr>
                     <%String id=(String) request.getAttribute("outletid"); %>
                     
         <tr><td colspan="4" align="center"><input type="hidden" name="outletid" value="<%=id%>"><input type="submit" value="Proceed to pay" class="btn btn-warning" >&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="reset" class="btn btn-warning" value="RESET"></td></tr></table>
      </div>
     
					

				<div class="clearfix"></div>

			</form>
		</div>
	</div>

<%@ include file="footer.jsp"%>

</body>
</html>

