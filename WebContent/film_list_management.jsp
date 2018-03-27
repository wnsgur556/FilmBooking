<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	DBController db = new DBController();
	ArrayList<Film> datas = db.getFilmList();
%>
<title>관리자용 영화 추가 및 삭제</title>
</head>
<body>
<center>
<jsp:useBean id="admin" class="Cinema.AdminLogin"></jsp:useBean>
<jsp:setProperty name="admin" property="*"></jsp:setProperty>
<table width="80%" cellpadding="3" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr align="center">
		<td bgcolor="peachpuff"><a href=insert_film.jsp><font size="2">Insert film</font></a></td>
		<td bgcolor="peachpuff"><a href=member_list_management.jsp><font size="2">Member management</font></a></td>
		<td bgcolor="peachpuff"><a href=film_list.jsp><font size="2">Logout</font></a></td>
	</tr>
</table> 
<table width="80%" cellpadding="5" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th><font color="MediumSlateBlue">Title</font></th>
		<th><font color="MediumSlateBlue">Age</font></th>
		<th><font color="MediumSlateBlue">Total seat</font></th>
		<th><font color="MediumSlateBlue">Date</font></th>
		<th><font color="MediumSlateBlue">Operation</font></th>
	</tr>
	<%
		for (Film data : (ArrayList<Film>)datas) {
	%>
	<tr align="center">
		<td><%= data.getTitle()%></td>
		<td><%= data.getAgePhase()%></td>
		<td><%= data.getSeatNum()%></td>
		<td><%= data.getDate()%></td>
		<td><a href="delete_film.jsp?idFilm=<%= data.getIdFilm()%>"><font size=2>Remove</font></a></td>
	</tr>
	<%
		}
	%>
</table>
</center>
</body>
</html>