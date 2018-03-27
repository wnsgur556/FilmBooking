<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<% String tmp = request.getParameter("film_id");%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크 및 회원 가입</title>
</head>
<body>
<jsp:useBean id="joinMember" class="Cinema.Member"></jsp:useBean>
<jsp:setProperty name="joinMember" property="ID"></jsp:setProperty>
<jsp:setProperty name="joinMember" property="password"></jsp:setProperty>
<jsp:setProperty name="joinMember" property="age"></jsp:setProperty>
<jsp:setProperty name="joinMember" property="registerDate"></jsp:setProperty>
<%
	DBController db = new DBController();
	/* 중복 */
	if (db.idCheck(joinMember.getID())) {
		String resultMsg = ""; 
		resultMsg += "<script type='text/javascript'>";
		resultMsg += "alert('ID가 중복됩니다. 다른 ID를 선택해주세요!');";
		resultMsg += "window.location.href='join_member.jsp";
		resultMsg += "?film_id="+tmp+"'";
		resultMsg += "</script>"; 
		out.print(resultMsg);
	}
	/* 회원가입 진행 */
	else {
		db.joinMember(joinMember);
		String resultMsg = "";
		resultMsg += "<script type='text/javascript'>"; 
		resultMsg += "alert('회원 가입이 되었습니다!');";
		resultMsg += "window.location.href='login_member.jsp";
		resultMsg += "?film_id="+tmp+"'";
		resultMsg += "</script>"; 
		out.print(resultMsg);
	}
%>
</body>
</html>