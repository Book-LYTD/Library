<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>�޸�����</title>
<link rel="stylesheet" type="text/css" href="../css/student.css">
</head>
<script launage="JavaScript">
function check(){
	if (frm.readerid.value==""||frm.pwd.value==""||frm.pwd_1.value==""||frm.pwd_2.value==""){
		alert("����֤�Ż����벻��Ϊ�գ�");
		frm.readerid.focus();
		return false;
	}
	if(frm.pwd_1.value.length!=6){
		alert("����Ϊ6λ����");
		frm.pwd_1.focus();
		return false;
	}
	if(frm.pwd_1.value!=frm.pwd_2.value){
		alert("�������벻ƥ�䣡");
		frm.pwd_2.focus();
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
}else if(loginFlag.equals("0")){
	out.println("alert('�޸ĳɹ���')");
}
%>
</script>
<body>
<center>
<form name="frm" method="post" action="<%=request.getContextPath() %>/ReaderChangeAction">
<table border=1 width="45%"">
<tr class="td_header"><td colspan="2">���������޸ģ�<span class="star">*</span>Ϊ������</td></tr>
<tr><td>����֤�ţ�</td><td><input name="readerid" type="text" id="userid"><span class="star">*</span></td></tr>
<tr><td>ԭʼ���룺</td><td><input name="pwd" type="password" id="pwd"><span class="star">*</span></td></tr>
<tr><td>�����룺</td><td><input name="pwd_1" type="password" id="pwd_1"><span class="star">*</span></td></tr>
<tr><td>ȷ�����룺</td><td><input name="pwd_2" type="password" id="pwd_2"><span class="star">*</span></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="�ύ" onclick="return check();">
								   <input type="reset" value="����"></td></tr>
</table>
</form>
</center>
</body>
</html>