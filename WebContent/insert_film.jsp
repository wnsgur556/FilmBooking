<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="Cinema.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 추가</title>
</head>
<body>
<center>
<H2>Insert film</H2>
<BR>
<script language="JavaScript">
	function check() {
		if (!document.form1.title.value) {
			alert("영화 제목을 입력하세요");
			return false;
		}
		if (!document.form1.imageURL.value) {
			alert("이미지 URL을 입력하세요");
			return false;
		}
		if (!document.form1.agePhase.value) {
			alert("관람 가능 나이를 입력하세요");
			return false;
		}
		if (!document.form1.seatNum.value) {
			alert("총 좌석수를 입력하세요");
			return false;
		}
		if (!document.form1.date.value) {
			alert("등록일을 입력하세요");
			return false;
		}
	}
</script>
<form name=form1 method=post action="insert_film_work.jsp" onSubmit="return check()">
<table width="50%" cellpadding="3" cellspacing="0" align="center" border="1" style="border-collapse:collapse; border:1px gray solid">
	<tr>
		<th align="left">Title</th>
		<td align="center"><input type="text" name="title" maxlength="30" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">ImageURL</th>
		<td align="center"><input type="text" name="imageUrl" maxlength="100" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">Age</th>
		<td align="center"><input type="text" name="agePhase" maxlength="3" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">Total seat</th>
		<td align="center"><input type="text" name="seatNum" maxlength="1" style="width:80%"></td>
	</tr>
	<tr>
		<th align="left">Date</th>
		<td align="center"><input type="text" name="date" maxlength="15" style="width:80%"></td>
	</tr>
		<tr>
		<td colspan=2 align="center">
			<input type="submit" value="Submit" style="font-size:11pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
			<input type="reset" value="Reset" style="font-size:11pt;color:white;background-color:MidnightBlue;border:2px solid #336600;padding:10px">
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>