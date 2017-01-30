function Submit(){
	var fnameError = checkfname();	
	var emailError=checkemail();
	var subError = checksub();

	
	if(fnameError==true&&emailError==true&&subError==true)
		{
		return true;
		}
	else
		{
		return false;
		}	
}
function checkfname()
{
var fname=document.helpform.userName.value;
var name=/^[a-zA-Z, ]+$/;
  if(fname=="")
    {
	document.getElementById("fname_error").innerHTML="Please enter name";
	return false;
    }
  else if(!fname.match(name))
  {
  
	document.getElementById("fname_error").innerHTML="Please enter valid name";
	return false;
  
  }
   else
   {
	document.getElementById("fname_error").innerHTML=" ";
	return true;
   }
}

function checkemail()
{
var email=document.helpform.userEmail.value;
   if (email == "" )
	 {
	  
	  document.getElementById("email_error").innerHTML = "Please enter email";
	  return false;
	  }
	   else if(!/^[A-Za-z0-9._]+\@[A-Za-z]{3,9}\.[A-Za-z]{2,5}$/.test(email)){
	  
	  document.getElementById("email_error").innerHTML = "Please enter valid email";
	  return false;
	  }
	   else
		   {
			  document.getElementById("email_error").innerHTML = "";

		   return true;
		   
		   }
}
function checksub()
{
var fname=document.helpform.userSub.value;
var name=/^[A-Za-z0-9._, ]+$/;
  if(fname=="")
    {
	document.getElementById("sub_error").innerHTML="Please enter subject";
	return false;
    }
  else if(!fname.match(name))
  {
  
	document.getElementById("sub_error").innerHTML="Please enter valid subject name";
	return false;
  
  }
   else
   {
	document.getElementById("sub_error").innerHTML=" ";
	return true;
   }
}
function checkmsg()
{
var fname=document.helpform.firstname.value;
var name=/^[A-Za-z0-9._, ]+$/;
  if(fname=="")
    {
	document.getElementById("msg_error").innerHTML="Please enter message";
	return false;
    }
  else if(!fname.match(name))
  {
  
	document.getElementById("msg_error").innerHTML="Please enter message";
	return false;
  
  }
   else
   {
	document.getElementById("msg_error").innerHTML=" ";
	return true;
   }
}