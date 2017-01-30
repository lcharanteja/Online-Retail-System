function Submit(){
	
	var inameError=checkiname();
	if(inameError)
	{
	return true;
	}
else
	return false;
}

function checkiname()  
{  
if(document.form.itemname.value =="select")  
{  
	document.getElementById("iname_error").innerHTML="Please select item name";
	return false; 
}  
else
{
	document.getElementById("iname_error").innerHTML=" ";
	return true;
}
}