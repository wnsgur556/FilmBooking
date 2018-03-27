<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 로그인</title>
</head>
<body>
<center>
<H2>관리자 페이지</H2>
<BR>
<script language="JavaScript">
	function check() {
		if (!document.form1.id.value) {
			alert("ID를 입력하세요");
			return false;
		}
		if (!document.form1.password.value) {
			alert("Password를 입력하세요");
			return false;
		}
		if (document.form1.id.value != "admin" || document.form1.password.value != "admin") {
			alert("ID나 Password가 틀렸습니다");
			return false;
		}
	}
</script>
<form name=form1 method=post action="film_list_management.jsp" onSubmit="return check()">
<table width="50%" cellpadding="5" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th bgcolor="MintCream">ID</th>
		<td><input type="text" name="id" maxlength="20" style="width:100%; ime-mode:disabled"></td>
	</tr>
	<tr>
		<th bgcolor="MintCream">Password</th>
		<td><input type="password" name="password" maxlength="20" style="width:100%"></td>
	</tr>
	<tr>
		<td colspan=2 align=right>
			<input type="submit" value="Log in" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>