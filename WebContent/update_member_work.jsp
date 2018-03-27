<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정 작업 페이지</title>
</head>
<body>
<jsp:useBean id="memInfo" class="Cinema.Member"></jsp:useBean>
<jsp:setProperty name="memInfo" property="idMem"></jsp:setProperty>
<jsp:setProperty name="memInfo" property="password"></jsp:setProperty>
<jsp:setProperty name="memInfo" property="age"></jsp:setProperty>
<%
	DBController db = new DBController();
	db.updateMember(memInfo.getIdMem(), memInfo.getPassword(), memInfo.getAge());
	String resultMsg = "";
	resultMsg += "<script type='text/javascript'>"; 
	resultMsg += "alert('회원 정보가 변경되었습니다!');";
	resultMsg += "window.location.href='resv_film_list.jsp";
	resultMsg += "?idMem="+memInfo.getIdMem()+"'";
	resultMsg += "</script>";
	out.print(resultMsg);
%>
</body>
</html>