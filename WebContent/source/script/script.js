function showDiv(select){
	   if(select.value=="ins"){
	    document.getElementById('insForm').style.display = "block";
	    document.getElementById('entForm').style.display = "none";
	    document.getElementById('perForm').style.display = "none";
	   } else if(select.value=="ent"){
		   document.getElementById('insForm').style.display = "none";
		   document.getElementById('entForm').style.display = "block";
		   document.getElementById('perForm').style.display = "none";
	   } else if(select.value=="per"){
		   document.getElementById('insForm').style.display = "none";
		   document.getElementById('entForm').style.display = "none";
		   document.getElementById('perForm').style.display = "block";
	   } else {
		   document.getElementById('insForm').style.display = "none";
		   document.getElementById('entForm').style.display = "none";
		   document.getElementById('perForm').style.display = "none";
	   }
	}