var d = new Date();
	var weekday = new Array(7);
	weekday[0] =  "Sunday";
	weekday[1] = "Monday";
	weekday[2] = "Tuesday";
	weekday[3] = "Wednesday";
	weekday[4] = "Thursday";
	weekday[5] = "Friday";
	weekday[6] = "Saturday";

	function calculateTime(){
		var date = new Date();
	        var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
	        var am_pm = date.getHours() >= 12 ? "PM" : "AM";
	        hours = hours < 10 ? "0" + hours : hours;
	        var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	        var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
	        time = hours + ":" + minutes + ":" + seconds + " " + am_pm;
	        return time;
	}

	function calculateWish(){
		var d = new Date();
		var curHr = d.getHours();
		if (curHr < 12) 
		{
			return "Morning";
		} 
		else if (curHr < 18) 
		{
			return "Afternoon";
		} 
		else 
		{
			return "Evening";
		}
	}