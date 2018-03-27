<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 로그인</title>
</head>
<body>
<center>
<H2>로그인</H2>
<div style="position: relative;"><a href=join_member.jsp?film_id=<%= request.getParameter("film_id")%>><font size="2">회원가입</font></a></div>
<BR>
<script language="JavaScript">
	function check() {
		if (!document.form1.ID.value) {
			alert("ID를 입력하세요");
			return false;
		}
		if (!document.form1.password.value) {
			alert("Password를 입력하세요");
			return false;
		}
	}
</script>
<form name=form1 method=post action="login_member_work.jsp" onSubmit="return check()">
<input type="hidden" name="film_id" value="<%= request.getParameter("film_id")%>">
<table width="50%" cellpadding="5" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th bgcolor="MintCream">ID</th>
		<td><input type="text" name="ID" maxlength="20" style="width:100%; ime-mode:disabled"></td>
	</tr>
	<tr>
		<th bgcolor="MintCream">비밀번호</th>
		<td><input type="password" name="password" maxlength="20" style="width:100%"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="로그인" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
			<input type="reset" value="초기화" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>