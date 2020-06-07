<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<link rel="stylesheet" href="css/menu_style.css" type="text/css">
<script type="text/javascript" src="datacheck.js"></script>
<title>我的图书馆</title>
</head>
<body link="#333333" vlink="#333333" alink="#FF0000" bgColor="#1fa5a2">
<div id="menuDiv" ></div>	 
</html>
<script> 
var classCount = 1; // 菜单大类的个数
function Show(theId) {
 	theTr = eval("tr_" + theId);
	//document.getElementById('tr_0');
	if (theTr.style.display == "none") {
		theTr.style.display = "block";
	}
	else {
		theTr.style.display = "none";
	}
	for (i = 0; i < classCount; i++) {
		if (i == theId)
			continue;
		theTr = eval("tr_" + i);
		theTr.style.display = "none";
	}
}


var menuList; 
menuList=[ 
	{"main":"我的图书馆","sub":[
		{"name":"我的预定","link":"ReserveListAction"},
		{"name":"我的借阅","link":"reader/borrow.jsp"},
		{"name":"修改密码","link":"reader/change_pwd.jsp"}]}
];

function createMenu(){	
	var strHtml="";
	strHtml+="<table class=\"guide guideText\" width=\"100%\">	";	 
	for( var i=0;i<menuList.length;i++){
		strHtml+="<TR><TD  id=\"td_"+i+"\"  align=\"center\" width=\"90%\" bgColor=\"#1f65c2\" ><A  href=\"javascript:Show("+i+")\">"+menuList[i]["main"]+"</A></TD></TR>";
		strHtml+=" <TR id=tr_"+i+" style=\"DISPLAY: none;cursor:hand\">";
		strHtml+=" 	<TD  width=\"100%\" align=\"center\"  bgColor=\"#4c84ce\" height=\"50\">";
		strHtml+=" 		<table align=\"center\" border=\"0\" width=\"90%\">";
		var submenu=menuList[i]["sub"];
	    for(var j=0;j<submenu.length;j++){ 
            strHtml+="<tr><td width=\"150\" align=\"center\" ><A href=\""+submenu[j]["link"]+"\" target=\"right_workspace\">"+submenu[j]["name"]+"</A> </td><tr>";
		}
	    strHtml+=" </table> </TD> </TR>";	
	}
	 strHtml+=" </table>";	
	 document.getElementById("menuDiv").innerHTML =strHtml;
}
createMenu();

</script>

