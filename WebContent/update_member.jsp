<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<jsp:useBean id="memInfo" class="Cinema.Member"></jsp:useBean>
<jsp:setProperty name="memInfo" property="idMem"></jsp:setProperty>
<center>
<H2>회원 정보 변경</H2>
<BR>
<script language="JavaScript">
	function check() {
		if (document.form1.ID.value) {
			alert("ID는 변경할 수 없습니다.");
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
	}
</script>
<form name=form1 method=post action="update_member_work.jsp" onSubmit="return check()">
<table width="50%" cellpadding="5" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th bgcolor="MintCream">ID</th>
		<td><input type="text" name="ID" maxlength="20" style="width:100%"></td>
	</tr>
	<tr>
		<th bgcolor="MintCream">비밀번호</th>
		<td><input type="password" name="password" maxlength="20" style="width:100%"></td>
	</tr>
	<tr>
		<th bgcolor="MintCream">비밀번호 확인</th>
		<td><input type="password" name="passwordCheck" maxlength="20" style="width:100%"></td>
	</tr>
	<tr>
		<th bgcolor="MintCream">나이</th>
		<td><input type="text" name="age" maxlength="3" style="width:100%"></td>
	</tr>
	<tr>
		<td colspan=2 align=right>
			<input type="hidden" name="idMem" value="<%= memInfo.getIdMem()%>">
			<input type="submit" value="승인" style="font-size:8pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>