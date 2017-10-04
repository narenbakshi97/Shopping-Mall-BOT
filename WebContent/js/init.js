function analyze(){
		artyom.fatality();
		document.getElementById("mike").style.color = "#fff";
	}
	
	var speak = false;

	var d = setInterval(function(){
		if(artyom.isSpeaking()){
	    	speak = true;
		}
		else{
			speak = false;
		}
	},200);
	

		function proceed()
		{
			document.getElementById("mike").style.color = "red";

			setTimeout(function(){// if you use artyom.fatality , wait 250 ms to initialize again.
	         artyom.initialize({
	            lang:"en-US",// A lot of languages are supported. Read the docs !
	            continuous:false,// recognize 1 command and stop listening !
	            listen:true, // Start recognizing
	            debug:true, // Show everything in the console
	            speed:1 // talk normally
	        	}).then(function(){
	            	console.log("Ready to work !");
	        	});
	    	},250);
	}