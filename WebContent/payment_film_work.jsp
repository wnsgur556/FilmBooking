<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예매 영화 결제 작업 페이지</title>
</head>
<body>
<jsp:useBean id="filmResv" class="Cinema.FilmResv"></jsp:useBean>
<jsp:setProperty name="filmResv" property="idResv"></jsp:setProperty>
<jsp:setProperty name="filmResv" property="idMem"></jsp:setProperty>
<%
	DBController db = new DBController();
	db.paymentFilm(filmResv.getIdResv());
	String resultMsg = "";
	resultMsg += "<script type='text/javascript'>"; 
	resultMsg += "alert('결제되었습니다!');";
	resultMsg += "window.location.href='resv_film_list.jsp";
	resultMsg += "?idMem="+filmResv.getIdMem()+"'";
	resultMsg += "</script>";
	out.print(resultMsg);
%>
</body>
</html>