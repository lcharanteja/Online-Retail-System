var v= null;
function configureddl(value)
{
 v= value;
if(value=="outletname")
	{
	document.getElementById("outletname").style.display='block';
	document.getElementById("zipcode").style.display='none';
         document.getElementById("city").style.display='none';
         document.getElementById("state").style.display='none';
	

	
	}

if(value=="state")
	{
	document.getElementById("outletname").style.display='none';
	document.getElementById("zipcode").style.display='none';
         document.getElementById("city").style.display='none';
         document.getElementById("state").style.display='block';
	

	
	}
if(value=="city")
	{
		document.getElementById("outletname").style.display='none';
		document.getElementById("zipcode").style.display='none';
         document.getElementById("city").style.display='block';
         document.getElementById("state").style.display='none';
	

	
	}
if(value=="zipcode")
	{
	document.getElementById("outletname").style.display='none';
	document.getElementById("zipcode").style.display='block';
         document.getElementById("city").style.display='none';
         document.getElementById("state").style.display='none';
	

	
	}
}

function validatsearch()
{
	
	if(v=="outletname")
		{
		
		var s= document.form.searchname.value;
		
		if(s.match("select"))
			{
			
			document.getElementById("outlet_error").innerHTML = "Please select the outlet name";
			return false;
			}
		else
			{
			
			document.getElementById("outlet_error").innerHTML = "";
			
			return true;
			}
		
		}
	
	else if(v=="state")
{
		var s= document.form.searchstate.value;

		
		if(s.match("select"))
			{
			
			  document.getElementById("outlet_error1").innerHTML = "Please select the state";
			  return false;
			
			}
		else
		{
		
		document.getElementById("outlet_error1").innerHTML = "";
		return true;
		}
		
		}
	else if(v=="city")
	{
		var s= document.form.searchcity.value;

			
			if(s.match("select"))
				{
				
				document.getElementById("outlet_error2").innerHTML = "Please select the city";
				return false;
				}
			else
			{
			
			document.getElementById("outlet_error2").innerHTML = "";
			return true;
			}
			
			}
	else if(v=="zipcode")
	{
		var s= document.form.searchzip.value;

			
			if(s.match("select"))
				{
				
				document.getElementById("outlet_error3").innerHTML = "Please select the zipcode";
				return false;
				
				}
			else
			{
			
			document.getElementById("outlet_error3").innerHTML = "";
			return true;
			}
			
			}




}




function checkmail(v)
{
	
	

  var email=document.form.email.value;
//alert(email);
   if (email == "" )
	 {
	  
	  document.getElementById("email_error").innerHTML = "Please enter the email";
	 
	  return false;
	  }
	   else if(!/^[A-Za-z0-9._]+\@[A-Za-z]{3,9}\.[A-Za-z]{2,5}$/.test(email)){
	  
	  document.getElementById("email_error").innerHTML = "Please enter the valid email";
		 
	  return false;
	 
	  }
	   else
		   {
			  document.getElementById("email_error").innerHTML = "&nbsp;";
             
		   return true;
		   
		   }
	
}


function valall(vm)
{
	
flag=false;



if(vm.match("null"))
	{
	
		if(validatsearch()&checkmail(vm)){
		
	flag=true;
	
	}
	}
else
	{
	
	if(validatsearch()){
		
		flag=true;
		
		}
	}

return flag;

}



function valoutlet()
{
	
if(validatsearch())
return true;

else
	return false;




}
