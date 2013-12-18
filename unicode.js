window.onload= function() { 

i=1536;
var tr,td,tbl = document.createElement('table'); 
head = tbl.createTHead(); 
head.appendChild(document.createElement('th')); 


Array.apply(null, {length:16}).map(Function.call, Number).map(function(i) {
		var th = document.createElement('th');
		th.appendChild(document.createTextNode(i.toString(16).toUpperCase()));
		head.appendChild(th);
		}); 

while (i<1792) {
if (i%16 == 0 ) { tr = tbl.insertRow(-1);  
	var cell=tr.insertCell(-1); 
	cell.setAttribute("id", "rowhead"); 
	cell.appendChild(document.createTextNode('06'+(i/16-96).toString(16).toUpperCase()));
		} 
		
td=tr.insertCell(-1); 
td.appendChild(document.createTextNode(String.fromCharCode(i))); 
i++; 
}//while 	

document.getElementById('table').appendChild(tbl); 
english(); 
}//window.onload() 

function english() {
	var eng = document.getElementById('english');
		var returnVal="";
		for (i=33;i<127;i++) returnVal+=String.fromCharCode(i);  
		for (i=192; i<592; i++) returnVal+=String.fromCharCode(i);  
	eng.innerHTML= returnVal; 

}//english() 
