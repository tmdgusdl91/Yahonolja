function categoryChange(e) {
        	var today = new Date();
        	var dd = String(today.getDate()).padStart(2, '0');
        	var mm = String(today.getMonth() + 1).padStart(2, '0');
        	
        	var i;
        	var good_a = [];
       		var good_b = [];
       		var good_c = [];
       		
        	  var target = document.getElementById("good");
        	  
        	  if(e.value == mm){
        		  for(i = dd; i <= 30; i++){
        	       		good_a.push(i);
        	       	}
        		  for(i = dd; i <= 31; i++){
        	       		good_b.push(i);
        	       	}
        		  for(i = dd; i <= 29; i++){
        	       		good_c.push(i);
        	       	}
        		  
        	  }else {
        		  for(i = 1; i <= 30; i++){
        	       		good_a.push(i);
        	       } 
        		  for(i = 1; i <= 31; i++){
        	       		good_b.push(i);
        	       }
        		  for(i = 1; i <= 29; i++){
        	       		good_c.push(i);
        	       }
        	  }
        	  if(e.value == 4 || e.value == 6 ||e.value == 9 || e.value == 11) 
        		  var d = good_a;
        	  else if(e.value == 1 || e.value == 3 ||e.value == 5 || e.value == 7 || e.value == 8 || e.value == 10 || e.value == 12) 
        		  var d = good_b;
        	  else if(e.value == 2) 
        		  var d = good_c;
        	 
        	  target.options.length = 0;
        	  
        	  for (x in d) {
        	    var opt = document.createElement("option");
        	    opt.value = d[x];
        	    opt.innerHTML = d[x];
        	    target.appendChild(opt);
        	  }
        	
        }
        
        function categoryChange1(e) {
        	var today = new Date();
        	var dd = String(today.getDate()).padStart(2, '0');
        	var mm = String(today.getMonth() + 1).padStart(2, '0');
        	
        	var i;
        	var good_a = [];
       		var good_b = [];
       		var good_c = [];
       		
        	  var target1 = document.getElementById("good1");
        	  
        	  if(e.value == mm){
        		  for(i = dd; i <= 30; i++){
        	       		good_a.push(i);
        	       	}
        		  for(i = dd; i <= 31; i++){
        	       		good_b.push(i);
        	       	}
        		  for(i = dd; i <= 29; i++){
        	       		good_c.push(i);
        	       	}
        		  
        	  }else {
        		  for(i = 1; i <= 30; i++){
        	       		good_a.push(i);
        	       } 
        		  for(i = 1; i <= 31; i++){
        	       		good_b.push(i);
        	       }
        		  for(i = 1; i <= 29; i++){
        	       		good_c.push(i);
        	       }
        	  }
        	  if(e.value == 4 || e.value == 6 ||e.value == 9 || e.value == 11) 
        		  var d = good_a;
        	  else if(e.value == 1 || e.value == 3 ||e.value == 5 || e.value == 7 || e.value == 8 || e.value == 10 || e.value == 12) 
        		  var d = good_b;
        	  else if(e.value == 2) 
        		  var d = good_c;
        	 
        	  target1.options.length = 0;
        	  
        	  for (x in d) {
        	    var opt = document.createElement("option");
        	    opt.value = d[x];
        	    opt.innerHTML = d[x];
        	    target1.appendChild(opt);
        	  }
        	
        }