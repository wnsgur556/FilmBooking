<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<center>
<H2>회원 가입</H2>
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
		if (document.form1.password.value != document.form1.passwordCheck.value) {
			alert("Password가 맞는지 확인하세요");
			return false;
		}
		if (!document.form1.age.value) {
			alert("나이를 입력하세요");
			return false;
		}
		if (!document.form1.registerDate.value) {
			alert("가입일을 입력하세요");
			return false;
		}
	}
</script>
<form name=form1 method=post action="join_member_work.jsp" onSubmit="return check()">
<input type="hidden" name="film_id" value="<%= request.getParameter("film_id")%>">
<table width="50%" cellpadding="3" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th align="left">ID</th>
		<td align="center"><input type="text" name="ID" maxlength="20" style="width:80%; ime-mode:disabled"></td>
	</tr>
	<tr>
		<th align="left">비밀번호</th>
		<td align="center"><input type="password" name="password" maxlength="20" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">비밀번호 확인</th>
		<td align="center"><input type="password" name="passwordCheck" maxlength="20" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">나이</th>
		<td align="center"><input type="text" name="age" maxlength="3" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">가입일</th>
		<td align="center"><input type="text" name="registerDate" maxlength="10" style="width:80%"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="submit" value="승인" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
			<input type="reset" value="초기화" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>