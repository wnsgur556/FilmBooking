<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 추가 작업 페이지</title>
</head>
<body>
<jsp:useBean id="insFilm" class="Cinema.Film"></jsp:useBean>
<jsp:setProperty name="insFilm" property="*"></jsp:setProperty>
<%
	DBController db = new DBController();
	db.insertFilm(insFilm);
%>
<script language=javascript>
alert("영화가 추가되었습니다!");
window.location.href='film_list_management.jsp';
</script>
</body>
</html>