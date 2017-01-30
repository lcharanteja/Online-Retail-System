function Submit(){
	
	var droptext=searchtext();
	if(droptext==true)
	{
	return true;
	}
else
	{
	return false;
	}	
}

function conform() {
	var ans=confirm("Are you sure you want to deactivate your profile");
    if(ans)
     {
         return true;
     }
    else
     {
          return false;
     }      
}
function search()
{
	var drop = document.form.mydropdown.value;
	if(drop=="-1")
		{
		document.getElementById("drop_error").innerHTML="Please select search option";
		return false;
		}
	
}
function searchtext()
{
	var field = document.form.text.value;
	if(field == "")
	{
		document.getElementById("field_error").innerHTML="Please give a search value";
		return false;
	}
	else
		{
		return true;
		}
}