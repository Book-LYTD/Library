<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>�����б�</title>
<link rel="stylesheet" type="text/css" href="../css/student.css">
</head>
<script launage="JavaScript">
function check(){
	if (frm.readerid.value==""||frm.pwd.value==""){
		alert("����֤�Ż����벻��Ϊ�գ�");
		frm.username.focus();
		return false;
	}
	return true;
}
</script>
<script>
<%
String loginFlag=request.getParameter("loginflag");
if(loginFlag==null){ //�޵�¼ʧ�ܱ�ʶ�����������ʵ�¼ҳ��
	loginFlag="";
}
if(loginFlag.equals("1")){
	out.println("alert('����֤�Ų����ڣ�')");
}else if(loginFlag.equals("2")){
	out.println("alert('�������')");
}
%>
</script>
<body>
<div id="header" style="color:white;background-color:#0080c0">
             <img alt="ͼ�����" /> 
</div>
<form name="frm" method="post" action="<%=request.getContextPath() %>/BorrowLoginAction">
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td>ͼ��֤�ţ�<input name="readerid" type="text" id="userid"></td>
    <td>���룺<input name="pwd" type="password" id="pwd"></td>
    <td><input type="submit" value="�ύ" onclick="return check();"></td><td></td></tr></from>
<tr><td height="25" colspan="6" class="tb_showall" align="center">��ǰ�����б�</td></tr>
<tr calss="td_header">
<td>����</td><td>���</td><td>����</td><td>����ʱ��</td><td>�黹ʱ��</td>
</tr>
</table>
</body>
</html>