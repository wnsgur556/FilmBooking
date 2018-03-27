<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	DBController db = new DBController();
	ArrayList<Member> datas = db.getMemList();
%>
<title>관리자용 회원 목록 관리 및 삭제</title>
</head>
<body>
<center>
<table width="80%" cellpadding="3" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr align="center">
		<td bgcolor="peachpuff"><a href=film_list_management.jsp><font size="2">Back</font></a></td>
		<td><font size="2">Member management</font></td>
		<td bgcolor="peachpuff"><a href=film_list.jsp><font size="2">Logout</font></a></td>
	</tr>
</table> 
<table width="80%" cellpadding="5" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th><font color="MediumSlateBlue">ID</font></th>
		<th><font color="MediumSlateBlue">Age</font></th>
		<th><font color="MediumSlateBlue">Registration date</font></th>
		<th><font color="MediumSlateBlue">Operation</font></th>
	</tr>
	<%
		for (Member data : (ArrayList<Member>)datas) {
	%>
	<tr align="center">
		<td><%= data.getID()%></td>
		<td><%= data.getAge()%></td>
		<td><%= data.getRegisterDate()%></td>
		<td><a href="delete_member.jsp?idMem=<%= data.getIdMem()%>")><font size=2>Remove</font></a></td>
	</tr>
	<%
		}
	%>
</table>
</center>
</body>
</html>