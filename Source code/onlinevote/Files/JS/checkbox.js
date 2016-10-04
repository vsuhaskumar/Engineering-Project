 function checkboxval()
{
	
	var code=document.getElementsByName("code");
	
	var no=0;
	
	for(var i=0;i<code.length;i++)
	{
		if(code[i].checked)
			{
				no++;
			}
	}	
	if(no==0)
	{
		alert("You must Select atleast one checkbox");
		return false;
	}	
	else if (confirm('If you delete this district corresponding Candidates, manager, vote details will be deleted')) 
	{
	    return true;
	} else 
	{
	    return false;
	}
		
}
 
 function deletecandidate()
 {
 	
 	var code=document.getElementsByName("code");
 	
 	var no=0;
 	
 	for(var i=0;i<code.length;i++)
 	{
 		if(code[i].checked)
 			{
 				no++;
 			}
 	}	
 	if(no==0)
 	{
 		alert("You must Select atleast one checkbox");
 		return false;
 	}	
 	else if (confirm('If you delete this Candidate corresponding vote details will be deleted')) 
 	{
 	    return true;
 	} else 
 	{
 	    return false;
 	}
 		
 }  
 
 function deleteBooth()
 {
 	
 	var code=document.getElementsByName("code");
 	
 	var no=0;
 	
 	for(var i=0;i<code.length;i++)
 	{
 		if(code[i].checked)
 			{
 				no++;
 			}
 	}	
 	if(no==0)
 	{
 		alert("You must Select atleast one checkbox");
 		return false;
 	}	
 	else if (confirm('If you delete this Booth corresponding Manager, Voters and vote details will be deleted')) 
 	{
 	    return true;
 	} else 
 	{
 	    return false;
 	}
 		
 }  
 
 function checkboxvoter()
 {
 	
 	var code=document.getElementsByName("code");
 	
 	var no=0;
 	
 	for(var i=0;i<code.length;i++)
 	{
 		if(code[i].checked)
 			{
 				no++;
 			}
 	}	
 	if(no==0)
 	{
 		alert("You must Select atleast one checkbox");
 		return false;
 	}	
 }