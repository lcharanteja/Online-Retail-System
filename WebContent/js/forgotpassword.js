function Submit(){
	
	var lnameError = checklname();
	var email=checkemail();
	
	if(lnameError&email)
		{
		return true;
		}
	else
		{
		return false;
		}	
}


function checklname()
	{
	var lname=document.form.lastname.value;
	var name=/^[a-zA-Z]+$/;
	  if(lname=="")
	    {
		document.getElementById("lname_error").innerHTML="Please enter last name";
		return false;
	    }
	  else if(!lname.match(name))
		  {
		  
			document.getElementById("lname_error").innerHTML="Please enter valid last name";
			return false;
		  
		  }
	   else
	   {
		document.getElementById("lname_error").innerHTML=" ";
		return true;
	   }
	}
	function checkemail()
	{
	var email=document.form.email.value;
	   if (email == "" )
		 {
		  
		  document.getElementById("email_error").innerHTML = "Please enter your email";
		  return false;
		  }
		   else if(!/^[A-Za-z0-9._]+\@[A-Za-z]{3,9}\.[A-Za-z]{2,5}$/.test(email)){
		  
		  document.getElementById("email_error").innerHTML = "Please enter the valid email";
		  return false;
		  }
		   else
			   {
				  document.getElementById("email_error").innerHTML = "";

			   return true;
			   
			   }
	}