
function Submit(){
	var fnameError = checkfname();
	var mnameError = checkmname();
	var lnameError = checklname();
	var email=checkemail();
	var gender=checkradio();
	var phone=checkphone();
	var pwd=checkpwd();
	var conpwd=checkconpwd();
	var date=checkdate();
	if(fnameError&mnameError&lnameError&email&gender&pwd&conpwd&date&phone)
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
	var fname=document.form.firstname.value;
	var name=/^[a-zA-Z]+$/;
	  if(fname=="")
	    {
		document.getElementById("fname_error").innerHTML="Please enter first name";
		return false;
	    }
	  else if(!fname.match(name))
	  {
	  
		document.getElementById("fname_error").innerHTML="Please enter valid last name";
		return false;
	  
	  }
	   else
	   {
		document.getElementById("fname_error").innerHTML=" ";
		return true;
	   }
	}
	function checkmname()
	{
	var mname=document.form.middlename.value;
	var name=/^[a-zA-Z]+$/;
	  if(mname=="")
	    {
		document.getElementById("mname_error").innerHTML="Please enter middle name";
		return false;
	    }
	  else if(!mname.match(name))
	  {
	  
		document.getElementById("mname_error").innerHTML="Please enter valid last name";
		return false;
	  
	  }
	   else
	   {
		document.getElementById("mname_error").innerHTML=" ";
		return true;
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
		  
		  document.getElementById("email_error").innerHTML = "enter the email";
		  return false;
		  }
		   else if(!/^[A-Za-z0-9._]+\@[A-Za-z]{3,9}\.[A-Za-z]{2,5}$/.test(email)){
		  
		  document.getElementById("email_error").innerHTML = "enter the valid email";
		  return false;
		  }
		   else
			   {
				  document.getElementById("email_error").innerHTML = "";

			   return true;
			   
			   }
	}
	function checkradio()
	{
	     var sex=" ";
	     var len=document.form.sex.length;
	     var i;
	     for(i=0;i<len;i++)
	     {
		if(document.form.sex[i].checked)
		{
			payment=document.form.sex[i].value;
			break;
		}
		}
		if(i==len)
		{
			document.getElementById("radio_error").innerHTML="Please select  gender option";
			return false;
		}
		else
		{
			document.getElementById("radio_error").innerHTML=" ";
			return true;		
		}
	}
	
	function checkphone()
	{
	var phone=document.form.phone.value;
	var ph=/^[789][0-9]+$/;
	  if(phone=="")
	    {
		document.getElementById("phone_error").innerHTML="Please enter mobile number";
		return false;
	    }
	  else if(!phone.match(ph))
		  {
		  
			document.getElementById("phone_error").innerHTML="Please enter valid mobile number";
            return false;
		  
		  }
	  else if(phone.length!=10)
		  {  
			document.getElementById("phone_error").innerHTML="Please enter valid length mobile number";
            return false;
		  }
	   else
	   {
		document.getElementById("phone_error").innerHTML=" ";
		return true;
	   }
	}
	
	function checkpwd()
	{
		
		pswd=document.form.password.value;
		var passw=/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;

	   if (pswd =="" )
			 {
		  //document.form.pwd.focus();
			  document.getElementById("pwd_error").innerHTML = "Please enter the password";
		  return false;
			  }
	   
	   else if(!pswd.match(passw))
		   {
		   
		   document.getElementById("pwd_error").innerHTML = "Please follow the password policy.";
			  return false;
		    }
	   
	   
	   
	   
		   else {
			  document.getElementById("pwd_error").innerHTML = "&nbsp; ";
		  return true;
	}
	}
	
	function checkconpwd()
	{
		
		pswd=document.form.conpassword.value;
		conpswd=document.form.password.value;

	   if (pswd =="" )
			 {
		  //document.form.pwd.focus();
			  document.getElementById("conpwd_error").innerHTML = "Please enter the password";
		  return false;
			  }
		   else if(!pswd.match(conpswd)) {
			  document.getElementById("conpwd_error").innerHTML = "Password doesnt match ";
			  return false;
		   }
		   else
			   {
			   document.getElementById("conpwd_error").innerHTML = "";
		  return true;
			   }
	}

	
	
	
	
	
	
//	function checkmonth()
//	{
//	var month=document.form.month.value;
//	  if(month=="")
//	    {
//		document.getElementById("birth_error").innerHTML="Please enter month name";
//		return false;
//	    }
//	   else
//	   {
//		document.getElementById("birth_error").innerHTML=" ";
//		return true;
//	   }
//	}
//
//	function checkday()
//	{
//	var month=document.form.day.value;
//	  if(month=="")
//	    {
//		document.getElementById("birth_error").innerHTML="Please enter day name";
//		return false;
//	    }
//	   else
//	   {
//		document.getElementById("birth_error").innerHTML=" ";
//		return true;
//	   }
//	}
//
//	function checkyear()
//	{
//	var month=document.form.year.value;
//	  if(month=="")
//	    {
//		document.getElementById("birth_error").innerHTML="Please enter month name";
//		return false;
//	    }
//	   else
//	   {
//		document.getElementById("birth_error").innerHTML=" ";
//		return true;
//	   }
//	}
//
//	  if(document.form.firstname.value != '' && document.form.lastName.value != '' && document.form.email.value != '' && document.form.pwd.value != '' && document.form.month.value != '' && document.form.day.value != '' && document.form.year.value != ''){
//	   document.getElementById("name_error").innerHTML = "form submitted successfully";
//	   }
//	     



function checkdate(){
	
	var input = document.form.date.value;
	var date= new Date();
	var todayyear=date.getFullYear();
	var todaymonth=date.getMonth()+1;
	var todayday=date.getDay();
	
var validformat=/^[0-9][0-9][0-9][0-9]\-[0-9][0-9]\-[0-9][0-9]$/ ;//Basic check for format validity
var returnval=false;
if (!validformat.test(input))
{
   document.getElementById("date_error").innerHTML = "Invalid Date. Please correct and submit again.";
}

else
{ 
var  yearfield=input.split("-")[0];
yearfields=yearfield;
var  monthfield=input.split("-")[1];
var dayfield=input.split("-")[2];
var dayobj = new Date(yearfield, monthfield-1, dayfield);
if ((dayobj.getMonth()+1!=monthfield)||(dayobj.getDate()!=dayfield)||(dayobj.getFullYear()!=yearfield))
	{
	//alert('hi');
	document.getElementById("date_error").innerHTML="Invalid Day, Month, or Year range detected. Please correct and submit again.";
	}
else if(todayyear-yearfields<18 )
	{
	returnval=false;
	document.getElementById("date_error").innerHTML="Age must be above 18 years.";
	
	}

	else
	{
		document.getElementById("date_error").innerHTML = "";
returnval=true;
//alert('pass');
	}

}


return returnval;


}


function Submitupdate(){
	var fnameError = checkfname();
	var mnameError = checkmname();
	var lnameError = checklname();
	
	var phone=checkphone();
	
	
	if(fnameError&mnameError&lnameError&phone)
		{
		return true;
		}
	else
		{
		return false;
		}	
}

function printPage(id) {
    var html="<html>";
    html+="<head>";
    html+="<style type='text/css'></style>";
  
    html+="</head>";
    html+= document.getElementById(id).innerHTML;
    html+="</html>";
    var printWin = window.open('','','left=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status =0');
    printWin.document.write(html);
    printWin.document.close();
    printWin.focus();
    printWin.print();
    printWin.close();

}
