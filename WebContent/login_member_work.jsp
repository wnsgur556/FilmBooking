<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<% String tmp = request.getParameter("film_id");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 존재 확인 및 로그인</title>
</head>
<body>
<jsp:useBean id="loginMember" class="Cinema.Member"></jsp:useBean>
<jsp:setProperty name="loginMember" property="ID"></jsp:setProperty>
<jsp:setProperty name="loginMember" property="password"></jsp:setProperty>
<%
	DBController db = new DBController();
	String ID = loginMember.getID(), password = loginMember.getPassword();
	/* 로그인 진행 */
	if (db.memCheck(ID, password)) {
		String resultMsg = ""; 
		resultMsg += "<script type='text/javascript'>"; 
		resultMsg += "alert('로그인 되었습니다!');";
		resultMsg += "window.location.href='resv_film.jsp";
		resultMsg += "?idFilm="+tmp+"&ID="+ID+"'";
		resultMsg += "</script>"; 
		out.print(resultMsg);
	}
	/* ID와 Password가 다름 */
	else {
		String resultMsg = "";
		resultMsg += "<script type='text/javascript'>";
		resultMsg += "alert('ID나 Password를 확인해주세요!');";
		resultMsg += "window.location.href='login_member.jsp";
		resultMsg += "?film_id="+tmp+"'";
		resultMsg += "</script>"; 
		out.print(resultMsg);
	}
%>
</body>
</html>