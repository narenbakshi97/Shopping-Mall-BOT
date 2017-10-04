var item;
var price = [];
var total_amount = 0;
var lastFound = [], lastId;
var lastQty = 0;
var shoppinglist = [];
var contextVar = "normal";
var ans_str = "";
var tmp;
var arr_tmp = 0;
var bill = [];
artyom.addCommands([
	            {
	            	indexes:["where can I find *"],
	            	smart:true,
	            	action:function(i,wildcard,sentence){
	            			wildcard = check_substitute(wildcard);
	            			contextVar = "find";
	            			write(sentence);
	            			ajaxjax(wildcard,contextVar,null);
	            		}
	            },
	            {
	            	indexes:["number *"],
	            	smart:true,
	            	action:function(i,wildcard,sentence){
	            			var a = 0;
	            			wildcard = parseInt(check_substitute(wildcard));
	            			if(contextVar == "find"){
	            				contextVar = "findById";
	            				a = parseInt($('.'+wildcard).last().text());
	            				ajaxjax(a,contextVar,null);
	            			}
	            			else if(contextVar == "add"){
	            				contextVar = "addById";
	            				a = parseInt($('.'+wildcard).last().text());
	            				lastId = a;
	            				ajaxjax(a,contextVar,null);
	            			}
	            			else if(contextVar == "remove"){
	            				if(wildcard == NaN){
	            					artyom.say("Given input is not number");
	            				}
	            				var to_remove = parseInt(wildcard)-1;
	            				shoppinglist.splice(to_remove,1);
	            				artyom.say("Item removed successfully!");
	            				total_amount = 0;
	            				if(shoppinglist.length > 0){
	            					show_list();
	            				}
	            			}
	            			else if(contextVar == "changeQty"){
	            				arr_tmp = wildcard-1;
	            				contextVar  = "quantityChange";
	            				artyom.say("Ok index number " + wildcard + " choosed, now used quantity command");
	            			}
	            			
	            			write(sentence);
	            			
	            			//console.log("\n\n"+a+"\n\n");
	            			
	            		}
	            },
	            {
	            	indexes:["change quantity"],
	            	action:function(){
	            		write("Change Quantity");
	            		artyom.say("here is the list, use number command to choose the item");
	            		show_list();
	            		contextVar = "changeQty";
	            	}
	            },{
	            	indexes: ["offers in *"],
	            	smart:true,
	            	action:function(i,wildcard,sentence){
	            		write(sentence);
	            		contextVar = "offer";
	            		wildcard = check_substitute(wildcard);
	            		ajaxjax(wildcard,contextVar,null);
	            	}
	            },
	            {
	            	indexes:["what is the amount","whats the amount"],
	            	action:function(){
	            		write("What is the Amount");
	            		total_amount = calculate_amount();
	            		artyom.say("The total is rupees " + total_amount);
	            		history_string("The total is rupees " + total_amount);
	            	}
	            },
	            {
	            	indexes:["quantity *"],
	            	smart:true,
	            	action:function(i,wildcard,sentence){
	            		write(sentence);
	            		wildcard = parseInt(check_substitute(wildcard));
	            		if(contextVar  == "quantityChange"){
	            			if(check_bound(arr_tmp,wildcard)){
	            				shoppinglist[arr_tmp][5] = wildcard;
	            				artyom.say("Quantity changed to " + wildcard);
	            				show_list();
	            			}
	            			else{
	            				artyom.say("Quantity cannot bec changed, as it acceds the available amount.");
	            			}
	            		}
	            		else{
		            		contextVar = "quantityAdd";
	            			a = parseInt(wildcard);
	            			lastQty = a;
	            			ajaxjax(lastId,contextVar,wildcard);
	            		}
	            	}
	            },
	            {
	            	indexes:["delete list"],
	            	action:function(){
	            		write("Delete List");
	            		if(shoppinglist.length > 0){
	            			artyom.say("Are you sure you want to delete this list?");
	            			contextVar = "delete";
	            		}
	            		else{
	            			artyom.say("list is already empty");
	            		}
	            	}
	            },
	            {
	            	indexes:["yes","no"],
	            	action:function(i){
	            		if(i == 0 && contextVar == "delete"){
	            			write("Yes");
	            			shoppinglist = [];
	            			artyom.say("Okay deleted!");

	            		}
	            		else if(i == 1 && contextVar == "delete"){
	            			write("No");
	            			artyom.say("Okay, continuoing with the same list");
	            		}
	            		else if (contextVar == "confirm"){
	            			if(i == 0){
	            				//console.log("name:"+name+" and token:"+token);
	            				//console.log("shopping list: " + shoppinglist);
	            				artyom.say("Okay, list is sent to the staff member! Once it is done I will notify you, until then explore our clothing section area");
	            				
	            				for(var i = 0; i < shoppinglist.length; i++){
	            					bill.push(shoppinglist[i][0]);
	            					bill.push(shoppinglist[i][5]);
	            				}
	            				var json = bill.join(',');
	            				//console.log(json);
	            				
	            				
	            				
	            				$.ajax({
	            				    url:"Process",
	            				    type:"POST",
	            				    dataType:'json',
	            				    data: {json:json,type:"confirm","customer":name,"tokenId":token},
	            				    success:function(data){
	            				        artyom.say("hello!");
	            				    }	
	            				});
	            				shoppinglist = [];
	            				bill = [];
	            				contextVar = "normal";
	            				total_amount = 0;
	            			}
	            			else{
	            				artyom.say("Okay, let me know when you want to confirm the list.");
	            				
	            			}
	            		}
	            	}
	            },
	            {
	            	indexes:["add *","insert *"],
	            	smart:true,
	            	action:function(i,wildcard,sentence){
	            			contextVar = "add";
	            			wildcard = check_substitute(wildcard);
	            			write(sentence);
	            			checkList();
	            			ajaxjax(wildcard,contextVar,null);
	            		}
	            },
	            {
	            	indexes:["remove item"],
	            	action:function(){
	            		contextVar = "remove";
	            		write("Remove item");
	            		if(shoppinglist.length == 0){
            				artyom.say("You don't have added anything to your list yet!");
            			}
            			else{
            				artyom.say("Here is the list, use number command and say the index number of the item");
            				show_list();
            			}
	            	}
	            },
	            {
	            	indexes:["make a list"],
	            	action:function(){
	            			write("Make a list");
	            			//console.log("\n\n"+shoppinglist.length+"\n\n");
	            			if(shoppinglist.length <= 0){
	            				artyom.say("Okay! I am ready with my pen and paper. To add an item use add itemname command, to remove use remove index number of the item command. To coplete shopping use command confirm list.");
	            			}
	            			else{
	            				artyom.say("Ya I am on it, tell me which thing to  add next! tell me! tell me! tell me!");
	            			}
	            		}
	            },
	            {
	            	indexes:["show list"],
	            	action:function(){
	            			write("Show list");
	            			if(shoppinglist.length == 0){
	            				artyom.say("You don't have added anything in your list to show yet!");
	            			}
	            			else{
	            				artyom.say("Here is the list");
	            				show_list();
	            			}
	            		}
	            		
	            },
	            {
	            	indexes:["confirm list"],
	            	action:function(){
	            		write("Confirm List");
	            		if(shoppinglist.length == 0){
            				artyom.say("Your list is empty, add something to send it to staff!");
            			}
            			else{
            				artyom.say("Are you sure you want to confirm the list? here is the list, use yes or no command");
            				contextVar = "confirm";
            				show_list();
            			}
	            	}
	            },
	            {
	            	indexes:["logout","log out"],
	            	action: function(){
	            		$.ajax({
	            			url: 'login',
	            			data: {name: "logout", token: token},
	            			dataType: "text",
	            			type: 'POST',
	            			error: function(){
	            				artyom.say("Error occured in logout procedure");
	            			},
	            			success: function(){
	            				artyom.say("Thankyou "+name+", visit again!");
	    	            		window.open('index.jsp','_self');
	            			}
	            		});
	            	}
	            }]);

function ajaxjax(item,type,quantity){
	var dataToBeSent = {
			find : item,
			type : type,
			quantity: quantity
	};
	

	
	$.getJSON('Process',dataToBeSent, function(responseText) {
		//console.log(shoppinglist);
		artyom.say(responseText[0]+".");
		history_string(responseText[0]);
    	ans_str = responseText[1];
		if(contextVar == "find" || contextVar == "findById" || contextVar == "add" || contextVar == "addById"){
        	if(ans_str != ""){
        		setTimeout(function(){
    				list_str = "<table><tr><th>Index</th><th>Image</th><th>Brand</th><th>Name</th><th>Weight</th><th>Price in rupees</th></tr>";
    				for(var e = 0; e < ans_str.length; e++){
    					list_str += "<tr><td class='hidden "+ans_str[e].index+"'>"+ans_str[e].id+"</td><td>"+ans_str[e].index+"</td><td><img class='img-responsive' style='max-width:150px;max-height:150px;' src='"+ans_str[e].image+"'></td><td>"+ans_str[e].brand+"</td><td>"+ans_str[e].name+"</td><td>"+ans_str[e].weight+"</td><td>"+ans_str[e].price+".00/-</td></tr>";
    				}
    				list_str += "</table>";
    				history_list(list_str);
    			},500);
			}
        	if(contextVar == "addById"){
        		artyom.say("how much quantity?");
        		lastFound = ans_str;
        		//console.log(lastFound);
        	}
		}
		else if(contextVar == "quantityAdd"){
				if(responseText[0] != "Sorry, we don't have available the item in that much quantity"){
					quant = lastQty;
					shopping_item(lastFound[0].id,lastFound[0].image,lastFound[0].index,lastFound[0].name,lastFound[0].weight,quant,parseInt(lastFound[0].price),lastFound[0].quantity);
				}
		}
	})	
	
}



function shopping_item(id,image,index,name,weight,quantity,price,quantity_avail){
	shoppinglist.push([id,image,index,name,weight,quantity,price,quantity_avail]);
}

function show_list(){
	setTimeout(function(){
		list_str = "<table><tr><th>Index</th><th>Image</th><th>Name</th><th>Weight</th><th>Quantity</th><th>Price in rupees</th></tr>";
		for(var e = 0; e < shoppinglist.length; e++){
			price[e] = shoppinglist[e][5]*shoppinglist[e][6];
			list_str += "<tr><td class='hidden "+shoppinglist[e][2]+"'>"+shoppinglist[e][0]+"</td><td>"+(e+1)+"</td><td><img src='"+shoppinglist[e][1]+"' class='img-responsive' style='max-width:50px;max-height:50px;'></td><td>"+shoppinglist[e][3]+"</td><td>"+shoppinglist[e][4]+"</td><td>x"+shoppinglist[e][5]+"</td><td>"+shoppinglist[e][6]+".00/- x"+shoppinglist[e][5]+" = "+price[e]+"</td></tr>";
		}
		list_str += "<tr><td>Total</td><td colspan='4' style='text-align:right;'>"+calculate_amount();+"/-</td></tr>";
		list_str += "</table>";
		history_list(list_str);
	},500);
}

function check_bound(arr_index,new_quant){
	if(new_quant <= shoppinglist[arr_index][7]){
		return true;
	}
	else{
		return false;
	}
}

function check_substitute(wildcard){
	if(wildcard == 't'){
		wildcard = 'tea';
	}
	else if(wildcard == 'to'){
		wildcard = '2';
	}
	return wildcard;
}

function calculate_amount(){
	total_amount = 0;
	//console.log("Amount: "+total_amount);
	for(var e = 0; e < price.length; e++){
		total_amount += price[e];
	}
	return total_amount;
}

function myFunction(){
window.setInterval(calculate_amount,500);
}