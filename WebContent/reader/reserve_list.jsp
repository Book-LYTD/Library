<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,book.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>预定列表</title>
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
             <img alt="图书预定" /> 
</div>
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td height="25" colspan="6" class="tb_showall" align="center">当前预定列表</td></tr>
<tr calss="td_header">
<td>书名</td><td>书号</td><td>作者</td><td>预约时间</td><td>状态</td><td>操作</td>
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
		%><td>借出</td><%
	}
	else{%>
		<td>未借</td><%
	}
	%>
	<td><a href="<%=request.getContextPath() %>/ReserveDeleteAction?id=<%=reservelist.get(i).getBookID()%>">解除预定</a></td></td>
	</tr>
	<%
}
%>
</table>
</body>
</html>