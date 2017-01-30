function Submit(){
	var itemname=checkItemName();
	var itemprice=checkItemPrice();
	var quantity=checkItemQuantity();
	var flavor=checkItemFlavor();
	var status=checkItemStatus();
	var avail=checkItemAvailStatus();

	if(itemname==true&&itemprice==true&&quantity==true&&flavor==true&&status==true&&avail==true)
	{
	return true;
	}
else
	{
	return false;
	}	
}
	
	function checkItemName()
	{
	var itemName=document.form.itemname.value;
	var name=/^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-, ])*$/;
	  if(itemName=="")
	    {
		document.getElementById("itemname_error").innerHTML="Please enter item name";
		return false;
	    }
	  else if(!itemName.match(name))
	  {
	  
		document.getElementById("itemname_error").innerHTML="Please enter valid name";
		return false;
	  
	  }
	   else
	   {
		document.getElementById("itemname_error").innerHTML=" ";
		return true;
	   }
	}
	
	
	function checkItemPrice()
	{
		
		var itemPrice=document.form.price.value;
		
		var price=/^[0-9]+\.?[0-9]+$/;
		  if(itemPrice=="")
		    {
			document.getElementById("itemprice_error").innerHTML="Please enter price";
			return false;
		    }
		  else if(!itemPrice.match(price))
		  {
		  
			document.getElementById("itemprice_error").innerHTML="Please enter valid price";
			return false;
		  
		  }
		   else
		   {
			document.getElementById("itemprice_error").innerHTML=" ";
			return true;
		   }
	}
	
	function checkItemQuantity()
	{
		var itemQuantity=document.form.quantity.value;
		var quantity=/^[0-9]+$/;
		  if(itemQuantity=="")
		    {
			document.getElementById("itemquantity_error").innerHTML="Please enter quantity";
			return false;
		    }
		  else if(!itemQuantity.match(quantity))
		  {
		  
			document.getElementById("itemquantity_error").innerHTML="Please enter valid quantity";
			return false;
		  
		  }
		   else
		   {
			document.getElementById("itemquantity_error").innerHTML=" ";
			return true;
		   }
	}
	
	function checkItemFlavor()
	{
		var itemFlavor=document.form.flavor.value;
		var flavor=/^[a-zA-Z]+$/;
		  if(itemFlavor=="")
		    {
			document.getElementById("itemflavor_error").innerHTML="Please enter item flavor";
			return false;
		    }
		  else if(!itemQuantity.match(flavor))
		  {
		  
			document.getElementById("itemflavor_error").innerHTML="Please enter valid flavor";
			return false;
		  
		  }
		   else
		   {
			document.getElementById("itemquantity_error").innerHTML=" ";
			return true;
		   }
	}
	
	
	function checkItemStatus()
	{
		if(document.form.cancellationstatus.value == "select")
		{
			document.getElementById("itemstatus_error").innerHTML="Please select status";
			return false;
		    }
		else
			{
			document.getElementById("itemstatus_error").innerHTML="";
			return true;
			}
	}
	
	
	function checkItemAvailStatus()
	{
		if(document.form.availabilitystatus.value == "select")
		    {
			document.getElementById("itemavailstatus_error").innerHTML="Please select status";
			return false;
		    }
		else
			{
			document.getElementById("itemavailstatus_error").innerHTML="";
			return false;
			}
	}
	function checkDept()
	{
		var itemDept=document.form.dname1.value;
		
		  if(itemDept=="-1")
		    {
			document.getElementById("dname1_error").innerHTML="Please select department";
			return false;
		    }
	}
	function checkImage()
	{
		var uploadimage = document.form.image.value;
		if(uploadimage.match(/jpg$/) || uploadimage.match(/jpg$/))
			{
				document.getElementById("image_error").innerHTML=" ";
				return true;
			}
		else
			{
			document.getElementById("image_error").innerHTML="Please select file";
			return false;
			}
		
	}