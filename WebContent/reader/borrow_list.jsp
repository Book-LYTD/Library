<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,book.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>�����б�</title>
<link rel="stylesheet" type="text/css" href="../css/student.css">
</head>
<%
ReaderInfo reader=(ReaderInfo)session.getAttribute("ReaderInfo");
ArrayList<BorrowInfo> borrowlist=(ArrayList<BorrowInfo>)session.getAttribute("BorrowList");
session.removeAttribute("BorrowList");
if(borrowlist==null){
	borrowlist=new ArrayList<BorrowInfo>();
}
%>
<body>
<div id="header" style="color:white;background-color:#0080c0">
             <img alt="ͼ�����" /> 
</div>
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td>ͼ��֤�ţ�<input name="readerid" type="text" value="<%=reader.getCardNum() %>"></td>
    <td>���룺<input name="pwd" type="password" value="<%=reader.getPwd() %>"></td>
    <td><input type="submit" value="�ύ" onclick="return check();"></td><td></td></tr>
<tr><td height="25" colspan="6" class="tb_showall" align="center">��ǰ�����б�</td></tr>
<tr calss="td_header">
<td>����</td><td>���</td><td>����</td><td>����ʱ��</td><td>�����ʱ��</td>
</tr>
<%
for(int i=0;i<borrowlist.size();i++){
	%>
	<tr class="td_<%=(i%2+1) %>">
	<td><%=borrowlist.get(i).getName() %></td>
	<td><%=borrowlist.get(i).getBookID() %></td>
	<td><%=borrowlist.get(i).getAuthor() %></td>
	<td><%=borrowlist.get(i).getDate() %></td>
	<td><%=borrowlist.get(i).getMaxLendDay() %></td>
	</tr>
	<%
}
%>
</table>
</body>
</html>