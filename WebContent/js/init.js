function analyze(){
		artyom.fatality();
		artyom.initialize({
	        lang:"en-US", // Start recognizing
	        debug:false, // Show everything in the console
	        speed:1 // talk normally
	    	}).then(function(){
	        	console.log("Ready to speak !");
	    	});
		document.getElementById("mike").style.color = "#333";
	}
	
	var speak = false;

	var d = setInterval(function(){
		if(artyom.isSpeaking()){
	    	speak = true;
		}else{
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
		
		
		
		function hasGetUserMedia() {
			  return !!(navigator.getUserMedia || navigator.webkitGetUserMedia ||
			            navigator.mozGetUserMedia || navigator.msGetUserMedia);
			}