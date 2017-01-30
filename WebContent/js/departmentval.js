function Submit()
{
	var dnameError=checkdname();
	var davailabilityError=checkdstatus();
	if(dnameError==true && davailabilityError==true)
	{
	return true;
	}
else
	return false;
}

function checkdname()
{
var fname=document.form1.departmentname.value;
var name=/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
  if(fname=="")
    {
	document.getElementById("dname_error").innerHTML="Please enter department name";
	return false;
    }
  else if(!fname.match(name))
  {
  
	document.getElementById("dname_error").innerHTML="Please enter valid name";
	return false;
  
  }
   else
   {
	document.getElementById("dname_error").innerHTML=" ";
	return true;
   }

}
function checkdstatus()  
{  
if(document.form1.status.value =="select")  
{  
	document.getElementById("dstatus_error").innerHTML="Please select an option";
	return false; 
}  
else
{
	document.getElementById("dstatus_error").innerHTML=" ";
	return true;
}
}