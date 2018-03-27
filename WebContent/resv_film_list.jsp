<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 결제 및 회원 정보 수정</title>
</head>
<body>
<jsp:useBean id="filmResv" class="Cinema.FilmResv"></jsp:useBean>
<jsp:setProperty name="filmResv" property="idMem"></jsp:setProperty>
<%
	DBController db = new DBController();
	ArrayList<FilmResv> datas = db.getResvFilmList(filmResv.getIdMem());
%>
<center>
<table width="80%" cellpadding="3" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr align="center">
		<td bgcolor="peachpuff"><a href=update_member.jsp?idMem=<%= filmResv.getIdMem()%>><font size="2">회원정보 변경</font></a></td>
		<td bgcolor="peachpuff"><a href=film_list.jsp><font size="2">로그아웃</font></a></td>
	</tr>
</table>

<table width="80%" cellpadding="6" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th><font color="MediumSlateBlue">영화 제목</font></th>
		<th><font color="MediumSlateBlue">상영 기간</font></th>
		<th><font color="MediumSlateBlue">예약일</font></th>
		<th><font color="MediumSlateBlue">좌석 번호</font></th>
		<th><font color="MediumSlateBlue">예약 상황</font></th>
		<th><font color="MediumSlateBlue">결제</font></th>
		<th><font color="MediumSlateBlue">취소</font></th>
	</tr>
	<%
		for (FilmResv data : (ArrayList<FilmResv>)datas) {
	%>
	<tr align="center">
		<td bgcolor="MintCream" style="width:14%"><%= data.getTitle()%></td>
		<td style="width:19%"><%= data.getDate()%></td>
		<td bgcolor="MintCream" style="width:14%"><%= data.getResvDate()%></td>
		<td style="width:14%"><%= data.getSeatNum()%></td>
		<td bgcolor="MintCream" style="width:14%"><%= data.getStatus()%></td>
		<td align=center style="width:14%">
			<form name=form1 method=post action="payment_film.jsp">
				<input type="hidden" name="idResv" value="<%= data.getIdResv()%>">
				<input type="hidden" name="idMem" value="<%= data.getIdMem()%>">
				<input type="submit" value="결제" style="font-size:7pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
			</form>
		</td>
		<td align=center style="width:19%">
			<form name=form2 method=post action="resv_film_cancel_work.jsp">
				<input type="hidden" name="idResv" value="<%= data.getIdResv()%>">
				<input type="hidden" name="idMem" value="<%= data.getIdMem()%>">
				<input type="hidden" name="idFilm" value="<%= data.getIdFilm()%>">
				<input type="hidden" name="seatNum" value="<%= data.getSeatNum()%>">
				<input type="submit" value="예매내역 삭제" style="font-size:7pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
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