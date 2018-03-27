<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	DBController db = new DBController();
	ArrayList<Film> datas = db.getFilmList();
%>
<title>상영 영화 리스트</title>
</head>
<body>
<center>
<H2>상영 영화 리스트</H2>
<div style="position: relative;"><a href=login_admin.jsp><font size="2">관리자 로그인</font></a></div>
<BR>
<table width="80%" cellpadding="6" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th><font color="MediumSlateBlue">타이틀</font></th>
		<th><font color="MediumSlateBlue">이미지</font></th>
		<th><font color="MediumSlateBlue">관람가</font></th>
		<th><font color="MediumSlateBlue">총 좌석수</font></th>
		<th><font color="MediumSlateBlue">상영기간</font></th>
		<th><font color="MediumSlateBlue">예매</font></th>
	</tr>
	<%
		for (Film data : (ArrayList<Film>)datas) {
	%>
	<tr align="center">
		<td bgcolor="MintCream"><%= data.getTitle()%></td>
		<td><img src=<%= data.getImageUrl()%> width="60" height="90"></td>
		<td bgcolor="MintCream"><%= data.getAgePhase()%>세 이용가</td>
		<td><%= data.getSeatNum()%></td>
		<td bgcolor="MintCream"><%= data.getDate()%></td>
		<td>
			<form name=form1 method=post action="login_member.jsp">
			<input type="hidden" name="film_id" value="<%=data.getIdFilm()%>">
			<input type="submit" value="선택" style="font-size:10pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:12px">
			</form>
		</td>
	</tr>
	<%
		}
	%>
</table>
</center>
</body>
</html>