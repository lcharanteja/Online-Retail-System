


function valall()
{
	
var name= validateName();
var cardno=  validateCardNumber();
var cardtype=validateCardType();

var validyear=validatExpire();
var cvv=validateCCV();
if(name & cardno & cardtype & validyear & cvv)
	{
	return true;
	
	}

return false;
}

function validateName(){
	var x=document.cardpayment.name.value;
	flag=true;
	if(x==""){
		flag=false;
		document.getElementById("n_error").innerHTML="Please enter First Name";
	}
	else{
		document.getElementById("n_error").innerHTML="&nbsp";
	}
	return flag;
}

function validateCardNumber()
{
	var x= document.cardpayment.ccnumber.value;
	var v= /^\d{16}$/; 
	flag=true;
	if(x=="")
	{
		flag=false;

        document.getElementById("c_error").innerHTML="Please enter Card Number";
	}
	else if(!v.test(x))	
	{
	flag=false;
	document.getElementById("c_error").innerHTML="Please enter 16 digit numeric value";	
	}
	else 
	{
		document.getElementById("c_error").innerHTML="&nbsp";
	}
	return flag;	
}

function validateCardType(){
	var v= document.cardpayment.cardtype.value;
	var flag= true;
	if(v=="select")
	{
		flag= false;
		document.getElementById("ct_error").innerHTML="Please select card type";
	}
	else
	{
		flag= true;
		document.getElementById("ct_error").innerHTML="&nbsp";
	}
	return flag;
}
function validatExpire(){

	var v= document.cardpayment.selectMonth.value;
	var v1= document.cardpayment.selectYear.value;
	var flag= true;
	if(v=="select"& v1!="select" )
	{
		flag= false;
		document.getElementById("mv_error").innerHTML="Please select Month";
	}
	else if(v!="select" & v1=="select")
	{
		flag= false;
		document.getElementById("mv_error").innerHTML="Please select Year.";
	}
	//return flag;
	else if(v=="select"& v1=="select")
	{
		flag= false;
		document.getElementById("mv_error").innerHTML="Please select Expire on.";
	}
	
	else if(v1==2014)
		{
		
		if(v<9)
			{
			
			document.getElementById("mv_error").innerHTML="Please use valid card.";

			
			}
		else
			{
			document.getElementById("mv_error").innerHTML="&nbsp";
			
			}
		
		}
	
	
	
	else
		{
		
		flag= true;
		document.getElementById("mv_error").innerHTML="&nbsp;";
		}

	return flag;
}

function validateCCV()
{
	var x= document.cardpayment.cvv.value;
	var v= /^\d{3}$/; 
	flag=true;
	if(x=="")
	{
		flag=false;

        document.getElementById("cc_error").innerHTML="Please enter ccv number";
	}
	else if(!v.test(x))	
	{
	flag=false;
	document.getElementById("cc_error").innerHTML="Please enter 3 digit numeric value";	
	}
	else 
	{
		document.getElementById("cc_error").innerHTML="&nbsp";
	}
	return flag;	
}













