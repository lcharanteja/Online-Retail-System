function Submit(){
	var dname1Error=checkdname1();
	if(dname1Error)
	{
	return true;
	}
else
	return false;
}

function checkdname1()  
{  
if(document.form.dname1.value =="select")  
{  
	document.getElementById("dname1_error").innerHTML="Please select department name";
	return false; 
}  
else
{
	document.getElementById("dname1_error").innerHTML=" ";
	return true;
}
}  