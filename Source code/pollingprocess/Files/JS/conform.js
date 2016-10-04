 function confirmvote(var vote)
{
	if(vote!=null)
	{		
		if (confirm('You VOTE for '+vote+' click Ok to CONFIRM')) 
		{
			return true;
		} 
		else 
		{
			return false;
		}
	}
	else
	{
		alert(" select voter first ");
	}
}
 
 