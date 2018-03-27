<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*" import="java.lang.reflect.Method"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 예약</title>
</head>
<body>
<jsp:useBean id="seatInfo" class="Cinema.FilmSeatStatus"></jsp:useBean>
<jsp:setProperty name="seatInfo" property="idFilm"></jsp:setProperty>
<jsp:useBean id="memInfo" class="Cinema.Member"></jsp:useBean>
<jsp:setProperty name="memInfo" property="ID"></jsp:setProperty>
<jsp:useBean id="filmInfo" class="Cinema.Film"></jsp:useBean>
<jsp:setProperty name="filmInfo" property="idFilm"></jsp:setProperty>
<%
	DBController db = new DBController();
	seatInfo = db.getSeatInfo(seatInfo.getIdFilm());
	memInfo = db.getMember(memInfo.getID()); // 회원 정보
	filmInfo = db.getFilm(filmInfo.getIdFilm()); // 영화 정보
	String status = "", funcName = "";
	boolean isResv = true;
	Method method;
%>
<center>
<H2><%= filmInfo.getTitle()%> 예매 상황</H2>
<div style="position: relative;"><a href=film_list.jsp><font size="2">다른 영화 선택하러 가기</font></a></div>
<BR>
<table width="80%" cellpadding="6" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th><font color="MediumSlateBlue">좌석 번호</font></th>
		<th><font color="MediumSlateBlue">좌석 현황</font></th>
		<th><font color="MediumSlateBlue">예매</font></th>
	</tr>
	<%
		for (int i = 1; i <= 9; i++) {
			funcName = "getS" + i;
			try {
				method = FilmSeatStatus.class.getMethod(funcName);
				int result = (Integer) method.invoke(seatInfo);
				if (result == 0 && memInfo.getAge() >= filmInfo.getAgePhase()) {
					status = "예매 가능";
					isResv = true;
				}
				else if (memInfo.getAge() < filmInfo.getAgePhase()) {
					status = "예매 불가능(관람가 나이 제한)";
					isResv = false;
				}
				else if (result == 1) {
					status = "예매 불가능(예약석)";
					isResv = false;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	%>
	<tr align="center">
		<td bgcolor="MintCream"><%= i%></td>
		<td><%= status%></td>
		<td>
			<form name=form1 method=post action="resv_film_work.jsp">
			<input type="hidden" name="idMem" value="<%= memInfo.getIdMem()%>">
			<input type="hidden" name="idFilm" value="<%= filmInfo.getIdFilm()%>">
			<input type="hidden" name="seatNum" value="<%= i%>">
			<%
				if (isResv) {
			%>
				<input type="submit" value="영화 예매" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:12px">
			<% 
				} else {
			%>
				<input type="submit" value="영화 예매" style="font-size:8pt;color:white;background-color:Gray;border:2px solid #336600;padding:12px" disabled>
			<%
				}
			%>
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