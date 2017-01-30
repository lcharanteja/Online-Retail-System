function Submit(){
	var fnameError = checkfname();
	var cityError = checkcity();
	var stateError = checkstate();
	var zipError = checkzip();
	var availabilityError=checkstatus();
	
	if(fnameError==true&&cityError==true&&stateError==true&&zipError==true&&availabilityError==true)
		{
		return true;
		}
	else
		return false;
}


function checkfname()
	{
	var fname=document.form.outletname.value;
	var name=/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
	  if(fname=="")
	    {
		document.getElementById("fname_error").innerHTML="Please enter outlet name";
		return false;
	    }
	  else if(!fname.match(name))
	  {
	  
		document.getElementById("fname_error").innerHTML="Username must have alphabet characters only";
		return false;
	  
	  }
	   else
	   {
		document.getElementById("fname_error").innerHTML=" ";
		return true;
	   }
	
	}
function checkcity()
{
var fname=document.form.city.value;
var name=/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
  if(fname=="")
    {
	document.getElementById("city_error").innerHTML="Please enter city name";
	return false;
    }
  else if(!fname.match(name))
  {
  
	document.getElementById("city_error").innerHTML="City must have alphabet characters only";
	return false;
  
  }
   else
   {
	document.getElementById("city_error").innerHTML=" ";
	return true;
   }

}
function checkstate()
{
var fname=document.form.state.value;
var name=/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
  if(fname=="")
    {
	document.getElementById("state_error").innerHTML="Please enter state name";
	return false;
    }
  else if(!fname.match(name))
  {
  
	document.getElementById("state_error").innerHTML="State must have alphabet characters only";
	return false;
  
  }
   else
   {
	document.getElementById("state_error").innerHTML=" ";
	return true;
   }

}
function checkzip()
{
var fname=document.form.zipcode.value;
var numbers = /^[0-9]+$/;
  if(fname==" ")
    {
	document.getElementById("zip_error").innerHTML="Please enter zipcode";
	return false;
    }
  else if(!fname.match(numbers))
  {
  
	document.getElementById("zip_error").innerHTML="Please enter valid zipcode";
	return false;
  
  }
   else
   {
	document.getElementById("zip_error").innerHTML=" ";
	return true;
   }

}
function checkstatus()  
{  
if(document.form.status.value == "select")  
{  
	document.getElementById("status_error").innerHTML="Please select status";
	return false; 
}  
else
{
	document.getElementById("status_error").innerHTML=" ";
	return true;
}
}  
