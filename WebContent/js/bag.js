
var images = {};

loadImage("bag");
loadImage("eyebrows1");
loadImage("eyebrows2");
loadImage("eyes-close");
loadImage("eyes-open");
loadImage("smile1");
loadImage("smile2");
loadImage("smile3");
loadImage("smile4");

function loadImage(name) {

  images[name] = new Image();
  images[name].onload = function() { 
      resourceLoaded();
  }
  images[name].src = "images/" + name + ".png";
}




var totalResources = 9;
var numResourcesLoaded = 0;
var fps = 10;

function resourceLoaded() {

  numResourcesLoaded += 1;
  if(numResourcesLoaded === totalResources) {
    setInterval(redraw, 2500 / fps);
  }
}





var context = document.getElementById('canvas').getContext("2d");




// eye animation
var close = false;
var a = setInterval(function(){
	
		setTimeout(function(){
			close=false;
		},200);
		close=true;
	
},3000);

// eyebrow animation
var changeEyebrows = false;
var b = setInterval(function(){

	setTimeout(function(){changeEyebrows=false;},500);
	changeEyebrows = true;

},10000);


var d;
var i = 0;

var w = 700;
var h = 500;


  
function redraw() {


  canvas.width = canvas.width; // clears the canvas 
                      
  context.drawImage(images["bag"], -100, 0,w/1.2,h/1.2);

  if (changeEyebrows == false)
  {
	  context.drawImage(images["eyebrows1"], -110, 0,w/1.2,h/1.2);
  }
  else
  {
  	context.drawImage(images["eyebrows2"], -110, 0,w/1.2,h/1.2);	
  }
  if(close == false)
  {
  	context.drawImage(images["eyes-open"], -110, 0,w/1.2,h/1.2);
  }
  else
  {
  	context.drawImage(images["eyes-close"], -110, 0,w/1.2,h/1.2);
  }
  if(speak == false)
  {
	context.drawImage(images["smile1"], -120, 0,w/1.2,h/1.2);
  }
  else
  {
	//console.log("speaking... " + i)	;
	context.drawImage(images["smile"+(i%4 + 1)], -120, 0,w/1.2,h/1.2);
	doAdelay();
	i++;
  }
}

function doAdelay()
{
	setTimeout(function(){/*console.log("hey! waiting!!");*/return true;},1000);
}