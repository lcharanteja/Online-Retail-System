

var val=null;

function selectradio(value)
{
	val=value;
if(value=="atm")
	{
	document.getElementById("atm").style.display='block';
	document.getElementById("internet").style.display='none';
	document.getElementById("mobile").style.display='none';
	}
if(value=="netbanking")
{
document.getElementById("internet").style.display='block';
document.getElementById("atm").style.display='none';
document.getElementById("mobile").style.display='none';



}
if(value=="mobilebanking")
{
document.getElementById("internet").style.display='none';
document.getElementById("atm").style.display='none';
document.getElementById("mobile").style.display='block';


}

}

function checkatm()
{
     var pay=" ";
     var len=document.payment.atmddl.length;
     var i;
     for(i=0;i<len;i++)
     {
	if(document.payment.atmddl[i].checked)
	{
		pay=document.payment.atmddl[i].value;
		break;
	}
	}
	if(i==len)
	{
		alert('Please select a Bank');
		return false;
	}
	else
	{
		
		return true;		
	}
}

function checkinternet()
{
	
     var pay=" ";
     var len=document.payment.internetddl.length;
     var i;
     for(i=0;i<len;i++)
     {
	if(document.payment.internetddl[i].checked)
	{
		pay=document.payment.internetddl[i].value;
		break;
	}
	}
	if(i==len)
	{
		alert('Please select a Bank');
		return false;
	}
	else
	{
		
		return true;		
	}
}

function checkmobile()
{
     var payment=" ";
     var len=document.payment.mobileddl.length;
     var i;
     for(i=0;i<len;i++)
     {
	if(document.payment.mobileddl[i].checked)
	{
		payment=document.payment.mobileddl[i].value;
		break;
	}
	}
	if(i==len)
	{
		alert('Please select a Bank');
		return false;
	}
	else
	{
		
		return true;		
	}
};

function checkall()
{
	//alert(val);
	if(val=="atm")
	{
    if( checkatm())
    	return true;
    else
    	return false;
	}
	else if(val=="netbanking")
		{
		
		if( checkinternet())
	    	return true;
		  else
		    	return false;
		}
    else if(val=="mobilebanking")
    {
    	if( checkmobile())
	    	return true;
    	  else
    	    	return false;
    }
    
}


function validateQuantity(quan)
{
var v = document.itemindividual.quantity.value;
//alert(v);
var val=/^[0-9]+$/;
if(v==" ")
	{
	  document.getElementById("quan_error").innerHTML = "Please enter quantity.";
	//alert('Please select quantity.');
	return false;
	}
else if(!v.match(val))
	{
	  document.getElementById("quan_error").innerHTML = "Please enter numeric quantity.";
	//alert('Please select numeric quantity.');
	return false;

	}
else if(v==0)
{
	  document.getElementById("quan_error").innerHTML = "Please enter valid quantity.";
	//alert('Please select valid quantity.');
	return false;
}
else if(v>quan)
	{
	  document.getElementById("quan_error").innerHTML = "Please select quantity less than available quntity.";
	//alert('Please select quantity less than available quntity.');
	return false;

	
	
	}
else
	{
	  document.getElementById("quan_error").innerHTML = "&nbsp;";
	return true;

	
	}




}


