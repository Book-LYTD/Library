<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>借阅列表</title>
<link rel="stylesheet" type="text/css" href="../css/student.css">
</head>
<script launage="JavaScript">
function check(){
	if (frm.readerid.value==""||frm.pwd.value==""){
		alert("借阅证号或密码不能为空！");
		frm.username.focus();
		return false;
	}
	return true;
}
</script>
<script>
<%
String loginFlag=request.getParameter("loginflag");
if(loginFlag==null){ //无登录失败标识，是正常访问登录页面
	loginFlag="";
}
if(loginFlag.equals("1")){
	out.println("alert('借阅证号不存在！')");
}else if(loginFlag.equals("2")){
	out.println("alert('密码错误！')");
}
%>
</script>
<body>
<div id="header" style="color:white;background-color:#0080c0">
             <img alt="图书借阅" /> 
</div>
<form name="frm" method="post" action="<%=request.getContextPath() %>/BorrowLoginAction">
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td>图书证号：<input name="readerid" type="text" id="userid"></td>
    <td>密码：<input name="pwd" type="password" id="pwd"></td>
    <td><input type="submit" value="提交" onclick="return check();"></td><td></td></tr></from>
<tr><td height="25" colspan="6" class="tb_showall" align="center">当前借阅列表</td></tr>
<tr calss="td_header">
<td>书名</td><td>书号</td><td>作者</td><td>借阅时间</td><td>归还时间</td>
</tr>
</table>
</body>
</html>