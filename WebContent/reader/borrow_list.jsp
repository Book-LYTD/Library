<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page import="java.util.*,book.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="GB18030">
<title>借阅列表</title>
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
             <img alt="图书借阅" /> 
</div>
<table width="100%" height="100" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td>图书证号：<input name="readerid" type="text" value="<%=reader.getCardNum() %>"></td>
    <td>密码：<input name="pwd" type="password" value="<%=reader.getPwd() %>"></td>
    <td><input type="submit" value="提交" onclick="return check();"></td><td></td></tr>
<tr><td height="25" colspan="6" class="tb_showall" align="center">当前借阅列表</td></tr>
<tr calss="td_header">
<td>书名</td><td>书号</td><td>作者</td><td>借阅时间</td><td>最长借阅时间</td>
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