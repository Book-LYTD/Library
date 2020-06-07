<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="../css/student.css">
</head>
<script launage="JavaScript">
function check(){
	if (frm.readerid.value==""||frm.pwd.value==""||frm.pwd_1.value==""||frm.pwd_2.value==""){
		alert("借阅证号或密码不能为空！");
		frm.readerid.focus();
		return false;
	}
	if(frm.pwd_1.value.length!=6){
		alert("密码为6位数！");
		frm.pwd_1.focus();
		return false;
	}
	if(frm.pwd_1.value!=frm.pwd_2.value){
		alert("两次密码不匹配！");
		frm.pwd_2.focus();
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
}else if(loginFlag.equals("0")){
	out.println("alert('修改成功！')");
}
%>
</script>
<body>
<center>
<form name="frm" method="post" action="<%=request.getContextPath() %>/ReaderChangeAction">
<table border=1 width="45%"">
<tr class="td_header"><td colspan="2">读者密码修改，<span class="star">*</span>为必填项</td></tr>
<tr><td>借阅证号：</td><td><input name="readerid" type="text" id="userid"><span class="star">*</span></td></tr>
<tr><td>原始密码：</td><td><input name="pwd" type="password" id="pwd"><span class="star">*</span></td></tr>
<tr><td>新密码：</td><td><input name="pwd_1" type="password" id="pwd_1"><span class="star">*</span></td></tr>
<tr><td>确认密码：</td><td><input name="pwd_2" type="password" id="pwd_2"><span class="star">*</span></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="提交" onclick="return check();">
								   <input type="reset" value="重置"></td></tr>
</table>
</form>
</center>
</body>
</html>