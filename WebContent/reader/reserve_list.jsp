<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,book.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>Ԥ���б�</title>
<link rel="stylesheet" type="text/css" href="../css/student.css">
</head>
<%
ArrayList<ReserveInfo> reservelist=(ArrayList<ReserveInfo>)session.getAttribute("ReserveList");
session.removeAttribute("ReserveList");
if(reservelist==null){
	reservelist=new ArrayList<ReserveInfo>();
}
%>
<body>
<div id="header" style="color:white;background-color:#0080c0">
             <img alt="ͼ��Ԥ��" /> 
</div>
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td height="25" colspan="6" class="tb_showall" align="center">��ǰԤ���б�</td></tr>
<tr calss="td_header">
<td>����</td><td>���</td><td>����</td><td>ԤԼʱ��</td><td>״̬</td><td>����</td>
</tr>
<%
for(int i=0;i<reservelist.size();i++){
	%>
	<tr class="td_<%=(i%2+1) %>">
	<td><%=reservelist.get(i).getName() %></td>
	<td><%=reservelist.get(i).getBookID() %></td>
	<td><%=reservelist.get(i).getAuthor() %></td>
	<td><%=reservelist.get(i).getDate() %></td>
	<%
	if(reservelist.get(i).getSendFlag()==1){
		%><td>���</td><%
	}
	else{%>
		<td>δ��</td><%
	}
	%>
	<td><a href="<%=request.getContextPath() %>/ReserveDeleteAction?id=<%=reservelist.get(i).getBookID()%>">���Ԥ��</a></td></td>
	</tr>
	<%
}
%>
</table>
</body>
</html>