function history_string(a)
{
	$("#history").append("<div class='text-left chat text-left robot col-lg-6 col-md-6 col-xs-10'><div class='text-left text-primary h4'><b>SHOPPY</b></div><div style='font-size:18px;' class='text-primary'><p>"+a+"</p></div><div class='text-right'>"+calculateTime()+"</div></div><div class='col-lg-6 col-md-6 col-xs-2'><br><br><br><br><br><br></div><div class='col-lg-12 col-md-12 col-xs-12'><br><br><br></div>");
}
function history_list(a)
{
	$("#history").append("<div class='text-left chat text-left robot col-lg-12 col-md-12 col-xs-12'><div class='text-left text-primary h4'><b>SHOPPY</b></div><div style='font-size:18px;' class='text-primary'><p>"+a+"</p></div><div class='text-right'>"+calculateTime()+"</div></div><div class='col-lg-12 col-md-12 col-xs-2'><br><br><br><br><br><br></div><div class='col-lg-12 col-md-12 col-xs-12'><br><br><br></div>");
}
function history_ques(b)
{
	$("#history").append("<div class='col-lg-6 col-md-6 col-xs-2'><br><br><br><br><br><br></div><div class='chat user col-lg-6 col-md-6 col-xs-10'><div class='text-left text-success h4'><b>"+name+"</b></div><div style='font-size:18px;' class='text-success'><p>"+b+"</p></div><div class='text-right'>"+calculateTime()+"</div></div><div class='col-lg-12 col-md-12 col-xs-12'><br><br><br></div>");
}
function write(sentence)
{
	document.getElementById("search").value = sentence;
	history_ques(sentence);
}
function timeout(str){
	setTimeout(history_string(str),500);
}