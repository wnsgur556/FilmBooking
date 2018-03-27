<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 삭제</title>
</head>
<body>
<jsp:useBean id="delMember" class="Cinema.Member"></jsp:useBean>
<jsp:setProperty name="delMember" property="idMem"></jsp:setProperty>
<%
	DBController db = new DBController();
	db.deleteMember(delMember);
%>
<script language=javascript>
alert("회원이 삭제되었습니다!");
window.location.href='member_list_management.jsp';
</script>
</body>
</html>