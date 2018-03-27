<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 영화 결제</title>
</head>
<body>
<jsp:useBean id="filmResv" class="Cinema.FilmResv"></jsp:useBean>
<jsp:setProperty name="filmResv" property="idResv"></jsp:setProperty>
<jsp:setProperty name="filmResv" property="idMem"></jsp:setProperty>
<center>
<H2>카드 결제</H2>
<BR>
<table width="50%" cellpadding="5" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th bgcolor="MintCream">카드 번호</th>
		<td><input type="text" name="cardNum" maxlength="19" style="width:100%"></td>
	</tr>
	<tr>
		<th bgcolor="MintCream">유효 날짜</th>
		<td>
			<select name="month">
				<option value="1" selected="selected">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="year">
				<option value="2017" selected="selected">2017</option>
				<option value="2018">2018</option>
				<option value="2019">2019</option>
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
			</select>
		</td>
	</tr>
	<tr>
		<th bgcolor="MintCream">cvc번호</th>
		<td><input type="password" name="cvcNum" maxlength="3" style="width:100%"></td>
	</tr>
	<tr>
		<td align=center>
			<form name=form1 method=post action="payment_film_work.jsp">
				<input type="hidden" name="idResv" value="<%= filmResv.getIdResv()%>">
				<input type="hidden" name="idMem" value="<%= filmResv.getIdMem()%>">
				<input type="submit" value="결제" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
			</form>
		</td>
		<td align=center>
			<form name=form2 method=post action="resv_film_list.jsp">
				<input type="hidden" name="idMem" value="<%= filmResv.getIdMem()%>">
				<input type="submit" value="취소" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
			</form>
		</td>
	</tr>
</table>
</center>
</body>
</html>